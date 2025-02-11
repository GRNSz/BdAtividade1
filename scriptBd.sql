-- Criando o banco de dados (caso necessário)
CREATE DATABASE RelacionamentosDB;
USE RelacionamentosDB;

-- Criando a tabela Cliente (1 Cliente pode fazer vários Pedidos)
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela Pedido (Cada Pedido pertence a 1 Cliente)
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

-- Criando a tabela Produto (um Produto pode estar em vários Pedidos)
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela intermediária PedidoProduto (muitos para muitos)
CREATE TABLE PedidoProduto (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto) ON DELETE CASCADE
);

-- Inserindo alguns dados de exemplo
INSERT INTO Cliente (nome) VALUES ('João'), ('Maria');

INSERT INTO Pedido (id_cliente, data_pedido) VALUES (1, '2024-02-10'), (2, '2024-02-11');

INSERT INTO Produto (nome, preco) VALUES ('Notebook', 3500.00), ('Mouse', 50.00);

INSERT INTO PedidoProduto (id_pedido, id_produto, quantidade) VALUES 
(1, 1, 1), -- Pedido 1 tem 1 Notebook
(1, 2, 2), -- Pedido 1 tem 2 Mouses
(2, 1, 1); -- Pedido 2 tem 1 Notebook

-- Selecionando os dados para ver os relacionamentos
SELECT * FROM Cliente;
SELECT * FROM Pedido;
SELECT * FROM Produto;
SELECT * FROM PedidoProduto;
