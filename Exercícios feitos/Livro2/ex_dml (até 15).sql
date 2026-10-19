create database dbdistribuidora;
use dbdistribuidora;
create table tbfornecedor(
codigo int auto_increment primary key,
nome varchar(100) not null,
cnpj varchar (17) not null,
telefone varchar(20) not null
);

insert into tbfornecedor (nome, cnpj, telefone) /*n precisa de codigo por ser auto_increment*/
values ('Revenda Chico Loco', '12.456.789/371-23', '(11) 9 3456 7897'),
		('José Faz Tudo S/A', '13.456.789/371-23', '(11) 9 3456 7898'),
		('Vadalto Entregas', '14.456.789/371-23', '(11) 9 3456 7899'),
        ('Astrogildo das Estrela', '15.456.789/371-23', '(11) 9 3456 7800'),
        ('Amoroso e Doce', '16.456.789/371-23', '(11) 9 3456 7801'),
        ('Marcelo Dedal', '17.456.789/371-23', '(11) 9 3456 7802'),
        ('Franciscano Cachaça', '18.456.789/371-23', '(11) 9 3456 7803'),
        ('Joãozinho Chupeta', '19.456.789/371-23', '(11) 9 3456 7804');
        
DELIMITER $$
create procedure pcprocedurecidade()
BEGIN
	create table tbcidade(
    idcidade int auto_increment primary key,
    cidade varchar(100) not null
    );
    
    insert into tbcidade (cidade)
    values ('Rio de janeiro'),
			('São Carlos'),
            ('Campinas'),
            ('Franco da Rocha'),
            ('Osasco'),
            ('Pirituba'),
            ('Lapa'),
            ('Ponta Grossa');
END $$

DELIMITER $$
create procedure pcprocedureestado()
BEGIN 
	create table tbestado(
    ufid int auto_increment primary key,
    uf char(2) not null
    );
    
    insert into tbestado (uf)
    values ('sp'), ('rj'), ('rs');
    
END $$

DELIMITER $$
create procedure pcprocedurebairro()
BEGIN
	create table tbbairro(
    bairroid int auto_increment primary key,
    bairro varchar(50) not null
    );
    
    insert into tbbairro(bairro)
    values ('Aclimação'), ('Capão Redondo'), ('Pirituba'), ('Liberdade');
    
    END$$
    
    DELIMITER $$
    create procedure pcprocedureproduto()
    BEGIN
		create table tbproduto (
        codigobarras decimal(14) primary key,
        nome varchar(100) not null,
        valorunitario decimal (6,2) not null,
        quantidade int not null
        );
        
        insert into tbproduto (codigobarras, nome, valorunitario, quantidade)
        values (12345678910111,'Rei de Papel Mache', 54.61, 120),
				(12345678910112, 'Bolinha de sabão', 100.45, 120),
                (12345678910113, 'Carro bate', 44.00, 120),
                (12345678910114, 'Bola furada', 10.00, 120),
                (12345678910115, 'Maçã laranja', 99.44, 120),
                (12345678910116, 'Boneco do Hitler', 124.00, 200),
                (12345678910117, 'Farinha de Suruí', 50.00, 200),
                (12345678910118, 'Zelador de Cemitério', 24.50, 100);
                
	END $$
    
    DELIMITER $$
    create procedure pcprocedureendereco()
    BEGIN
		create table tbendereco (
        logradouro varchar(100) not null,
        bairro varchar(50) not null,
        cidade varchar(100) not null,
        uf char(2) not null,
        cep char(9) not null
        );
		
        insert into tbendereco (logradouro, bairro, cidade, uf, cep)
        values ('Rua da Federal', 'Lapa', 'São Paulo', 'sp', '12345-050'),
			('Av Brasil', 'Lapa', 'Campinas', 'sp', '12345-051'),
			('Rua Liberdade', 'Consolação', 'São Paulo', 'sp', '12345-052'),
            ('Av Paulista', 'Penha', 'Rio de Janeiro', 'rj', '12345-053'),
            ('Rua Ximbú', 'Penha', 'Rio de Janeiro', 'rj', '12345-054'),
            ('Rua Piu XI', 'Penha', 'Campinas', 'sp', '12345-055'),
            ('Rua de Chocolate', 'Aclimação', 'Barra Mansa', 'rj','12345-056'),
            ('Rua Pão na Chapa', 'Barra funda', 'Ponta grossa', 'rs', '12345-057');

END $$

DELIMITER $$
create procedure pcprocedureclientespf()
BEGIN
create table tbclientespf(
id int auto_increment not null primary key,
nomecli varchar(100) not null,
numend int not null,
compend varchar(10) null,
cep char(9) not null, 
cpf decimal(11) not null,
rg decimal(8) not null,
rg_dig char(1) not null,
nasc date not null,
logradouro varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null
);

