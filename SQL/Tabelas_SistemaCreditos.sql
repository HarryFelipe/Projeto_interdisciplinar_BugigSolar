
-- Criação do banco de dados (opcional)
CREATE DATABASE IF NOT EXISTS SistemaCreditos;
USE SistemaCreditos;

-- Tabela de Tipos de Usuários
CREATE TABLE Tipos_usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_tipo VARCHAR(45)
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo INT,
    Nome VARCHAR(45),
    Email VARCHAR(45),
    Documento VARCHAR(15),
    CEP VARCHAR(11),
    Numero INT,
    Senha VARCHAR(45),
    FOREIGN KEY (id_tipo) REFERENCES Tipos_usuarios(id)
);

-- Tabela de Estados
CREATE TABLE Estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_UF VARCHAR(45),
    Valor DECIMAL(8,2),
    taxa INT
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuariof INT,
    id_estado INT,
    Razao_social VARCHAR(45),
    Telefone_comercial VARCHAR(45),
    FOREIGN KEY (id_usuariof) REFERENCES Usuarios(id),
    FOREIGN KEY (id_estado) REFERENCES Estados(id)
);

-- Tabela de Ofertas
CREATE TABLE Ofertas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_fornecedor INT,
    Valor_credito DECIMAL(8,2),
    Data_emissao DATE,
    Quantidade_disp INT,
    disponibilidade TINYINT,
    Quant_ofertada INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuarioC INT,
    Telefone_pessoal VARCHAR(45),
    Descricao VARCHAR(150),
    FOREIGN KEY (id_usuarioC) REFERENCES Usuarios(id)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_credito INT,
    id_cliente INT,
    Quantidade_compra INT,
    Data_transacao DATE,
    Valor_transacao DECIMAL(8,2),
    FOREIGN KEY (id_credito) REFERENCES Ofertas(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

-- Tabela de Tipo de Pagamento
CREATE TABLE tipo_pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo VARCHAR(45)
);

-- Tabela de Pagamento
CREATE TABLE Pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT,
    id_tipo_pagamento INT,
    Valor_pago DECIMAL(8,2),
    Data_pagamento DATE,
    num_titulo INT,
    FOREIGN KEY (id_compra) REFERENCES Vendas(id),
    FOREIGN KEY (id_tipo_pagamento) REFERENCES tipo_pagamento(id)
);
