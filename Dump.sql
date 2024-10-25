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
CREATE TABLE categorias (
    nome VARCHAR(50),
    descricao text,
    pontos int
);

INSERT INTO
    categorias (nome, descricao, pontos)
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
    "Equipamentos Médicos",
    "Equipamentos usados para monitoramento e controle de condições de saúde",
    40
);

(
    "Dermocosméticos",
    "Produtos que combinam benefícios cosméticos e dermatológicos para cuidado com a pele",
    25
);