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
        clienteID SERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        email VARCHAR(100),
        senha VARCHAR(250) NOT NULL,
        cpf VARCHAR(11) NOT NULL,
        genero VARCHAR(50),
        data_de_nascimento DATE,
        cidade VARCHAR(50) NOT NULL,
        endereco VARCHAR(300) NOT NULL,
        pontos INT
    );

INSERT INTO
    Clientes (
        nome,
        email,
        senha,
        cpf,
        genero,
        data_de_nascimento,
        cidade,
        endereco,
        pontos
    )
VALUES
    (
        'Mariana Silva',
        'mariana.silva@gmail.com',
        '@Tacademy2024',
        '12345678910',
        'Feminino',
        to_date ('15/05/1990', 'dd/mm/yyyy'),
        'São Paulo',
        'Rua das Flores, 100',
        90
    ),
    (
        'Eduardo Mendes',
        'eduardo.mendes@gmail.com',
        '@Tacademy2024',
        '98765432100',
        'Masculino',
        to_date ('22/08/1985', 'dd/mm/yyyy'),
        'Belo Horizonte',
        'Rua Liberdade, 80',
        105
    ),
    (
        'Carla Oliveira',
        'carla.oliveira@gmail.com',
        '@Tacademy2024',
        '87654321098',
        'Feminino',
        to_date ('08/06/1987', 'dd/mm/yyyy'),
        'Rio de Janeiro',
        'Avenida Central, 450',
        200
    ),
    (
        'João Pereira',
        'joao.pereira@gmail.com',
        '@Tacademy2024',
        '87654321098',
        'Masculino',
        to_date ('14/03/1995', 'dd/mm/yyyy'),
        'Campinas',
        'Rua das Flores, 120',
        150
    ),
    (
        'Beatriz Costa',
        'beatriz.costa@gmail.com',
        '@Tacademy2024',
        '34567890123',
        'Feminino',
        to_date ('29/09/1991', 'dd/mm/yyyy'),
        'Salvador',
        'Rua da Praia, 35',
        85
    ),
    (
        'Pedro Souza',
        'pedro.souza@gmail.com',
        '@Tacademy2024',
        '56789012345',
        'Masculino',
        to_date ('10/04/1994', 'dd/mm/yyyy'),
        'Fortaleza',
        'Avenida Beira Mar, 710',
        90
    ),
    (
        'Fernanda Lima',
        'fernanda.lima@gmail.com',
        '@Tacademy2024',
        '65432198765',
        'Feminino',
        to_date ('05/01/1990', 'dd/mm/yyyy'),
        'Manaus',
        'Rua das Palmeiras, 90',
        110
    ),
    (
        'Lucas Ferreira',
        'lucas.ferreira@gmail.com',
        '@Tacademy2024',
        '89012345667',
        'Masculino',
        to_date ('17/12/1985', 'dd/mm/yyyy'),
        'Recife',
        'Rua do Sol, 150',
        140
    ),
    (
        'Gabriela Andrade',
        'gabriela.andrade@gmail.com',
        '@Tacademy2024',
        '78901234598',
        'Feminino',
        to_date ('03/11/1998', 'dd/mm/yyyy'),
        'Porto Alegre',
        'Rua do Porto, 75',
        75
    ),
    (
        'Amanda Carvalho',
        'amanda.carvalho@gmail.com',
        '@Tacademy2024',
        '45678912309',
        'Feminino',
        to_date ('20/11/1993', 'dd/mm/yyyy'),
        'Recife',
        'Rua Nova, 432',
        95
    ),
    (
        'Ricardo Lima',
        'ricardo.lima@gmail.com',
        '@Tacademy2024',
        '78912345678',
        'Masculino',
        to_date ('15/07/1989', 'dd/mm/yyyy'),
        'São Paulo',
        'Avenida Paulista, 290',
        115
    ),
    (
        'Mariana Duarte',
        'mariana.duarte@gmail.com',
        '@Tacademy2024',
        '98765432111',
        'Feminino',
        to_date ('11/05/1992', 'dd/mm/yyyy'),
        'Florianópolis',
        'Rua das Olveiras, 85',
        135
    ),
    (
        'Gustavo Santos',
        'gustavo.santos@gmail.com',
        '@Tacademy2024',
        '12345678922',
        'Masculino',
        to_date ('05/12/1990', 'dd/mm/yyyy'),
        'Brasília',
        'Avenida Independência, 76',
        70
    ),
    (
        'Sofia Almeida',
        'sofia.almeida@gmail.com',
        '@Tacademy2024',
        '32165498733',
        'Feminino',
        to_date ('23/08/1996', 'dd/mm/yyyy'),
        'Curitiba',
        'Rua Bela Vista, 310',
        90
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
    ItensPedidos (
        ItemID SERIAL PRIMARY KEY,
        PedidoID INT,
        produtoID INT,
        Quantidade INT NOT NULL,
        PrecoUnitario DECIMAL(10, 2) NOT NULL,
        Descontos DECIMAL(10, 2),
        FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID),
        FOREIGN KEY (produtoID) REFERENCES Produtos (produtoID)
    );

