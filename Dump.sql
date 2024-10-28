-- Active: 1730127101609@@ep-red-wave-a41xyuo1-pooler.us-east-1.aws.neon.tech@5432
--Excluir Tabelas
DROP TABLE IF EXISTS Categorias CASCADE;

DROP TABLE IF EXISTS Subcategorias CASCADE;

DROP TABLE IF EXISTS Produtos CASCADE;

DROP TABLE IF EXISTS Clientes CASCADE;

DROP TABLE IF EXISTS Pedidos CASCADE;

DROP TABLE IF EXISTS ItensPedidos CASCADE;

DROP TABLE IF EXISTS Pagamentos CASCADE;

DROP TABLE IF EXISTS Entregas CASCADE;

DROP TABLE IF EXISTS Funcionarios CASCADE;

DROP TABLE IF EXISTS Fornecedores CASCADE;

DROP TABLE IF EXISTS Estoque CASCADE;

--Tabela de Categorias
CREATE TABLE
    Categorias (
        categoriaID SERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        descricao text,
        pontos int
    );

INSERT INTO
    Categorias (nome, descricao, pontos)
VALUES
    (
        'Medicamentos',
        'Medicamentos de prescrição e de venda livre para o tratamento de diversas condições médicas',
        30
    ),
    (
        'Cuidados Pessoais',
        'Produtos voltados para o cuidado e bem-estar pessoal, como produtos de higiene',
        15
    ),
    (
        'Suplementos',
        'Suplementos alimentares para apoio à saúde e ao desempenho físico',
        15
    ),
    (
        'Alimentos Funcionais',
        'Alimentos e bebidas que contribuem para o bem-estar e a saúde além de sua função nutritiva',
        20
    ),
    (
        'Acessórios Médicos',
        'Acessórios usados para uso no controle de condições de saúde',
        40
    ),
    (
        'Cosméticos',
        'Produtos que combinam benefícios cosméticos e dermatológicos para cuidado com a pele',
        25
    );

--Tabela de Subcategorias
CREATE TABLE
    Subcategorias (
        subcategoriaID SERIAL PRIMARY KEY,
        categoriaID INT,
        nome VARCHAR(50) NOT NULL,
        descricao TEXT,
        FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID)
    );

INSERT INTO
    Subcategorias (categoriaID, nome, descricao)
VALUES
    (
        1,
        'Antibióticos',
        'Medicamentos usados para tratar infecções bacterianas'
    ),
    (
        3,
        'Vitaminas',
        'Suplementos que fornecem nutrientes essenciais para o corpo'
    ),
    (
        3,
        'Proteínas',
        'Suplementos para ganho de massa muscular e recuperação pós-exercício'
    ),
    (
        6,
        'Cremes Corporais',
        'Produtos para hidratação e cuidados diários com a pele do corpo'
    ),
    (
        4,
        'Bebidas Funcionais',
        'Bebidas formuladas para oferecer benefícios além da nutrição básica'
    ),
    (
        5,
        'Medidores',
        'Equipamentos para monitorar os níveis de variáveis médicas'
    ),
    (
        2,
        'Óleos essencias',
        'Óleos para umidifcadores e aromaterapia'
    ),
    (
        5,
        'Máscaras e Luvas',
        'Luvas e Máscaras para proteção bacteriana'
    ),
    (
        1,
        'Antifúngicos',
        'Medicamentos para tratamento de fungos'
    ),
    (
        1,
        'Medicamentos para dores',
        'Medicamentos para alívio de dores musculares e de cabeça'
    ),
    (
        2,
        'Shampoos e Sabonetes',
        'Produtos de higiene pessoal'
    );

--Tabela de fornecedores
CREATE TABLE
    Fornecedores (
        FornecedorID SERIAL PRIMARY KEY,
        Nome VARCHAR(50),
        Endereco VARCHAR(250)
    );

INSERT INTO
    Fornecedores (Nome, Endereco)
