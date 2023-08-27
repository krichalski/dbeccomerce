-- Inserção de dados na tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Adress, isPJ)
VALUES
    ('João', 'A', 'Silva', '12345678901', 'Rua A, 123', false),
    ('Maria', 'B', 'Santos', '98765432101', 'Av. B, 456', true),
    ('Pedro', 'C', 'Oliveira', '45678912301', 'Rua X, 789', false),
    ('Ana', 'D', 'Pereira', '65432198701', 'Av. Y, 987', true),
    ('Lucas', 'E', 'Fernandes', '98712365401', 'Rua Z, 654', false);

-- Inserção de dados na tabela products
INSERT INTO products (Pname, category, avaliacao, size)
VALUES
    ('Smartphone', 'Eletrônico', 4.5, '5.5"'),
    ('Camiseta', 'Vestimenta', 3.8, 'M'),
    ('Brinquedo', 'Brinquedos', 4.2, 'Único'),
    ('Alimento', 'Alimentos', 3.5, '500g'),
    ('Sofá', 'Móveis', 4.0, '3 Lugares');

-- Inserção de dados na tabela payments
INSERT INTO payments (idClient, typePayment, limitAvailable)
VALUES
    (1, 'Cartão', 500),
    (2, 'Boleto', 1000),
    (3, 'Pix', 750),
    (4, 'Cartão', 300),
    (5, 'Boleto', 150);

-- Inserção de dados na tabela orders
INSERT INTO orders (idOrderClient, orderDescription, sendValue, paymentCash)
VALUES
    (1, 'Pedido de João', 200, false),
    (2, 'Pedido de Maria', 150, true),
    (3, 'Pedido de Pedro', 300, false),
    (4, 'Pedido de Ana', 100, true),
    (5, 'Pedido de Lucas', 250, false);

-- Inserção de dados na tabela productStorage
INSERT INTO productStorage (storageLocation, quantity)
VALUES
    ('Estoque A', 100),
    ('Estoque B', 50),
    ('Estoque C', 200),
    ('Estoque D', 75),
    ('Estoque E', 30);

-- Inserção de dados na tabela supplier
INSERT INTO supplier (CNPJ, SocialName, contact)
VALUES
    ('12345678901234', 'Fornecedor Eletrônicos', '9876543210'),
    ('56789012345678', 'Fornecedor Vestuário', '0123456789'),
    ('90123456789012', 'Fornecedor Brinquedos', '3456789012'),
    ('34567890123456', 'Fornecedor Alimentos', '6789012345'),
    ('67890123456789', 'Fornecedor Móveis', '9012345678');

-- Inserção de dados na tabela seller
INSERT INTO seller (CNPJ, CPF, SocialName, AbsName, location, contact)
VALUES
    ('98765432101234', '12345678901', 'Vendedor Eletrônicos', 'Vendedor A', 'Loja 123', '9876543210'),
    ('34567890123456', '78901234567', 'Vendedor Vestuário', 'Vendedor B', 'Loja 456', '0123456789'),
    ('56789012345678', '01234567890', 'Vendedor Brinquedos', 'Vendedor C', 'Loja 789', '3456789012'),
    ('90123456789012', '34567890123', 'Vendedor Alimentos', 'Vendedor D', 'Loja 012', '6789012345'),
    ('12345678901234', '67890123456', 'Vendedor Móveis', 'Vendedor E', 'Loja 345', '9012345678');

-- Inserção de dados na tabela productSeller
INSERT INTO productSeller (idSeller, idProduct, prodQuantity)
VALUES
    (1, 1, 10),
    (2, 2, 20),
    (3, 3, 15),
    (4, 4, 25),
    (5, 5, 5);

-- Inserção de dados na tabela productOrder
INSERT INTO productOrder (idProduct, idOrder, poQuantity)
VALUES
    (1, 1, 2),
    (2, 2, 3),
    (3, 3, 1),
    (4, 4, 4),
    (5, 5, 2);

-- Inserção de dados na tabela storageLocation
INSERT INTO storageLocation (idProduct, idProductSeller, location)
VALUES
    (1, 1, 'Estoque A'),
    (2, 2, 'Estoque B'),
    (3, 3, 'Estoque C'),
    (4, 4, 'Estoque D'),
    (5, 5, 'Estoque E');

-- Inserção de dados na tabela delivery
INSERT INTO delivery (idOrder, deliveryStatus, trackingCode)
VALUES
    (1, 'Enviado', 'ABC123'),
    (2, 'Pendente', 'DEF456'),
    (3, 'Entregue', 'GHI789'),
    (4, 'Enviado', 'JKL012'),
    (5, 'Pendente', 'MNO345');
