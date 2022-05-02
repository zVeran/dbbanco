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
select * from tbbanco;
select * from tbagencia;