VALUES
    (
        'Medley Farmacêutica',
        'Avenida dos Laboratórios 1000, Campinas - SP'
    ),
    (
        'MedDistribuidora Ltda',
        'Rua Saúde 123, São Paulo - SP'
    ),
    (
        'PharmaPlus',
        'Avenida das Clínicas 456, Rio de Janeiro - RJ'
    ),
    (
        'Medicamentos Alfa',
        'Alameda dos Remédios 789, Curitiba - PR'
    ),
    (
        'BioFarma',
        'Travessa Vida Nova 1010, Belo Horizonte - MG'
    ),
    (
        'Saúde & Cia',
        'Estrada da Cura 1111, Porto Alegre - RS'
    ),
    (
        'Drogaria União',
        'Avenida Central 1212, Brasília - DF'
    ),
    (
        'PharmaDistribui',
        'Rua das Vacinas 1313, Salvador - BA'
    ),
    (
        'VitalMed',
        'Largo dos Cuidados 1414, Recife - PE'
    ),
    (
        'MedicDistribuição',
        'Praça Bem Estar 1515, Fortaleza - CE'
    );

--Tabela de Produtos
CREATE TABLE
    Produtos (
        produtoID SERIAL PRIMARY KEY,
        categoriaID INT,
        subcategoriaID INT,
        nome VARCHAR(50) NOT NULL,
        descricao TEXT,
        preco DECIMAL(10, 2) NOT NULL,
        validade DATE,
        dosagem VARCHAR(50),
        data_de_cadastro DATE,
        fornecedor INT,
        imagem VARCHAR(500),
        FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID),
        FOREIGN KEY (subcategoriaID) REFERENCES SubCategorias (subcategoriaID),
        FOREIGN KEY (fornecedor) REFERENCES Fornecedores (fornecedorID)
    );

INSERT INTO
    Produtos (
        categoriaID,
        subcategoriaID,
        nome,
        descricao,
        preco,
        validade,
        imagem,
        dosagem,
        data_de_cadastro,
        fornecedor
    )
