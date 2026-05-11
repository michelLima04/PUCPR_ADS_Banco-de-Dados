# Atividade Somativa 1: Sistema de Delivery (Lanchonete) 🍔🛵

Este projeto consiste na modelagem e implementação de um banco de dados para gerenciar o sistema de delivery de uma lanchonete. O desafio percorreu todas as etapas de design de dados, desde o entendimento das regras de negócio até a execução de consultas SQL.

## 📋 Cenário Proposto

A lanchonete necessitava de um sistema para gerenciar:
* **Cardápio:** Cadastro de sanduíches e preços.
* **Clientes:** Registro de dados pessoais e endereços de entrega.
* **Pedidos:** Controle de itens, quantidades, data e status (Em preparação, Em entrega, Entregue).
* **Logística:** Cadastro de entregadores e vínculo com os pedidos realizados.

## 🏗️ Modelagem de Dados

O desenvolvimento seguiu as três etapas fundamentais da arquitetura de dados:

### 1. Modelo Conceitual
A primeira etapa focou na identificação das entidades (Cliente, Pedido, Sanduíche, Entregador) e seus relacionamentos (1:N e N:N), garantindo que a lógica de negócio fosse capturada corretamente.

<img width="781" height="440" alt="Modelo_conceitual" src="https://github.com/user-attachments/assets/284bb357-0f78-4ce7-b44f-2764d5b25931" />

### 2. Modelo Lógico
Nesta etapa, as abstrações foram convertidas em estruturas de tabelas, definindo chaves primárias (PK), chaves estrangeiras (FK) e aplicando regras de normalização para garantir a integridade dos dados e evitar redundâncias.

<img width="894" height="524" alt="modelo_lógico" src="https://github.com/user-attachments/assets/3238610c-c64e-4990-ad8b-69fa5583198f" />

### 3. Modelo Físico (SQL)
A implementação final foi realizada utilizando scripts SQL, incluindo:
* **DDL (Data Definition Language):** Criação do esquema e das tabelas com os tipos de dados adequados e restrições de integridade.
* **DML (Data Manipulation Language):** Inserção de dados de teste para validar a estrutura.
* **DQL (Data Query Language):** Desenvolvimento de consultas específicas para extração de informações (ex: listagem de pedidos pendentes).

O script completo está disponível neste repositório no arquivo: 📁 **[Modelo-Fisico.sql](./Modelo-Fisico.sql)**

## 🛠️ Tecnologias Utilizadas

* **brModelo:** Para a modelagem conceitual.
* **MySQL Workbench:** Para a modelagem lógica e desenvolvimento dos scripts SQL.
* **Linguagem SQL:** Para a implementação física.

## 👨‍💻 Autor

**Michel Urban Rosendo de Lima**
Estudante de Análise e Desenvolvimento de Sistemas
