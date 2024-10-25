--Excluir Tabelas

DROP TABLE IF EXISTS Categorias;

DROP TABLE IF EXISTS Subcategorias;

DROP TABLE IF EXISTS Produtos;

DROP TABLE IF EXISTS Clientes;

DROP TABLE IF EXISTS Pedidos;

DROP TABLE IF EXISTS ItensPedidos;

DROP TABLE IF EXISTS Pagamentos;

DROP TABLE IF EXISTS Entregas;

DROP TABLE IF EXISTS Funcionarios;

DROP TABLE IF EXISTS Fornecedores;

DROP TABLE IF EXISTS Estoque;

--Tabela de Categorias

CREATE TABLE Categorias (
    categoriaID SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao text,
    pontos int
);

INSERT INTO
    Categorias (nome, descricao, pontos)
VALUES (
        "Medicamentos",
        "Medicamentos de prescrição e de venda livre para o tratamento de diversas condições médicas",
        30
    );

(
    "Cuidados Pessoais",
    "Produtos voltados para o cuidado e bem-estar pessoal, como cremes e produtos de higiene",
    15
);

(
    "Suplementos",
    "Suplementos alimentares para apoio à saúde e ao desempenho físico",
    15
);

(
    "Alimentos Funcionais",
    "Alimentos e bebidas que contribuem para o bem-estar e a saúde além de sua função nutritiva",
    20
);

(
    "Acessórios Médicos",
    "Acessórios usados para uso no controle de condições de saúde",
    40
);

(
    "Cosméticos",
    "Produtos que combinam benefícios cosméticos e dermatológicos para cuidado com a pele",
    25
);

--Tabela de Subcategorias

CREATE TABLE Subcategorias (
    subcategoriaID SERIAL PRIMARY KEY,
    categoriaID int,
    nome VARCHAR(50) NOT NULL,
    descricao text,
    FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID)
);

INSERT INTO
    Subcategorias (categoriaID, nome, descricao)
VALUES (
        1,
        "Antibióticos",
        "Medicamentos usados para tratar infecções bacterianas"
    ),
    (
        3,
        "Vitaminas",
        "Suplementos que fornecem nutrientes essenciais para o corpo"
    ),
    (
        3,
        "Proteínas",
        "Suplementos para ganho de massa muscular e recuperação pós-exercício"
    ),
    (
        6,
        "Cremes Corporais",
        "Produtos para hidratação e cuidados diários com a pele do corpo"
    ),
    (
        4,
        "Bebidas Funcionais",
        "Bebidas formuladas para oferecer benefícios além da nutrição básica"
    ),
    (
        5,
        "Medidores de Glicose",
        "Equipamentos para monitorar os níveis de glicose no sangue"
    ),
    (
        2,
        "Óleos essencias",
        "Óleos para umidifcadores e aromaterapia"
    ),
    (
        5,
        "Máscaras e Luvas",
        "Luvas e Máscaras para proteção bacteriana"
    ),
    (
        1,
        "Medicamentos controlados",
        "Medicamentos tarja preta e vermelha que necessitam de receita médica"
    ),
    (
        2,
        "Shampoos e Sabonetes",
        "Produtos de higiene pessoal"
    );

--Tabela de Produtos

CREATE TABLE Produtos (
    categoriaID int,
    subcategoriaID int,
    nome VARCHAR(50) NOT NULL,
    descricao text,
    preco DECIMAL(10, 2) NOT NULL,
    validade DATE("dd/mm/yyyy"),
    dosagem VARCHAR(50),
    data_de_cadastro DATE,
    fornecedor int,
    imagem VARCHAR(500),
    FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID),
    FOREIGN KEY (subcategoriaID) REFERENCES SUbCategorias (subcategoriaID),
    FOREIGN KEY (fornecedor) REFERENCES Fornecedores(fornecedorID)
);

INSERT INTO Produtos (categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor) VALUES
(1, 1, "Amoxicilina", "Antibiótico usado no tratamento de infecções bacterianas",30.00, to_date('10/05/2025','dd/mm/yyyy'), "http://exemplo.com/imagens/amoxicilina.jpg", "500mg", to_date('15/10/2024','dd/mm/yyyy'), 1 ),
(2, 10, "Sabonete Antibacteriano", "Sabonete para eliminação de germes e bactérias", 50.00, to_date('18/02/2026','dd/mm/yyyy'), "http://exemplo.com/imagens/sabonete.jpg)","100g", to_date('16/10/2024','dd/mm/yyyy'), 5 )
(3, 2, "Vitamina C", "Suplemento para reforçar imunidade", 22.00, to_date('30/06/2026','dd/mm/yyyy'), "http://exemplo.com/imagens/vitaminac.jpg)", "500mg", to_date('14/10/2024','dd/mm/yyyy'), 3),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor),
(categoriaID, subcategoria, nome, descricao, preco, validade, imagem, dosagem, data_de_cadastro, fornecedor);