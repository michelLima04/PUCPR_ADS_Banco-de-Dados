-- CREATES

CREATE SCHEMA `atvs1` DEFAULT CHARACTER SET utf8;
USE atvs1;

CREATE TABLE  atvs1.Cliente_Endereco (
	CEP VARCHAR(45) NOT NULL PRIMARY KEY,
    Logradouro VARCHAR(100) NOT NULL,
    Bairro VARCHAR(45) NOT NULL,
    Municipio VARCHAR(45) NOT NULL,
    UF VARCHAR(2) NOT NULL
);

CREATE TABLE atvs1.Entregador (
    Cod_Entregador INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL
);

CREATE TABLE atvs1.Entregador_Telefone (
    Cod_Entregador INT NOT NULL,
    Telefone VARCHAR(45) NOT NULL,
    PRIMARY KEY (Cod_Entregador, Telefone), -- Chave PK composta
	FOREIGN KEY (Cod_Entregador) REFERENCES Entregador (Cod_Entregador)
);

CREATE TABLE atvs1.Sanduiche (
    Cod_Item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL -- 2 casas decimais para valor monetário
);

CREATE TABLE atvs1.Cliente (
	Cod_Cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    Numero VARCHAR(45) NOT NULL,
    Complemento VARCHAR(45), 
    CEP VARCHAR(45) NOT NULL,
	FOREIGN KEY (CEP) REFERENCES Cliente_Endereco (CEP)
);

CREATE TABLE  atvs1.Cliente_Telefone (
	Cod_Cliente INT NOT NULL,
    Telefone VARCHAR(45) NOT NULL,
    PRIMARY KEY (Cod_Cliente, Telefone), -- Criando aqui a Chave PK composta
	FOREIGN KEY (Cod_Cliente) REFERENCES Cliente (Cod_Cliente)
);

CREATE TABLE atvs1.Pedido (
    Cod_Pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DH_Pedido DATETIME NOT NULL,
    `Status` TINYINT NOT NULL,
    Cod_Cliente INT NOT NULL,
    Cod_Entregador INT NULL,
	FOREIGN KEY (Cod_Cliente)    REFERENCES Cliente (Cod_Cliente),
	FOREIGN KEY (Cod_Entregador) REFERENCES Entregador (Cod_Entregador)
);

CREATE TABLE atvs1.Itens_Pedido (
    Cod_Pedido INT NOT NULL,
    Cod_Item INT NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (Cod_Pedido, Cod_Item), -- Chave PK composta
	FOREIGN KEY (Cod_Pedido) REFERENCES Pedido (Cod_Pedido),
	FOREIGN KEY (Cod_Item)   REFERENCES Sanduiche (Cod_Item)
);

-- INSERT'S

INSERT INTO Cliente_Endereco (CEP, Logradouro, Bairro, Municipio, UF) VALUES
('80010-010', 'Rua XV de Novembro', 'Centro', 'Curitiba', 'PR'),
('80240-000', 'Avenida Silva Jardim', 'Batel', 'Curitiba', 'PR'),
('80530-000', 'Rua Mateus Leme', 'Centro Cívico', 'Curitiba', 'PR');

INSERT INTO Entregador (Cod_Entregador, Nome) VALUES
(1, 'Carlos Silva'),
(2, 'Roberto Souza');

INSERT INTO Entregador_Telefone (Cod_Entregador, Telefone) VALUES
(1, '(41) 99999-1111'),
(2, '(41) 98888-2222');

INSERT INTO Sanduiche (Nome, Preco) VALUES
('X-Bacon', 28.50),
('X-Salada', 22.00),
('X-Tudo', 35.90);

INSERT INTO Cliente (Nome, Numero, Complemento, CEP) VALUES
('Michel Lima', '150', 'Apto 42', '80010-010'),
('Eliane Melo', '300', NULL, '80240-000'),
('Benji Olino', '1020', 'Casa 5', '80530-000');

INSERT INTO Cliente_Telefone (Cod_Cliente, Telefone) VALUES
(1, '(41) 97777-3333'), -- Cliente Michel possui 1 telefone
(2, '(41) 96666-4444'), -- Cliente Eliane possue 2 telefones
(2, '(41) 3333-0000'),  
(3, '(41) 95555-5555'); -- Cliente Benji possui 1 telefone

INSERT INTO Pedido (DH_Pedido, `Status`, Cod_Cliente, Cod_Entregador) VALUES
('2026-04-02 19:30:00', 2, 1, 1),    -- Pedido do Michel, já entregue pelo Carlos
('2026-04-02 20:00:00', 1, 2, 2),    -- Pedido da Eliane, será entrega pelo Roberto
('2026-04-02 20:10:00', 0, 3, NULL); -- Pedido do Benji, em preparação (Ainda sem entregador)

INSERT INTO Itens_Pedido (Cod_Pedido, Cod_Item, Quantidade) VALUES
(1, 1, 2), -- Pedido 1: pediu 2 unidades do Sanduíche 1 (X-Bacon)
(2, 3, 1), -- Pedido 2: pediu 1 unidade do Sanduíche 3 (X-Tudo)
(3, 2, 1), -- Pedido 3: pediu 1 unidade do Sanduíche 2 (X-Salada)
(3, 1, 1); -- Pedido 3: adicionou mais 1 unidade do Sanduíche 1 (X-Bacon)

-- SELECT -> Listar pedidos que estão em preparação
SELECT *
FROM Pedido 
WHERE Status = 0;