INSERT INTO
    ItensPedidos (
        PedidoID,
        produtoID,
        Quantidade,
        PrecoUnitario,
        Descontos
    )
VALUES
    (
        1,
        1,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 1
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
                produtoID = 2
        ),
        0
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
                produtoID = 3
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
                produtoID = 4
        ),
        0
    ),
    (
        5,
        5,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 5
        ),
        0
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
                produtoID = 6
        ),
        0
    ),
    (
        7,
        7,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 7
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
                produtoID = 8
        ),
        0
    ),
    (
        9,
        9,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 9
        ),
        0
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
                produtoID = 10
        ),
        0
    ),
    (
        11,
        11,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 11
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
                produtoID = 12
        ),
        1
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
                produtoID = 13
        ),
        0
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
                produtoID = 14
        ),
        0
    ),
    (
        13,
        15,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 15
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
                produtoID = 16
        ),
        1.5
    ),
    (
        14,
        17,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 17
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
                produtoID = 18
        ),
        0
    ),
    (
        15,
        1,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 1
        ),
        0.5
    ),
    (
        15,
        2,
        1,
        (
            SELECT
                preco
            FROM
                Produtos
            WHERE
                produtoID = 2
        ),
        1
    );

--Tabela do Estoque
CREATE TABLE
    Estoque (
        produtoID INT,
        quantidade INT,
        validade DATE,
        FOREIGN KEY (produtoID) REFERENCES Produtos (produtoID)
    );

INSERT INTO
    Estoque (produtoID, quantidade, validade)
VALUES
    (1, 80, to_date ('10/05/2025', 'dd/mm/yyyy')),
    (2, 250, to_date ('18/02/2026', 'dd/mm/yyyy')),
    (3, 310, to_date ('30/06/2026', 'dd/mm/yyyy')),
    (4, 290, to_date ('01/08/2026', 'dd/mm/yyyy')),
    (5, 90, to_date ('15/12/2025', 'dd/mm/yyyy')),
    (6, 110, to_date ('01/08/2025', 'dd/mm/yyyy')),
    (7, 340, to_date ('18/02/2026', 'dd/mm/yyyy')),
    (8, 70, to_date ('20/08/2026', 'dd/mm/yyyy')),
    (9, 45, to_date ('25/03/2026', 'dd/mm/yyyy')),
    (10, 21, to_date ('14/08/2030', 'dd/mm/yyyy')),
    (11, 29, to_date ('30/01/2031', 'dd/mm/yyyy')),
    (12, 101, to_date ('25/10/2025', 'dd/mm/yyyy')),
    (13, 150, to_date ('10/11/2025', 'dd/mm/yyyy')),
    (14, 46, to_date ('20/09/2026', 'dd/mm/yyyy')),
    (15, 167, to_date ('30/08/2026', 'dd/mm/yyyy')),
    (16, 148, to_date ('12/04/2026', 'dd/mm/yyyy')),
    (17, 91, to_date ('15/04/2026', 'dd/mm/yyyy')),
    (18, 41, to_date ('18/06/2027', 'dd/mm/yyyy'));

--Tabela dos Funcionarios
CREATE TABLE
    Funcionarios (
        funcionarioID SERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        email VARCHAR(300),
        cidade VARCHAR(100),
        endereco VARCHAR(300),
        cargo VARCHAR(300)
    );

INSERT INTO
    Funcionarios (nome, email, cidade, endereco, cargo)
VALUES
    (
        'Carlos Silva',
        'carlos.silvia@farmacia.com',
        'São Paulo',
        'Rua das Acácias, 200',
        'Gerente de Vendas'
    ),
    (
        'Amanda Rocha',
        'amanda.rocha@farmacia.com',
        'Rio de Janeiro',
        'Rua Nova Esperança, 500',
        'Farmacêutica'
    ),
    (
        'Roberto Souza',
        'roberto.souza@farmacia.com',
        'Belo Horizonte',
        'Rua dos Lírios, 120',
        'Assistente de estoque'
    ),
    (
        'Fernanda Lima',
        'fernanda.lima@farmacia.com',
        'Porto Alegre',
        'Rua São Pedro, 50',
        'Atendente Virtual'
    ),
    (
        'José Almeida',
        'jose.almeida@farmacia.com',
        'Curitiba',
        'Rua Dom Pedro II, 87',
        'Gerente de Logística'
    ),
    (
        'Pedro Souza',
        'pedro.souza@farmacia.com',
        'Curitiba',
        'Rua Marechal Deodoro, 278',
        'Desenvolvedor Web'
    ),
    (
        'Carla Oliveira',
        'carla.oliveira@farmacia.com',
        'São Paulo',
        'Rua Comendador Araújo, 98',
        'Enfermeiro Consultor'
    ),
    (
        'João Ferreira',
        'joao.ferreira@farmacia.com',
        'Manaus',
        'Rua Visconde de Guarapava, 245',
        'Atendente Virtual'
    );