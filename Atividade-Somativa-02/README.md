# Atividade Somativa: Sistema de Gestão Vitivinícola 🍷🍇

Este projeto prático foca na implementação de um banco de dados relacional para gerenciar o catálogo de vinhos, vinícolas e regiões vitivinícolas. O desafio central foi transformar uma arquitetura de dados pré-definida em scripts SQL funcionais, abrangendo criação de tabelas, manipulação de dados, consultas interligadas e controle de acessos.

## 📋 Cenário do Projeto

O sistema gerencia:
* **Regiões:** Cadastro de regiões e seus respectivos terroirs.
* **Vinícolas:** Registro de produtoras e o vínculo com a região onde estão localizadas.
* **Vinhos:** Portfólio detalhado (tipo, safra, etc.) e a qual vinícola pertencem.
* **Segurança:** Gerenciamento de permissões para usuários específicos (ex: Sommelier).

## 🏗️ Estrutura e Desenvolvimento

Para este projeto, as etapas de modelagem foram divididas da seguinte forma:

### 1. Modelos Conceitual e Lógico (Base Fornecida)
A arquitetura de dados inicial — definindo entidades, relacionamentos e chaves (PK/FK) — foi fornecida como base estrutural pelo professor da disciplina. 

Para facilitar o entendimento das regras de negócio que precisei implementar no banco, disponibilizei as imagens desses diagramas estruturais aqui:

#### Modelo Conceitual
<img width="526" height="289" alt="atv2_Modelo-Conceitual" src="https://github.com/user-attachments/assets/8c161c67-b8d0-4bc1-9017-7a854502f685" />

#### Modelo Lógico
<img width="595" height="399" alt="atv2_Modelo-Logico" src="https://github.com/user-attachments/assets/2b2772b4-a45f-4557-a28b-2bdeac0bc80e" />

### 2. Modelo Físico e Scripts SQL (Minha Implementação 🚀)
Toda a execução prática e escrita de código do projeto foi desenvolvida por mim, utilizando a linguagem SQL. Minha entrega consistiu em:

* **DDL (Data Definition Language):** Criação do banco `atvs2` e estruturação rigorosa das tabelas, garantindo a integridade referencial exigida pelo modelo lógico.
* **DML (Data Manipulation Language):** População do banco com dados reais de vinícolas brasileiras para validação do sistema.
* **DQL (Data Query Language):** Construção de consultas otimizadas utilizando `INNER JOIN` para unificar informações de Vinhos, Vinícolas e Regiões em uma única extração.
* **DCL (Data Control Language):** Implementação de regras de segurança, criando o usuário `sommelier` com limite de tráfego (`MAX_QUERIES_PER_HOUR`) e restrição de acesso a tabelas e colunas específicas via comandos `GRANT`.

📁 **Confira o script SQL completo:** **[Modelo-Fisico.sql](./src/Modelo-Fisico.sql)**

## 🛠️ Tecnologias Utilizadas

* **Linguagem SQL (MySQL):** DDL, DML, DQL e DCL.
* Modelagem de Dados Relacional.

## 👨‍💻 Autor

**Michel Urban Rosendo de Lima**
Estudante de Análise e Desenvolvimento de Sistemas (PUCPR)
