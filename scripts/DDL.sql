-- Criação do banco de dados
CREATE DATABASE LanchoneteVegana;
USE LanchoneteVegana;

-- Tabela Categorias (não foi criada anteriormente)
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- Tabela Produtos
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    disponibilidade BOOLEAN DEFAULT TRUE,
    categoria_id INT,
    funcionario_id INT,
    CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(id_funcionario),
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES Categorias(id_categoria)
);

-- Tabela Ingredientes
CREATE TABLE Ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_em_estoque INT DEFAULT 0,
    unidade VARCHAR(20)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    ingrediente_id INT,
    produto_id INT,
    quantidade INT,
    CONSTRAINT fk_ingrediente FOREIGN KEY (ingrediente_id) REFERENCES Ingredientes(id_ingrediente),
    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES Produtos(id_produto)
);

-- Tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Em Preparação', 'Concluído', 'Cancelado') DEFAULT 'Pendente',
    pagamento_status ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    funcionario_id INT,
    CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(id_funcionario),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Pedidos_Produtos (
    id_pedido_produto INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    CONSTRAINT fk_pedido FOREIGN KEY (pedido_id) REFERENCES Pedidos(id_pedido),
    CONSTRAINT fk_produto_pedido FOREIGN KEY (produto_id) REFERENCES Produtos(id_produto)
);


-- Tabela Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE
);
