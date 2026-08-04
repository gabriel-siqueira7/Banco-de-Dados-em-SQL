/*
Atividade proposta módulo 10
*/

create database restaurante;
use restaurante;

-- tabela funcionários

create table funcionarios(
id_funcionario int auto_increment primary key,
nome varchar(255),
CPF varchar(14),
daya_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
cargo varchar(100),
salario decimal(10, 2),
data_admissao date); -- data de admissão do funcionário

-- tabela clientes

create table clientes(
id_cliente int auto_increment primary key,
nome varchar(255),
cpf varchar(14),
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
data_cadastro date); -- data em que o cliente foi cadastrado no sistema


-- tabela de produto

create table produtos(
id_produto int auto_increment primary key,
nome varchar(255),
descricao text,
preco decimal(10, 2),
categoria varchar(100)); -- categoria do produto. Ex: bebidas, entrada, prato principal, sobremesa

-- tabela de pedidos

create table pedidos(
id_pedido int auto_increment primary key,
id_cliente int,
id_funcionario int,
id_produto int,
quantidade int,
preco decimal(10, 2),
data_pedido date,
status_pedido varchar(50), -- pendente, concluído ou cancelado

foreign key (id_cliente) references clientes(id_cliente),
foreign key (id_funcionario) references funcionarios(id_funcionario),
foreign key (id_produto) references produtos(id_produto)); -- 1º resolver os 'ids com int'. Depois fazer separados as chaves estrangeiras 'foreign key'. Cuidar para usar as palavras exatamente igual como estão nas outras tabelas.

-- tabelas adicionais dos produtos

create table info_produtos(
id_info int auto_increment primary key,
id_produto int,
ingredientes text,
fornecedor varchar(255),

foreign key (id_produto) references produtos(id_produto));

