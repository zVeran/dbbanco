create database dbBANCO; 
use dbBANCO;  

create table tbcliente(
cpf bigint primary key,
nome varchar(50) not null,
sexo char(1) not null,
endereco varchar (50) not null,
E_mail varchar(100)
);
create table tbconta(
numeroConta int primary key,
saldo decimal (7,2),
TipoConta smallint, 
NumeroAgencia int not null,
foreign key (NumeroAgencia) references tbagencia(NumeroAgencia)
);
alter table tbconta add NumeroAgencia int not null;
alter table tbconta add foreign key (NumeroAgencia) references tbagencia(NumeroAgencia);

create table tbbanco(
Codigo int primary key,
nome varchar(50)
);

create table tbtelefone_cliente(
cpf bigint,
foreign key (cpf) references tbcliente(cpf),
telefone int primary key
);


create table tbhistorico(
cpf bigint,
numeroConta int,
foreign key (cpf) references tbcliente(cpf),
foreign key (numeroConta) references tbconta(numeroConta),
DataInicio date,
primary key(cpf, numeroConta)
);
create table tbagencia(
Codigo int null, 
foreign key(Codigo) references tbbanco(Codigo),
NumeroAgencia int primary key,
endereco varchar(50)
); 
insert into tbbanco(codigo, nome)
values ('1', 'Banco do Brasil'),
('104', 'Caixa Econômica Federal'),
('801', 'Banco Escola');

insert into tbagencia(Codigo, NumeroAgencia, endereco)
values ('1', '123', 'Av Paulista, 78'),
('104', '159', 'Rua Liberdade, 124'),
('801', '401', 'Rua Vinte três. 23'),
('801', '435', 'Av Marechal, 68');

insert into tbcliente(cpf, nome, sexo, endereco)
values('12345678910', 'Enildo', 'M', 'Rua Grande, 75'),
('12345678911', 'Astrogildo', 'M', 'Rua Pequena, 789'),
('12345678912', 'Monica', 'F', 'Av Larga, 148'),
('12345678913', 'Cascâo', 'M', 'Av Principal, 369');

insert into tbconta(numeroConta, saldo, TipoConta, NumeroAgencia)
values('9876', '456.05','1', '123'),
('9877', '321.00', '1', '123'),
('9878', '100.00', '2', '435'),
('9879', '5589.89', '1', '401');

insert into tbhistorico(cpf, numeroconta, datainicio)
values('12345678910', '9876', '2001-04-15'),
('12345678911', '9877', '2011-03-10'),
('12345678912', '9878', '2021-03-11'),
('12345678913', '9879', '2000-07-05');

insert into tbtelefone_cliente(cpf, telefone)
values('12345678910', '912345678'),
('12345678911', '912345679'),
('12345678912', '912345680'),
('12345678913', '912345681');
alter table tbconta drop column NumAgencia;
describe tbconta;

alter table tbcliente add e_mail varchar(100);
select * from tbcliente where nome = 'Monica'; 
select numeroagencia, endereco from tbagencia; 
select * from tbcliente where sexo = 'M'; 




select * from tbbanco;
select * from tbagencia;
