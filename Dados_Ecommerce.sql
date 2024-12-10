use ecommerce;

insert into cliente (Fname, Minit, Lname, CPF, Address) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
 
 select * from cliente;
 
insert into produto (Pname, classification_kids, category, avaliação, size) 
		values
			 ('Fone de ouvido',false,'Eletrônico','4',null),
             ('Barbie Elsa',true,'Brinquedos','3',null),
             ('Body Carters',true,'Vestimenta','5',null),
             ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
             ('Sofá retrátil',False,'Móveis','3','3x57x80'),
             ('Farinha de arroz',False,'Alimentos','2',null),
             ('Fire Stick Amazon',False,'Eletrônico','3',null);
             
select * from produto;

insert into pedido (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
		values 
		     (1, default,'compra via aplicativo',null,1),
             (2,default,'compra via aplicativo',50,0),
             (3,'Confirmado',null,null,1),
             (4,default,'compra via web site',150,0);
             
select * from pedido;

insert into pedidoProduto (idPOproduct, idPOorder, poQuantity, poStatus) 
		values
			 (1,5,2,null),
             (2,5,1,null),
             (3,6,1,null);
 
select * from pedidoProduto;
 
insert into estoque (storageLocation,quantity) 
		values 
			('Rio de Janeiro',1000),
            ('Rio de Janeiro',500),
            ('São Paulo',10),
            ('São Paulo',100),
            ('São Paulo',10),
            ('Brasília',60);
            
select * from estoque;

insert into localEstoque (idLproduct, idLstorage, location) 
		values
		    (1,2,'RJ'),
            (2,6,'GO');

select * from localEstoque;

insert into fornecedor (SocialName, CNPJ, contact) 
		values 
			('Almeida e filhos', 123456789123456,'21985474'),
            ('Eletrônicos Silva',854519649143457,'21985484'),
            ('Eletrônicos Valma', 934567893934695,'21975474');
                    
select * from fornecedor;

insert into fornecedorProduto (idPsSupplier, idPsProduct, quantity) 
		values
		    (1,1,500),
            (1,2,400),
            (2,4,633),
            (3,3,5),
            (2,5,10);

select * from fornecedorProduto;

insert into vendedor (SocialName, AbstName, CNPJ, CPF, location, contact) 
		values 
		    ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
			('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
			('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from vendedor;

insert into vendedorProduto (idPseller, idPproduct, prodQuantity) 
		values 
			(1,6,80),
			(2,7,10);
            
select * from vendedorProduto;

show tables;

-- pedido cliente 1
select concat(Fname, " ", Lname) as Nome_Cliente, CPF, idOrderClient as Cod_Cliente, idOrder from cliente, pedido
	inner join pedido on idOrderClient = idClient
    group by idOrderClient;
    
-- pedido cliente 2
select idClient, cpf, Fname, count(*) as Quant_Pedidos from cliente, pedido
	where idOrderClient = idClient
    group by idClient;
    
-- vendedor fornecedor 
 select * from vendedor as v
	inner join fornecedor as f on v.CNPJ = f.CNPJ;
    
-- produto fornecedor estoque
select * from produto
	inner join fornecedorProduto on idProduct = idPsProduct
    inner join estoque on idProduct = idProdStorage
    order by idProduct;
    
-- fornecedor produto
select idProduct AS Cod_Produto, SocialName as Razao_Social, CNPJ, Pname as Produto, category as Categoria 
	from fornecedorProduto
		join fornecedor on idPsSupplier = idSupplier
		join produto on idPsSupplier = idProduct
        group by idProduct;
    































