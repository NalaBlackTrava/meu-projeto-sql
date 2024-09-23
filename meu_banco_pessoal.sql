create database meu_banco;
USE meu_banco;
create table extrato_bancario (
	id INT auto_increment primary key,
    data DATE not null,
    descricao varchar(255) not null,
    valor decimal(10,2) not null,
    tipo_transacao ENUM('credito','debito') not null
);
 
insert into extrato_bancario (data, descricao, valor, tipo_transacao)
values
('2024-09-23', 'Cafe e comidinha no sesc', 15.00, 'debito'),
('2024-09-20', 'Bolsa', 1300.00, 'credito'),
('2024-09-23', 'KitKat Dark', 3.99, 'debito'),
('2024-09-23', 'Acaraje no prato', 25.00, 'debito'),
('2024-09-23', 'Itens de higiene na farmacia', 54.00, 'debito');

create table estoque_comida (
	id int auto_increment primary key,
    nome_produto varchar(255) not null,
    quantidade int not null,
    data_compra date,
    validade date
);

delete from extrato_bancario
where id=6;

select * from extrato_bancario
order by data desc;

select
	sum(case when tipo_transacao = 'credito' then valor else 0 end) as total_credito,
	sum(case when tipo_transacao = 'debito' then valor else 0 end) as total_debito,
	sum(case when tipo_transacao = 'credito' then valor else 0 end) -
    sum(case when tipo_transacao = 'debito' then valor else 0 end) as saldo_atual
from
	extrato_bancario;
    
alter table estoque_comida rename to inventario_pessoal;

alter table inventario_pessoal
add id_extrato int;

alter table inventario_pessoal
add foreign key (id_extrato) references extrato_bancario(id);
 
    