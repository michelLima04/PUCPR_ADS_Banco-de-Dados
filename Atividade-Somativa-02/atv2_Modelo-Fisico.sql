--
-- 1° Fazendo o modelo físico
--
CREATE DATABASE atvs2;
USE atvs2;

CREATE TABLE Regiao(
    codRegiao BIGINT AUTO_INCREMENT PRIMARY KEY,
    nomeRegiao VARCHAR(100) NOT NULL,
    descRegiao TEXT
);

CREATE TABLE Vinicola (
    codVinicola BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeVinicola VARCHAR(100) NOT NULL,
    descVinicola TEXT,
    foneVinicola VARCHAR(20),
    emailVinicola VARCHAR(100),
    codRegiao BIGINT,
    FOREIGN KEY (codRegiao) REFERENCES Regiao(codRegiao)
);

CREATE TABLE Vinho (
    codVinho BIGINT PRIMARY KEY AUTO_INCREMENT,
    nomeVinho VARCHAR(100) NOT NULL,
    tipoVinho VARCHAR(50),
    anoVinho INT, -- O ano continua sendo um INT normal
    descVinho TEXT,
    codVinicola BIGINT,
    FOREIGN KEY (codVinicola) REFERENCES Vinicola(codVinicola)
);
--
-- 2° Inserindo dados
--
INSERT INTO Regiao (nomeRegiao, descRegiao) VALUES
('Vale dos Vinhedos', 'Principal e mais tradicional região vitivinícola do Brasil, localizada na Serra Gaúcha (RS).'),
('Campanha Gaúcha', 'Região de fronteira no RS, com relevo plano e clima ideal para o cultivo de uvas tintas.'),
('Serra Catarinense', 'Região de grande altitude em SC, famosa por seus vinhos brancos e espumantes de clima frio.'),
('Vale do São Francisco', 'Região tropical no Nordeste (BA/PE), única no mundo por produzir até duas safras de uva por ano.'),
('Serra da Mantiqueira', 'Região no Sudeste (MG/SP) que vem ganhando destaque com a técnica de colheita de inverno.');

INSERT INTO Vinicola (nomeVinicola, descVinicola, foneVinicola, emailVinicola, codRegiao) VALUES
('Casa Valduga', 'Tradicional vinícola familiar e pioneira no enoturismo no Brasil.', '(54) 2105-3122', 'contato@casavalduga.com.br', 1),
('Guatambu Estância do Vinho', 'Vinícola boutique movida a energia solar, com forte foco em sustentabilidade.', '(53) 3243-3295', 'visita@guatambuvinhos.com.br', 2),
('Villa Francioni', 'Referência em vinhos de altitude com infraestrutura e arte integradas.', '(49) 3233-8200', 'atendimento@villafrancioni.com.br', 3),
('Rio Sol', 'Produz vinhos e espumantes premiados no paralelo 8, no semiárido nordestino.', '(81) 3326-5780', 'contato@vinhosriosol.com.br', 4),
('Vinícola Guaspari', 'Pioneira no uso da técnica de dupla poda (colheita de inverno) no Sudeste.', '(19) 3661-4669', 'contato@vinicolaguaspari.com.br', 5);

INSERT INTO Vinho (nomeVinho, tipoVinho, anoVinho, descVinho, codVinicola) VALUES
('Villa Lobos Cabernet Sauvignon', 'Tinto Seco', 2020, 'Vinho encorpado em homenagem ao maestro, com longa passagem por barrica.', 1),
('Rastros do Pampa Tannat', 'Tinto Seco', 2021, 'Tannat super premiado, estruturado e que expressa o terroir da Campanha.', 2),
('VF Rosé', 'Rosé Seco', 2022, 'Corte clássico, fresco e muito elegante. É o vinho rosé mais famoso da serra catarinense.', 3),
('Rio Sol Syrah', 'Tinto Seco', 2021, 'Expressão única do semiárido nordestino, muito frutado e com leve toque de especiarias.', 4),
('Syrah Vista do Chá', 'Tinto Seco', 2019, 'Ícone da colheita de inverno, encorpado e multipremiado internacionalmente.', 5);

--
-- 3° Consultar nome e ano do vinho, nome da vinícola e nome da região 
--
SELECT 
    VIN.nomeVinho      AS 'Nome do Vinho',
    VIN.anoVinho       AS 'Ano da Safra',
    VINIC.nomeVinicola AS 'Vinicola',
    REG.nomeRegiao     AS 'Regiao'
FROM Vinho VIN
INNER JOIN Vinicola VINIC 
  ON VIN.codVinicola = VINIC.codVinicola
INNER JOIN Regiao REG 
  ON VINIC.codRegiao = REG.codRegiao;

--
-- 4° Gerenciar permissões e transações do usuário SOMMELIER
--
-- Criando usuário sommelier, com acesso ao seu servidor local, senha de acesso e permissão de fazer no máximo 40 consultas p/ hora.
CREATE USER 'sommelier'@'localhost' IDENTIFIED BY 'S3nh4V1nh0!' WITH MAX_QUERIES_PER_HOUR 40; 

-- Concede ao usuário sommelier permissão apenas de consultar na tabela Vinho.
GRANT SELECT ON atvs2.Vinho TO 'sommelier'@'localhost';

-- Concede ao usuário sommelier permissão apenas de consultar as colunas 'codVinicola' e 'nomeVinicola' da tabela Vinicola.
GRANT SELECT (codVinicola, nomeVinicola) ON atvs2.Vinicola TO 'sommelier'@'localhost';

-- Efetiva as Regras de Permissão/Transações imediatamente
FLUSH PRIVILEGES;
