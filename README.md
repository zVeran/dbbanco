# dbbanco EX1 com schemas
exercício aula 02/05 (CONTINUAÇÃO - 09/05) 


create database dbdistribuidora; 
 use dbdistribuidora; 
  
 create table tbestado( 
         estado char(2) primary key not null 
 ); 
  
 create table tbcidade( 
         idcidade int primary key auto_increment, 
     cidade varchar(50), 
     estado char(2), 
     foreign key (estado) references tbestado(estado) 
 ); 
  
 create table tblog( 
     logradouro varchar(100) not null, 
     bairro varchar(50), 
     cep int primary key, 
     idcidade int, 
     foreign key (idcidade) references tbcidade(idcidade) 
 ); 
  
 create table tbendereco( 
         IDendereco int primary key auto_increment, 
     compEndereco int, 
     cep int, 
     foreign key (cep) references tblog(cep) 
 ); 
  
 create table tbpessoa( 
         idCli int primary key auto_increment, 
     nomeCli varchar(100), 
     sexoCli char(1), 
     telPessoa int not null, 
         numLog int, 
     IDendereco int, 
     foreign key (IDendereco) references tbendereco(IDendereco) 
 ); 
  
 create table tbclientePJ( 
         cnpj bigint not null primary key, 
     IE bigint not null, 
     idCli int, 
     foreign key (idCli) references tbpessoa(idCli) 
 ); 
  
 CREATE TABLE tbclientePF ( 
     cpf BIGINT NOT NULL PRIMARY KEY, 
     dataNasc DATE, 
     idCli INT, 
     FOREIGN KEY (idCli) 
         REFERENCES tbpessoa (idCli) 
 ); 
  
 ---------- 
 create table tbfornecedor( 
         codFornecedor int auto_increment primary key, 
     cnpj bigint not null, 
     nomeFornecedor varchar(100) not null, 
     tel int not null 
 ); 
  
 create table tbproduto( 
         codigoBarras bigint not null primary key, 
     nomeProd varchar(50) not null, 
     valorUnit decimal(7,2), 
     qtd int 
 ); 
  
 create table tbprodutoComprado ( 
         codigoBarras 
     NotaFiscal 
 ); 
  
 create table tbcompra( 
         NotaFiscal int primary key not null, 
     dataCompra date, 
     valorTotal decimal(7,2), 
     qtdTotal int, 
     codFornecedor int, 
     codigoBarras bigint, 
     foreign key (codFornecedor) references tbfornecedor(codFornecedor), 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 create table tbestoque( 
         idestoque int auto_increment primary key, 
         qtd int, 
     valorItem decimal(7,2), 
     codigoBarras bigint, 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 ---------------------------- 
  
 create table tbNF( 
         NF int auto_increment primary key, 
     totalNota decimal(7,2), 
     dataEmissao date, 
     codigoBarras bigint, 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 create table tbvenda( 
         numeroVenda int primary key not null auto_increment, 
     dataVenda date, 
     totalVenda decimal(7,2), 
     qtd int, 
     NF int, 
     idCli int, 
     foreign key (NF) references tbNF(NF), 
     foreign key (idCli) references tbpessoa(idCli) 
 );
