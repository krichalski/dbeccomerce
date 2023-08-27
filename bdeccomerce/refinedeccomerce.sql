-- Criação do banco de dados para cenário de e-commerce
create database ecommerce2;

use ecommerce2;

-- Criar tabela cliente
create table clients (
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) unique,
    CNPJ char(15) unique,
    Adress varchar(45),
    isPJ bool default false,
    constraint unique_cpf_client unique (CPF),
    constraint unique_cnpj_client unique (CNPJ)
);

-- Criar tabela produto
create table products (
    idProduct int auto_increment primary key,
    Pname varchar(50) not null,
    classification_kids tinyint default 0,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliacao float default 0,
    size varchar(10)
);

-- Criar tabela pagamentos
create table payments(
    idPayment int auto_increment primary key,
    idClient int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões', 'Pix'),
    limitAvailable float,
    constraint fk_payments_client foreign key (idClient) references clients(idClient)
);

-- Criar tabela pedido
create table orders (
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 0,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
        on delete set null
);

-- Criar tabela estoque
create table productStorage(
    idProductStorage int auto_increment primary key,
    storageLocation varchar(45) not null,
    quantity int default 0
);

-- Criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    CNPJ char(15),
    SocialName varchar(255) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- Criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    CNPJ char(15),
    CPF char(11),
    SocialName varchar(255) not null,
    AbsName varchar(255),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
    idProductSeller int auto_increment primary key,
    idSeller int,
    idProduct int,
    prodQuantity int default 1,
    constraint fk_product_seller foreign key (idSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references products(idProduct)
);

create table productOrder(
    idProductOrder int auto_increment primary key,
    idProduct int,
    idOrder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    constraint fk_product_order foreign key (idProduct) references products(idProduct),
    constraint fk_order_product foreign key (idOrder) references orders(idOrder)
);

create table storageLocation(
    idStorageLocation int auto_increment primary key,
    idProduct int,
    idProductSeller int,
    location varchar(255) not null,
    constraint fk_location_product foreign key (idProduct) references products(idProduct),
    constraint fk_location_seller foreign key (idProductSeller) references productSeller(idProductSeller)
);

-- Criar tabela entrega
create table delivery (
    idDelivery int auto_increment primary key,
    idOrder int,
    deliveryStatus enum('Pendente', 'Enviado', 'Entregue') default 'Pendente',
    trackingCode varchar(20),
    constraint fk_delivery_order foreign key (idOrder) references orders(idOrder)
);
