
--Tabela de Categorias
CREATE TABLE Categorias (
    categoriaID SERIAL PRIMARY KEY,
    NomeCategoria VARCHAR(50) NOT NULL,
    descricao text,
    pontos int
);

INSERT INTO
    Categorias (
        NomeCategoria,
        descricao,
        pontos
    )
VALUES (
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
CREATE TABLE Subcategorias (
    subcategoriaID SERIAL PRIMARY KEY,
    categoriaID INT NOT NULL,
    NomeSubcategoria VARCHAR(50) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID)
);

INSERT INTO
    Subcategorias (
        categoriaID,
        NomeSubcategoria,
        descricao
    )
VALUES (
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
CREATE TABLE Fornecedores (
    FornecedorID SERIAL PRIMARY KEY,
    NomeFornecedor VARCHAR(50) NOT NULL,
    Endereco_fornecedor VARCHAR(250)
);

INSERT INTO
    Fornecedores (
        NomeFornecedor,
        Endereco_fornecedor
    )
VALUES (
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

--Tabela de Marcas

CREATE TABLE Marcas (
    marcaID SERIAL PRIMARY KEY,
    NomeMarca VARCHAR(100) NOT NULL,
    descricao text
);

INSERT INTO
    Marcas (NomeMarca, descricao)
VALUES (
        'PharmaForte',
        'Saúde forte com produtos farmacêuticos de alta qualidade.'
    ),
    (
        'Vitalixir',
        'Revitalize-se com elixires naturais que fortalecem sua imunidade.'
    ),
    (
        'NutriEssence',
        'Nutrição natural em cada produto para saúde eficaz.'
    ),
    (
        'VivaSure',
        'Confiança em cada dose para viver plenamente'
    ),
    (
        'HoloCare',
        'Bem-estar holístico que nutre corpo e mente'
    ),
    (
        'CuraVital',
        'Revitalização e equilíbrio para uma vida saudável'
    );

CREATE TABLE Produtos (
    produtoID SERIAL PRIMARY KEY,
    categoriaID INT,
    subcategoriaID INT,
    NomeProduto VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(10, 2),
    validade DATE,
    dosagem VARCHAR(50),
    data_de_cadastro DATE,
    fornecedor INT,
    marca INT,
    imagem VARCHAR(500),
    FOREIGN KEY (categoriaID) REFERENCES Categorias (categoriaID),
    FOREIGN KEY (subcategoriaID) REFERENCES SubCategorias (subcategoriaID),
    FOREIGN KEY (fornecedor) REFERENCES Fornecedores (fornecedorID),
    FOREIGN KEY (marca) REFERENCES Marcas (marcaID)
);

INSERT INTO
    Produtos (
        categoriaID,
        subcategoriaID,
        NomeProduto,
        descricao,
        preco,
        desconto,
        validade,
        imagem,
        dosagem,
        data_de_cadastro,
        fornecedor,
        marca
    )
VALUES (
        1,
        1,
        'Amoxicilina',
        'Antibiótico usado no tratamento de infecções bacterianas',
        30,
        0.5,
        TO_DATE('10/05/2025', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/amoxicilina.jpg',
        '500mg',
        TO_DATE('15/10/2024', 'DD/MM/YYYY'),
        1,
        1
    ),
    (
        2,
        11,
        'Sabonete Antibacteriano',
        'Sabonete para eliminação de germes e bactérias',
        50.00,
        0,
        TO_DATE('18/02/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/sabonete.jpg',
        '100g',
        TO_DATE('16/10/2024', 'DD/MM/YYYY'),
        5,
        2
    ),
    (
        3,
        2,
        'Vitamina C',
        'Suplemento para reforçar imunidade',
        22,
        5,
        TO_DATE('30/06/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/vitaminac.jpg',
        '500mg',
        TO_DATE('14/10/2024', 'DD/MM/YYYY'),
        3,
        3
    ),
    (
        6,
        4,
        'Hidratante Corporal',
        'Creme para hidratação da pele',
        30,
        0,
        TO_DATE('01/08/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/hidratante.jpg',
        '200ml',
        TO_DATE('12/10/2024', 'DD/MM/YYYY'),
        2,
        4
    ),
    (
        1,
        1,
        'Losartana',
        'Medicamento para controle da pressão arterial',
        12,
        1,
        TO_DATE('15/12/2025', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/losartana.jpg',
        '50mg',
        TO_DATE('13/10/2024', 'DD/MM/YYYY'),
        1,
        5
    ),
    (
        1,
        9,
        'Fluconazol',
        'Medicamento usado para tratar infecções fúngicas',
        16,
        0,
        TO_DATE('01/08/2025', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/fluconazol.jpg',
        '150mg',
        TO_DATE('12/10/2024', 'DD/MM/YYYY'),
        4,
        6
    ),
    (
        2,
        11,
        'Shampoo de Jasmine',
        'Shampoo para cabelos oleosos',
        26.00,
        0,
        TO_DATE('18/02/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/shampoojasmine.jpg',
        '300ml',
        TO_DATE('11/10/2024', 'DD/MM/YYYY'),
        3,
        1
    ),
    (
        3,
        3,
        'Whey Protein',
        'Suplemento proteico para aumento de massa muscular',
        150,
        0,
        TO_DATE('20/08/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/wheyprotein.jpg',
        '1kg',
        TO_DATE('14/10/2024', 'DD/MM/YYYY'),
        3,
        2
    ),
    (
        4,
        5,
        'Bebida Funcional de Hibisco',
        'Bebida à base de hibisco para controle de peso.',
        12,
        0,
        TO_DATE('25/03/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/bebida-hibisco.jpg',
        '300ml',
        TO_DATE('11/10/2024', 'DD/MM/YYYY'),
        4,
        3
    ),
    (
        5,
        6,
        'Medidor de Glicose',
        'Equipamento para monitoramento de glicose no sangue',
        120,
        9,
        TO_DATE('14/08/2030', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/medidor-glicose.jpg',
        'Não se Aplica',
        TO_DATE('17/10/2024', 'DD/MM/YYYY'),
        2,
        4
    ),
    (
        5,
        6,
        'Termômetro Digital Clínico',
        'Termômetro digital para medição de temperatura corporal',
        35.00,
        0,
        TO_DATE('30/01/2031', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/termometro.jpg',
        'Não se Aplica',
        TO_DATE('25/10/2025', 'DD/MM/YYYY'),
        1,
        5
    ),
    (
        1,
        10,
        'Ibuprofeno',
        'Medicamento utilizado para aliviar dores e inflamações',
        15,
        1,
        TO_DATE('25/10/2025', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/ibuprofeno.jpg',
        '400mg',
        TO_DATE('28/08/2024', 'DD/MM/YYYY'),
        3,
        6
    ),
    (
        1,
        10,
        'Paracetamol',
        'Medicamento utilizado para aliviar dores e febre',
        9,
        0,
        TO_DATE('10/11/2025', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/paracetamol.jpg',
        '500mg',
        TO_DATE('05/10/2024', 'DD/MM/YYYY'),
        1,
        1
    ),
    (
        5,
        8,
        'Máscaras Descartáveis',
        'Máscaras descartáveis com tripla camada',
        30,
        0,
        TO_DATE('20/09/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/mascaras.jpg',
        'Não se Aplica',
        TO_DATE('18/07/2024', 'DD/MM/YYYY'),
        5,
        2
    ),
    (
        2,
        7,
        'Óleo Essencial de Lavanda',
        'Óleos essenciais com propriedades calmantes',
        28,
        0,
        TO_DATE('30/08/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/lavanda.jpg',
        '10ml',
        TO_DATE('06/04/2024', 'DD/MM/YYYY'),
        2,
        3
    ),
    (
        2,
        7,
        'Óleo Essencial de Eucalipto',
        'Óleos essenciais para aliviar congestão nasal',
        25,
        1.5,
        TO_DATE('12/04/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/eucalipto.jpg',
        '10ml',
        TO_DATE('09/05/2024', 'DD/MM/YYYY'),
        4,
        4
    ),
    (
        6,
        4,
        'Protetor Solar',
        'Protetor FPS 50 que protege contra raios UV',
        45,
        0,
        TO_DATE('15/04/2026', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/protetorsolar.jpg',
        '200ml',
        TO_DATE('10/10/2024', 'DD/MM/YYYY'),
        5,
        5
    ),
    (
        5,
        8,
        'Luvas de Procedimento',
        'Luvas descartáveis em Latex',
        45,
        0,
        TO_DATE('18/06/2027', 'DD/MM/YYYY'),
        'http://exemplo.com/imagens/luvas.jpg',
        'Não se Aplica',
        TO_DATE('25/07/2024', 'DD/MM/YYYY'),
        4,
        6
    );

--Tabela dos Clientes
CREATE TABLE Clientes (
    clienteID SERIAL PRIMARY KEY,
    NomeCliente VARCHAR(50) NOT NULL,
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
        NomeCliente,
        email,
        senha,
        cpf,
        genero,
        data_de_nascimento,
        cidade,
        endereco,
        pontos
    )
VALUES (
        'Mariana Silva',
        'mariana.silva@gmail.com',
        '@Tacademy2024',
        '12345678910',
        'Feminino',
        TO_DATE('15/05/1990', 'DD/MM/YYYY'),
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
        TO_DATE('22/08/1985', 'DD/MM/YYYY'),
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
        TO_DATE('08/06/1987', 'DD/MM/YYYY'),
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
        TO_DATE('14/03/1995', 'DD/MM/YYYY'),
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
        TO_DATE('29/09/1991', 'DD/MM/YYYY'),
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
        TO_DATE('10/04/1994', 'DD/MM/YYYY'),
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
        TO_DATE('05/01/1990', 'DD/MM/YYYY'),
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
        TO_DATE('17/12/1985', 'DD/MM/YYYY'),
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
        TO_DATE('03/11/1998', 'DD/MM/YYYY'),
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
        TO_DATE('20/11/1993', 'DD/MM/YYYY'),
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
        TO_DATE('15/07/1989', 'DD/MM/YYYY'),
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
        TO_DATE('11/05/1992', 'DD/MM/YYYY'),
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
        TO_DATE('05/12/1990', 'DD/MM/YYYY'),
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
        TO_DATE('23/08/1996', 'DD/MM/YYYY'),
        'Curitiba',
        'Rua Bela Vista, 310',
        90
    );

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID SERIAL PRIMARY KEY,
    ClienteID INT NOT NULL,
    DataPedido DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID)
);

INSERT INTO
    Pedidos (ClienteID, DataPedido, Status)
VALUES (
        1,
        TO_DATE('27/10/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        2,
        TO_DATE('28/10/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        3,
        TO_DATE('29/10/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        4,
        TO_DATE('30/10/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        5,
        TO_DATE('31/10/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        6,
        TO_DATE('01/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        7,
        TO_DATE('02/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        8,
        TO_DATE('03/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        9,
        TO_DATE('04/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        10,
        TO_DATE('05/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        1,
        TO_DATE('06/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        2,
        TO_DATE('07/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        3,
        TO_DATE('08/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        4,
        TO_DATE('09/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        5,
        TO_DATE('10/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        6,
        TO_DATE('11/11/2024', 'DD/MM/YYYY'),
        'concluído'
    ),
    (
        7,
        TO_DATE('12/11/2024', 'DD/MM/YYYY'),
        'em processamento'
    ),
    (
        8,
        TO_DATE('13/11/2024', 'DD/MM/YYYY'),
        'pendente'
    ),
    (
        9,
        TO_DATE('14/11/2024', 'DD/MM/YYYY'),
        'cancelado'
    ),
    (
        10,
        TO_DATE('15/11/2024', 'DD/MM/YYYY'),
        'concluído'
    );

--Tabela de ItensPedido
CREATE TABLE ItensPedidos (
    ItemID SERIAL PRIMARY KEY,
    PedidoID INT NOT NULL,
    produtoID INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    Descontos_totais DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID),
    FOREIGN KEY (produtoID) REFERENCES Produtos (produtoID)
);

INSERT INTO
    ItensPedidos (
        PedidoID,
        produtoID,
        Quantidade,
        PrecoUnitario,
        Descontos_totais
    )
VALUES (
        1,
        1,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 1
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 1
        )
    ),
    (
        2,
        2,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 2
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 2
        )
    ),
    (
        3,
        3,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 3
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 3
        )
    ),
    (
        4,
        4,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 4
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 4
        )
    ),
    (
        5,
        5,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 5
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 5
        )
    ),
    (
        6,
        6,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 6
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 6
        )
    ),
    (
        7,
        7,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 7
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 7
        )
    ),
    (
        8,
        8,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 8
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 8
        )
    ),
    (
        9,
        9,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 9
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 9
        )
    ),
    (
        10,
        10,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 10
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 10
        )
    ),
    (
        11,
        11,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 11
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 11
        )
    ),
    (
        11,
        12,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 12
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 12
        )
    ),
    (
        12,
        13,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 13
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 13
        )
    ),
    (
        12,
        14,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 14
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 14
        )
    ),
    (
        13,
        15,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 15
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 15
        )
    ),
    (
        13,
        16,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 16
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 16
        )
    ),
    (
        14,
        17,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 17
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 17
        )
    ),
    (
        14,
        18,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 18
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 18
        )
    ),
    (
        15,
        1,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 1
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 1
        )
    ),
    (
        15,
        2,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 2
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 2
        )
    ),
    (
        16,
        3,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 3
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 3
        )
    ),
    (
        16,
        4,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 4
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 4
        )
    ),
    (
        17,
        5,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 5
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 5
        )
    ),
    (
        17,
        6,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 6
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 6
        )
    ),
    (
        18,
        7,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 7
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 7
        )
    ),
    (
        18,
        8,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 8
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 8
        )
    ),
    (
        19,
        9,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 9
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 9
        )
    ),
    (
        19,
        10,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 10
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 10
        )
    ),
    (
        20,
        11,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 11
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 11
        )
    ),
    (
        20,
        12,
        1,
        (
            SELECT preco
            FROM Produtos
            WHERE
                produtoID = 12
        ),
        (
            SELECT desconto
            FROM Produtos
            WHERE
                produtoID = 12
        )
    );

--Tabela do Estoque
CREATE TABLE Estoque (
    produtoID INT,
    quantidade INT NOT NULL,
    validade DATE,
    FOREIGN KEY (produtoID) REFERENCES Produtos (produtoID)
);

INSERT INTO
    Estoque (
        produtoID,
        quantidade,
        validade
    )
VALUES (
        1,
        80,
        TO_DATE('10/05/2025', 'DD/MM/YYYY')
    ),
    (
        2,
        250,
        TO_DATE('18/02/2026', 'DD/MM/YYYY')
    ),
    (
        3,
        310,
        TO_DATE('30/06/2026', 'DD/MM/YYYY')
    ),
    (
        4,
        290,
        TO_DATE('01/08/2026', 'DD/MM/YYYY')
    ),
    (
        5,
        90,
        TO_DATE('15/12/2025', 'DD/MM/YYYY')
    ),
    (
        6,
        110,
        TO_DATE('01/08/2025', 'DD/MM/YYYY')
    ),
    (
        7,
        340,
        TO_DATE('18/02/2026', 'DD/MM/YYYY')
    ),
    (
        8,
        70,
        TO_DATE('20/08/2026', 'DD/MM/YYYY')
    ),
    (
        9,
        45,
        TO_DATE('25/03/2026', 'DD/MM/YYYY')
    ),
    (
        10,
        21,
        TO_DATE('14/08/2030', 'DD/MM/YYYY')
    ),
    (
        11,
        29,
        TO_DATE('30/01/2031', 'DD/MM/YYYY')
    ),
    (
        12,
        101,
        TO_DATE('25/10/2025', 'DD/MM/YYYY')
    ),
    (
        13,
        150,
        TO_DATE('10/11/2025', 'DD/MM/YYYY')
    ),
    (
        14,
        46,
        TO_DATE('20/09/2026', 'DD/MM/YYYY')
    ),
    (
        15,
        167,
        TO_DATE('30/08/2026', 'DD/MM/YYYY')
    ),
    (
        16,
        148,
        TO_DATE('12/04/2026', 'DD/MM/YYYY')
    ),
    (
        17,
        91,
        TO_DATE('15/04/2026', 'DD/MM/YYYY')
    ),
    (
        18,
        41,
        TO_DATE('18/06/2027', 'DD/MM/YYYY')
    );

--Tabela dos Funcionarios
CREATE TABLE Funcionarios (
    funcionarioID SERIAL PRIMARY KEY,
    NomeFuncionario VARCHAR(50) NOT NULL,
    email VARCHAR(300),
    cidade VARCHAR(100),
    endereco VARCHAR(300),
    cargo VARCHAR(300)
);

INSERT INTO
    Funcionarios (
        NomeFuncionario,
        email,
        cidade,
        endereco,
        cargo
    )
VALUES (
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

-- Tabela de Pagamentos
CREATE TABLE Pagamentos (
    pagamentoID SERIAL PRIMARY KEY,
    pedidoID INT,
    preco_final DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    metodo_pagamento VARCHAR(100),
    FOREIGN KEY (pedidoID) REFERENCES Pedidos (pedidoID)
);

INSERT INTO
    Pagamentos (
        pedidoID,
        preco_final,
        status,
        metodo_pagamento
    )
VALUES (
        1,
        29.5,
        'Pago',
        'Cartão de Crédito'
    ),
    (2, 50, 'Pendente', 'Pix'),
    (
        3,
        17,
        'Pago',
        'Cartão de Débito'
    ),
    (
        4,
        30,
        'Não creditado',
        'Cartão de Crédito'
    ),
    (5, 11, 'Pago', 'Pix'),
    (
        6,
        16,
        'Não Creditado',
        'Cartão de Crédito'
    ),
    (
        7,
        26,
        'Pago',
        'Cartão de Crédito'
    ),
    (
        8,
        150,
        'Pago',
        'Cartão de Crédito'
    ),
    (9, 12, 'Pago', 'Pix'),
    (10, 111, 'Pago', 'Pix'),
    (11, 49, 'Pendente', 'Pix'),
    (
        12,
        39,
        'Pago',
        'Cartão de Crédito'
    ),
    (
        13,
        51.5,
        'Não Creditado',
        'Cartão de Débito'
    ),
    (14, 90, 'Pago', 'Pix'),
    (15, 79.5, 'Pendente', 'Pix'),
    (
        16,
        47,
        'Pago',
        'Cartão de Débito'
    ),
    (
        17,
        27,
        'Pago',
        'Cartão de Crédito'
    ),
    (18, 176, 'Pago', 'Pix'),
    (
        19,
        123,
        'Não Creditado',
        'Cartão de Débito'
    ),
    (
        20,
        49,
        'Pago',
        'Cartão de Débito'
    );

--Tabela de Entregas

CREATE TABLE Entregas (
    EntregaID SERIAL PRIMARY KEY,
    pedidoID INT NOT NULL,
    EnderecoEntrega VARCHAR(255) NOT NULL,
    DataEnvio DATE,
    StatusEntrega VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID)
);

INSERT INTO
    Entregas (
        pedidoID,
        EnderecoEntrega,
        DataEnvio,
        StatusEntrega
    )
VALUES (
        1,
        'Av. Central, 400, São Paulo',
        TO_DATE('02/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        2,
        'Rua Liberdade, 80, Belo Horizonte',
        TO_DATE('06/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        3,
        ' Rua das Palmeiras, 60, Campinas',
        TO_DATE('12/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        4,
        'Av. Independência, 150, Recife',
        TO_DATE('08/10/2024', 'DD/MM/YYYY'),
        ' Entregue'
    ),
    (
        5,
        'Rua Vitória, 400, Florianópolis',
        TO_DATE('10/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        6,
        'Rua Esperança, 90, Fortaleza',
        TO_DATE('04/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        7,
        'Rua das Flores, 125, Salvador',
        TO_DATE('05/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        8,
        'Rua do Porto, 300, Manaus',
        TO_DATE('07/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        9,
        'Rua das Américas, 200, Goiânia',
        TO_DATE('11/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        10,
        'Av. Brasil, 250, Vitória',
        TO_DATE('03/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        11,
        'Rua Verde, 500, Rio de Janeiro',
        TO_DATE('11/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        12,
        'Rua do Sol, 120, Belo Horizonte',
        TO_DATE('09/10/2024', 'DD/MM/YYYY'),
        'Atrasada'
    ),
    (
        13,
        'Rua do Lago, 700, Brasília',
        TO_DATE('13/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        14,
        'Rua Silva, 455, Natal',
        TO_DATE('14/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        15,
        'Av. do Comércio, 820, São Luís',
        TO_DATE('06/10/2024', 'DD/MM/YYYY'),
        'Atrasada'
    ),
    (
        16,
        'Rua das Araras, 230, Curitiba',
        TO_DATE('10/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        17,
        'Rua das Oliveiras, 140, Belém',
        TO_DATE('15/10/2024', 'DD/MM/YYYY'),
        'Atrasada'
    ),
    (
        18,
        'Rua do Bosque, 450, Porto Alegre',
        TO_DATE('16/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    ),
    (
        19,
        'Rua da Paz, 210, Salvador',
        TO_DATE('08/10/2024', 'DD/MM/YYYY'),
        'Atrasada'
    ),
    (
        20,
        'Rua Azul, 330, São Paulo',
        TO_DATE('09/10/2024', 'DD/MM/YYYY'),
        'Entregue'
    );