CREATE DATABASE LocadoraSeven;

USE LocadoraSeven;

CREATE TABLE Categoria(
cod_categoria int primary key auto_increment,
nome_categoria varchar(30),
valor_categoria varchar(20),
descricao_categoria varchar(100));

CREATE TABLE Marca(
cod_marca int primary key auto_increment,
nome_marca varchar(30));

CREATE TABLE Seguro(
cod_seguro int primary key auto_increment,
valor_seguro varchar(20),
descricao_seguro varchar(100),
nivel_seguro varchar(20));

CREATE TABLE Veiculo(
cod_veiculo int primary key auto_increment,
cod_categoria int references Categoria(cod_categoria),
cod_marca int references Marca(cod_marca),
cod_seguro int references Seguro(cod_seguro),
placa_veiculo varchar(15),
chassi_veiculo varchar(30),
modelo_veiculo varchar(30)
);

CREATE TABLE Manutencao(
cod_manutencao int primary key auto_increment,
cod_veiculo int references Veiculo(cod_veiculo),
descricao_manutencao varchar(50));

CREATE TABLE Reserva(
cod_reserva int primary key auto_increment,
cod_veiculo int references Veiculo(cod_veiculo),
data_reserva date,
previsao_retorno date);

CREATE TABLE Locacao(
cod_locacao int primary key auto_increment,
cod_reserva int references Reserva(cod_reserva),
data_locacao date,
valor_locacao varchar(20));

CREATE TABLE Pagamento(
cod_pagamento int primary key auto_increment,
cod_locacao int references Locacao(cod_locacao),
acrescimos_multa varchar(40),
forma_pagamento varchar(25) not null,
valor_transferencia varchar(20),
valor_credito varchar(20),
valor_total varchar(20));

CREATE TABLE Funcionario(
cod_funcionario int primary key auto_increment,
nome_funcionario varchar(50) not  null,
data_nascimento date not null,
email_funcionario varchar(30) not null,
cpf_funcionario varchar(15) not null,
sexo_funcionario varchar(10),
usuario varchar(20) not null,
senha varchar(15) not null,
nivel_login int);

insert into funcionario(cod_funcionario,nome_funcionario,data_nascimento,email_funcionario,cpf_funcionario,sexo_funcionario,usuario,senha,nivel_login) values (default,"jose","2001-03-02","jvoliveira@gmail.com","321.213.342-03","MASCULINO","jose123","12345",3);
select * from funcionario;
CREATE TABLE Cliente(
cpf_cliente varchar(15) primary key not null,
nome_cliente varchar(50) not null,
email_cliente varchar(30) not null,
data_nasc_cliente date not null,
cnh_cliente varchar(11) not null,
sexo_cliente varchar(10) not null,
logradouro varchar(50) not null,
numero varchar(10) not null,
CEP varchar(9) not null,
cidade varchar(50) not null,
UF varchar(5) not null,
bairro varchar(30) not null,
usuario varchar(20) not null,
senha varchar(15) not null,
nivel_login int not null);

CREATE TABLE Telefone(
cod_telefone int primary key auto_increment,
cod_funcionario int references Funcionario(cod_funcionario),
cod_cliente int references Cliente(cod_cliente),
numero_tel int not null,
numero_cel int not null);

create table login(
cpf_cliente varchar(15) null references cliente(cpf_cliente),
cod_funcionario int null references funcionario(cod_funcionario),
usuario varchar(20),
senha varchar(15),
nivel int);

create trigger tr_login after insert
on cliente
for each row
insert into login(cpf_cliente,usuario,senha,nivel) values(new.cpf_cliente,new.usuario,new.senha,new.nivel_login);

create trigger tr_login_func after insert
on funcionario
for each row
insert into login(cod_funcionario,usuario,senha,nivel) values(new.cod_funcionario,new.usuario,new.senha,new.nivel_login);
select * from login;


SELECT * FROM Categoria;

SELECT * FROM Marca;

SELECT * FROM Seguro;

SELECT * FROM Veiculo;

SELECT * FROM Manutencao;

SELECT * FROM Reserva;

SELECT * FROM Locacao;

SELECT * FROM Pagamento;

SELECT * FROM Funcionario;

SELECT * FROM Cliente;

SELECT * FROM Login;

SELECT * FROM Endereco;

SELECT * FROM Telefone;