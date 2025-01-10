create database
create table cliente(
ID INT primary key auto_increment,
name text not null,
lastname text not null,
cpf varchar(14) not null unique,
idade int not null
)
select * from cliente

insert into cliente (name, lastname, cpf, idade) values ('tiran', 'teixeira', '622.124.982-45', 35)

create table category (
id INT primary KEY auto_increment,
name text not null
)
select * from category

update category set name = 'romance' where id = 1

create table item (
id INT primary key auto_increment,
category_id INT not null,
title TEXT not null,
type TEXT not null,
FOREIGN key(category_id) REFERENCES category(id)
)

select * from item

insert into item (category_id, title, type) values (3,'panico','filme')

create table locacao (
id INT primary key auto_increment,
id_cliente_locacao INT not null,
FOREIGN key(id_cliente_locacao) REFERENCES cliente(id),
id_funcionario INT not null,
FOREIGN key(id_funcionario) REFERENCES funcionario(id),
data_locacao date not null,
data_devolucao date not null
)

ALTER TABLE locacao RENAME COLUMN ID_CLIENTE_LOCACAO to id_cliente_locacao; --alterar coluna

select * from locacao

insert into locacao (id_cliente_locacao, id_funcionario, data_locacao, data_devolucao) value (1, 1,'2024-09-03', '2024-09-09')


create table funcionario (
id INT primary key auto_increment,
name text not null,
lastname text not null,
cpf varchar(14) not null unique
)
insert into funcionario ( name, lastname, cpf) values ('felipe', 'braga', '233.569.854-42')


select * from funcionario

create table locacao_item (
id_locacao int primary key not null,
FOREIGN key(id_locacao) REFERENCES locacao (id),
id_item int not null,
FOREIGN key(id_item) REFERENCES item (id),
quantidade int not null
)

select * from locacao_item
insert into locacao_item (id_locacao, id_item, quantidade) values (1, 1, 1)

create table pagamento (
id INT primary key auto_increment,
id_pagamento_locacao INT not null,
FOREIGN key(id_pagamento_locacao) REFERENCES locacao (id),
valor varchar(6) not null,
data Date not null
)

select * from pagamento
insert into pagamento (id_pagamento_locacao,valor, data) values (1, '18,60', '2024-09-05')

