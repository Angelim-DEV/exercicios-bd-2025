create database dbloja;
use dbloja;

create table tbbairro (
bairroid int primary key auto_increment,
bairro varchar(200) not null
);

create table tbcidade(
cidadeid int auto_increment primary key,
cidade varchar(200) not null
);

create table tbestado(
ufid int primary key auto_increment,
uf char(2) not null
);

create table tbfornecedor(
codigo int auto_increment primary key, /*já obriga 10 dígitos*/
cnpj decimal (14) unique,
nome varchar(200) not null,
telefone decimal (11) null
);

create table tbproduto(
codigobarras decimal(14) primary key,
nome varchar(200) not null,
valor decimal (8,2) not null,
qtd int null
);

create table tbnota_fiscal(
nf int primary key,
totalnota decimal (8,2) not null,
dataemissao date not null
);

create table tbcompra(
notafiscal int primary key,
datacompra date not null,
valortotal decimal (6,2) not null,
qtdtotal int not null,
codigo int auto_increment,
foreign key (codigo) references tbfornecedor (codigo)
);

create table tbendereco(
logradouro varchar (200) not null,
cep decimal(8) primary key,
bairroid int not null,
foreign key (bairroid) references tbbairro (bairroid),
cidadeid int not null,
foreign key (cidadeid) references tbcidade (cidadeid),
ufid int not null,
foreign key (ufid) references tbestado (ufid)
);

create table tbitemcompra(
notafiscal int,
foreign key(notafiscal) references tbcompra (notafiscal),
codigobarras decimal (14,0) ,
foreign key (codigobarras) references tbproduto (codigobarras),
primary key (notafiscal, codigobarras),
valoritem decimal (8,2) not null,
qtd int not null
);

create table tbcliente(
id int primary key auto_increment,
nomecli varchar(200) not null,
numend decimal(6,0) not null,
compend varchar (50),
cepcli decimal(8,0) not null,
foreign key (cepcli) references tbendereco (cep)
);

create table tbclientepf(
cpf decimal (11,0) primary key,
rg decimal(9,0) not null,
rg_dig char(1) not null,
nasc date not null,
id int null,
foreign key (id) references tbcliente (id)
);

create table tbclientepj(
cnpj decimal(14) primary key,
ie decimal(11) unique,
id int null,
foreign key (id) references tbcliente (id)
);

create table tbvenda(
numerovenda int primary key,
datavenda date not null,
totalvenda decimal(8,2) not null,
id_cli int not null auto_increment,
foreign key (id_cli) references tbcliente (id),
nf int null,
foreign key (nf) references tbnota_fiscal (nf)
);

create table tbitemvenda(
numerovenda int,
foreign key(numerovenda) references tbvenda (numerovenda),
codigobarras decimal(14,0),
foreign key (codigobarras) references tbproduto (codigobarras),
valoritem decimal(8,2) not null,
primary key (numerovenda, codigobarras),
qtd int not null
);

