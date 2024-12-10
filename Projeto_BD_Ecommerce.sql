create database ecommerce;
-- drop  database ecommerce;
use ecommerce;

create table cliente(
	idClient int auto_increment primary key,
	Fname varchar(10),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address varchar(100),
	constraint unique_cpf_client unique (CPF)
);

create table produto(
	idProduct int auto_increment primary key,
	Pname varchar(30) not null,
	classification_kids bool default false,
	category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
	avaliação float default 0,
	size varchar(10)
);

create table pedido(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(50),
    sendValue float default 10,
    paymentCash boolean default false, 
    constraint fk_ordes_client foreign key (idOrderClient) references cliente(idClient) on update cascade
);

create table estoque(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

create table fornecedor(
	idSupplier int auto_increment primary key,
    SocialName varchar(50) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

create table vendedor(
	idSeller int auto_increment primary key,
    SocialName varchar(30) not null,
    AbstName varchar(30),
    CNPJ char(15),
    CPF char(9),
    location varchar(30),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table vendedorProduto(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references vendedor(idSeller),
    constraint fk_product_product foreign key (idPproduct) references produto(idProduct)
);

create table pedidoProduto(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references produto(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references pedido(idOrder)

);

create table localEstoque(
	idLproduct int,
    idLstorage int,
    location varchar(30) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references produto(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references estoque(idProdStorage)
);

create table fornecedorProduto(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references fornecedor(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references produto(idProduct)
);

show databases;
show tables;