VALUES
    (
        1,
        1,
        'Amoxicilina',
        'Antibiótico usado no tratamento de infecções bacterianas',
        30,
        to_date ('10/05/2025', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/amoxicilina.jpg',
        '500mg',
        to_date ('15/10/2024', 'dd/mm/yyyy'),
        1
    ),
    (
        2,
        11,
        'Sabonete Antibacteriano',
        'Sabonete para eliminação de germes e bactérias',
        50.00,
        to_date ('18/02/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/sabonete.jpg',
        '100g',
        to_date ('16/10/2024', 'dd/mm/yyyy'),
        5
    ),
    (
        3,
        2,
        'Vitamina C',
        'Suplemento para reforçar imunidade',
        22,
        to_date ('30/06/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/vitaminac.jpg',
        '500mg',
        to_date ('14/10/2024', 'dd/mm/yyyy'),
        3
    ),
    (
        6,
        4,
        'Hidratante Corporal',
        'Creme para hidratação da pele',
        30,
        to_date ('01/08/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/hidratante.jpg',
        '200ml',
        to_date ('12/10/2024', 'dd/mm/yyyy'),
        2
    ),
    (
        1,
        1,
        'Losartana',
        'Medicamento para controle da pressão arterial',
        12,
        to_date ('15/12/2025', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/losartana.jpg',
        '50mg',
        to_date ('13/10/2024', 'dd/mm/yyyy'),
        1
    ),
    (
        1,
        9,
        'Fluconazol',
        'Medicamento usado para tratar infecções fúngicas',
        16,
        to_date ('01/08/2025', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/fluconazol.jpg',
        '150mg',
        to_date ('12/10/2024', 'dd/mm/yyyy'),
        4
    ),
    (
        2,
        11,
        'Shampoo de Jasmine',
        'Shampoo para cabelos oleosos',
        26.00,
        to_date ('18/02/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/shampoojasmine.jpg',
        '300ml',
        to_date ('11/10/2024', 'dd/mm/yyyy'),
        3
    ),
    (
        3,
        3,
        'Whey Protein',
        'Suplemento proteico para aumento de massa muscular',
        150,
        to_date ('20/08/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/wheyprotein.jpg',
        '1kg',
        to_date ('14/10/2024', 'dd/mm/yyyy'),
        3
    ),
    (
        4,
        5,
        'Bebida Funcional de Hibisco',
        'Bebida à base de hibisco para controle de peso.',
        12,
        to_date ('25/03/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/bebida-hibisco.jpg',
        '300ml',
        to_date ('11/10/2024', 'dd/mm/yyyy'),
        4
    ),
    (
        5,
        6,
        'Medidor de Glicose',
        'Equipamento para monitoramento de glicose no sangue',
        120,
        to_date ('14/08/2030', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/medidor-glicose.jpg',
        'Não se Aplica',
        to_date ('17/10/2024', 'dd/mm/yyyy'),
        2
    ),
    (
        5,
        6,
        'Termômetro Digital Clínico',
        'Termômetro digital para medição de temperatura corporal',
        35.00,
        to_date ('30/01/2031', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/termometro.jpg',
        'Não se Aplica',
        to_date ('25/10/2025', 'dd/mm/yyyy'),
        1
    ),
    (
        1,
        10,
        'Ibuprofeno',
        'Medicamento utilizado para aliviar dores e inflamações',
        15,
        to_date ('25/10/2025', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/ibuprofeno.jpg',
        '400mg',
        to_date ('28/08/2024', 'dd/mm/yyyy'),
        3
    ),
    (
        1,
        10,
        'Paracetamol',
        'Medicamento utilizado para aliviar dores e febre',
        9,
        to_date ('10/11/2025', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/paracetamol.jpg',
        '500mg',
        to_date ('05/10/2024', 'dd/mm/yyyy'),
        1
    ),
    (
        5,
        8,
        'Máscaras Descartáveis',
        'Máscaras descartáveis com tripla camada',
        30,
        to_date ('20/09/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/mascaras.jpg',
        'Não se Aplica',
        to_date ('18/07/2024', 'dd/mm/yyyy'),
        5
    ),
    (
        2,
        7,
        'Óleo Essencial de Lavanda',
        'Óleos essenciais com propriedades calmantes',
        28,
        to_date ('30/08/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/lavanda.jpg',
        '10ml',
        to_date ('06/04/2024', 'dd/mm/yyyy'),
        2
    ),
    (
        2,
        7,
        'Óleo Essencial de Eucalipto',
        'Óleos essenciais para aliviar congestão nasal',
        25,
        to_date ('12/04/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/eucalipto.jpg',
        '10ml',
        to_date ('09/05/2024', 'dd/mm/yyyy'),
        4
    ),
    (
        6,
        4,
        'Protetor Solar',
        'Protetor FPS 50 que protege contra raios UV',
        45,
        to_date ('15/04/2026', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/protetorsolar.jpg',
        '200ml',
        to_date ('10/10/2024', 'dd/mm/yyyy'),
        5
    ),
    (
        5,
        8,
        'Luvas de Procedimento',
        'Luvas descartáveis em Latex',
        45,
        to_date ('18/06/2027', 'dd/mm/yyyy'),
        'http://exemplo.com/imagens/luvas.jpg',
        'Não se Aplica',
        to_date ('25/07/2024', 'dd/mm/yyyy'),
        4
    );

--Tabela dos Clientes
CREATE TABLE
    Clientes (
        nome VARCHAR(50) NOT NULL,
        email VARCHAR(100),
        senha VARCHAR(250) NOT NULL,
        cidade VARCHAR(50) NOT NULL,
        endereco TEXT,
        pontos INT,
        genero VARCHAR(50),
        data_de_nascimento DATE,
        cpf VARCHAR(11) NOT NULL
    );

-- Tabela de Pedidos
CREATE TABLE
    Pedidos (
        PedidoID SERIAL PRIMARY KEY,
        ClienteID INT,
        DataPedido DATE NOT NULL,
        Status VARCHAR(50) NOT NULL,
        FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID)
    );

INSERT INTO
    Pedidos (ClienteID, DataPedido, Status)
VALUES
    (
        1,
        TO_DATE ('27/10/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        2,
        TO_DATE ('28/10/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        3,
        TO_DATE ('29/10/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        4,
        TO_DATE ('30/10/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        5,
        TO_DATE ('31/10/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        6,
        TO_DATE ('01/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        7,
        TO_DATE ('02/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        8,
        TO_DATE ('03/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        9,
        TO_DATE ('04/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        10,
        TO_DATE ('05/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        1,
        TO_DATE ('06/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        2,
        TO_DATE ('07/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        3,
        TO_DATE ('08/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        4,
        TO_DATE ('09/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        5,
        TO_DATE ('10/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        6,
        TO_DATE ('11/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        7,
        TO_DATE ('12/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        8,
        TO_DATE ('13/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        9,
        TO_DATE ('14/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        10,
        TO_DATE ('15/11/2024', 'DD/MM/YYYY'),
        'concluído'
    );

--Tabela de ItensPedido
CREATE TABLE
    ItensPedido (
        ItemID SERIAL PRIMARY KEY,
        PedidoID INT,
        ProdutoID INT,
        Quantidade INT NOT NULL,
        PrecoUnitario DECIMAL(10, 2) NOT NULL,
        Descontos DECIMAL(10, 2),
        FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID),
        FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID)
    );

INSERT INTO
    ItensPedido (
        PedidoID,
        ProdutoID,
        Quantidade,
        PrecoUnitario,
        Descontos
    )
VALUES
    (
        1,
        1,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 1
        ),
        0
    ),
    (
        2,
        2,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 2
        ),
        5
    ),
    (
        3,
        3,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 3
        ),
        0
    ),
    (
        4,
        4,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 4
        ),
        0
    ),
    (
        5,
        5,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 5
        ),
        2
    ),
    (
        6,
        6,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 6
        ),
        0
    ),
    (
        7,
        7,
        3,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 7
        ),
        0
    ),
    (
        8,
        8,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 8
        ),
        0
    ),
    (
        9,
        9,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 9
        ),
        1
    ),
    (
        10,
        10,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 10
        ),
        0
    ),
    (
        11,
        11,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 11
        ),
        0
    ),
    (
        11,
        12,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 12
        ),
        2
    ),
    (
        12,
        13,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 13
        ),
        1
    ),
    (
        12,
        14,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 14
        ),
        0
    ),
    (
        13,
        15,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 15
        ),
        0
    ),
    (
        13,
        16,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 16
        ),
        1.5
    ),
    (
        14,
        17,
        3,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 17
        ),
        0
    ),
    (
        14,
        18,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 18
        ),
        0
    ),
    (
        15,
        19,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 19
        ),
        0
    ),
    (
        15,
        20,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 20
        ),
        3
    ),
    (
        16,
        21,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 21
        ),
        1
    ),
    (
        16,
        22,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 22
        ),
        0
    ),
    (
        17,
        23,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 23
        ),
        0
    ),
    (
        17,
        24,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 24
        ),
        2
    ),
    (
        18,
        25,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 25
        ),
        0
    ),
    (
        18,
        26,
        3,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 26
        ),
        1
    ),
    (
        19,
        27,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 27
        ),
        0
    ),
    (
        19,
        28,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 28
        ),
        0
    ),
    (
        20,
        29,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 29
        ),
        1
    ),
    (
        20,
        30,
        2,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                ProdutoID = 30
        ),
        2
    );