insert into tbclientespf(nomecli, numend, compend, cep, cpf, rg, rg_dig, nasc, logradouro, bairro, cidade, uf)
values ('Pimpão', 325, Null, '12345-051', 12345678911, 12345678, '0', 12/10/2000, 'Av Brasil', 'Lapa', 'Campinas', 'SP' ),
	('Disney Chaplin', 89, 'Ap. 12', '12345-053', 12345678912, 12345679, '0', 21/11/2001, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ'),
    ('Marciano', 744, Null, '12345-054', 12345678913, 12345680, '0', 01/06/2001, 'Rua Ximbú', 'Penha Rio de Janeiro', 'RJ'),
    ('Lança Perfume', 128, Null, '12345-059', 12345678914, 12345681, 'X', 05/04/2004, 'Rua Veia Jardim Santa', 'Isabel Cuiabá', 'MT'),
    ('Remédio Amargo', 2585, Null, '12345-058', 12345678915, 12345682, '0', 15/07/2002, 'Av Nova Jardim Santa', 'Isabel Cuiabá', 'MT');
    
END $$

DELIMITER $$
create procedure pcprocedureclientespj()
BEGIN
create table tbclientespj(
id int primary key,
nomecli varchar(100) not null, 
cnpj decimal(14) not null,
ie decimal(11) not null,
cep char(9) not null,
logradouro varchar(50) not null,
numend int not null,
compend varchar (8) null,
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null
);
    
insert into tbclientespj (id, nomecli, cnpj, ie, cep, logradouro, numend, compend, bairro, uf)
values (6, 'Paganada', 12345678912345, 98765432198, '12345-051', 'Av Brasil', 159, Null, 'Lapa', 'Campinas', 'SP'),
	(7, Caloteando, 12345678912346, 98765432199, '12345-053', 'Av Paulista', 69, Null, 'Penha', 'Rio de Janeiro', 'RJ'),
    (8, Semgrana, 12345678912347, 98765432100, '12345-060', 'Rua dos Amores', 189, Null, 'Sei Lá', 'Recife', 'PE'),
    (9, Cemreais, 12345678912348, 98765432101, '12345-060', 'Rua dos Amores', 5024, 'Sala 23', 'Sei Lá', 'Recife', 'PE'),
    (10, Durango, 12345678912349, 98765432102, '12345-060', 'Rua dos Amores', 1254, Null, 'Sei Lá', 'Recife', 'PE');

END $$

DELIMITER $$
create procedure pcprocedurecompras()
BEGIN
create table tbcompras (
nota_fiscal int primary key,
fornecedor varchar (50) not null,
datacompra date not null,
codigobarras decimal(14) not null, 
valoritem decimal (6,2) not null, 
qtd int not null,
qtdtotal int not null,
valortotal decimal (7,2)
);

insert into tbcompras (nota_fiscal, fornecedor, datacompra, codigobarras, valoritem, qtd, qtdtotal, valortotal)
values (8459, 'Amoroso e Doce', STR_TO_DATE('01/05/2018', '%d/%m/%y'), 12345678910111, 22.22, 200, 700, 21944.00),
	(2482, 'Revenda Chico Loco', STR_TO_DATE('22/04/2020', '%d/%m/%y'), 12345678910112, 40.50, 180, 180, 7290.00),
    (21563, 'Marcelo Dedal', STR_TO_DATE('12/07/2020', '%d/%m/%y'), 12345678910113, 3.00, 300, 300, 900,00),
    (8459, 'Amoroso e Doce', STR_TO_DATE('01/05/2018', '%d/%m/%y'), 12345678910114, 35.00, 500, 700, 21944.00),
    (156354, 'Revenda Chico Loco', STR_TO_DATE('23/11/2021', '%d/%m/%y'), 12345678910115, 54.00, 350, 350, 18900.00);
    
END $$

DELIMITER $$
create procedure pcprocedurevendas()
BEGIN
create table tbvendas(
numerovenda int auto_increment primary key,
cliente varchar(100) not null,
datavenda date default 'current_date',
codigobarras decimal (14) not null,
valoritem decimal (6,2) not null,
qtd int not null,
totalvenda decimal (6,2) not null
);

insert into tbvendas (numerovenda, cliente,  codigobarras, valoritem, qtd, totalvenda)
values (1, 'Pimpão', 12345678910111, 54.61, 1, 54.61),
(2, 'Lança Perfume', 12345678910112, 100.45, 2, 200.90),
(3, 'Pimpão', 12345678910113, 44.00, 1, 44.00);

END $$

DELIMITER $$
create procedure pcprocedurenotasfiscais()
BEGIN
create table tbnotas_fiscais(
nf int not null primary key,
cliente varchar(100) not null,
dataemissao date default 'current_date',
totalnota char(1)
);	

insert into tbnotas_fiscais (nf, cliente, dataemissao)
values (359, 'Pimpão', 'current_date', '?'),
	(360, 'Lança Perfume', 'current_date', '?');
    
    END $$
    
    
DELIMITER $$
create procedure pcprocedureprodutos()
BEGIN 
create table tbprodutos(
codigobarras decimal(14) not null primary key,
nome varchar(100) not null,
valorunitario decimal (6,2) not null,
quantidade int not null
);

insert into tbproduto (codigobarras, nome, valorunitario, quantidade)
values (12345678910130, 'Camiseta de Poliéster',   35.61, 100),
	(12345678910131,'Blusa Frio Moletom', 200.00, 100),
    (12345678910132, 'Vestido Decote Redondo', 144.00, 50);
    
END $$

DELIMITER $$
create procedure pcprocedureprodutodeletar()
BEGIN
delete from tbproduto where 12345678910116 and 12345678910117;
END $$

DELIMITER $$
create procedure pcprocedureprodutoupdate()
BEGIN
update tbproduto
set nome= 'Rei de Papel Mache', valorunitario = 64.50
where codigobarras = 12345678910111;

update tbproduto
set nome = 'Bolinha de Sabão', valorunitario = 120.00
where codigobarras = 12345678910112;

update tbproduto
set nome = 'Carro Bate Bate', valorunitario = 64.00
where codigodebarras = 12345678910113;

END $$

DELIMITER $$
create procedure pcproceduredescribetbprodutos()
BEGIN
describe tbprodutos;
END $$



