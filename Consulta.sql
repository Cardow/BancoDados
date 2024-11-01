
--Selecionar Todos os Produtos
SELECT * FROM Produtos

--Selecionar Clientes por Cidade
SELECT * FROM Clientes WHERE cidade = 'São Paulo';
SELECT * FROM Clientes WHERE cidade = 'Fortaleza';

--Selecionar Pedidos recentes (Últimos 30 dias)

SELECT * FROM Pedidos WHERE DataPedido BETWEEN TO_DATE ('17/10/2024', 'DD/MM/YYYY') AND TO_DATE ('30/11/2024', 'DD/MM/YYYY');

--Selecionar Produtos com Estoque baixo

SELECT * FROM Estoque WHERE quantidade < 50;

--Selecionar Produtos por Marca

SELECT Produtos.Nomeproduto, Marcas.nomemarca FROM Produtos
JOIN Marcas ON Produtos.marca = Marcas.marcaID
WHERE NomeMarca = 'PharmaForte'

SELECT Produtos.Nomeproduto, Marcas.nomemarca FROM Produtos
JOIN Marcas ON Produtos.marca = Marcas.marcaID
WHERE NomeMarca = 'NutriEssence'

--Selecionar pagamentos pendentes

SELECT * FROM Pagamentos WHERE Status = 'Pendente' OR Status = 'Não Creditado';

--Selecionar Produtos com Descontos

SELECT * FROM Produtos WHERE desconto > 0;

--Selecionar Entregas Atrasadas

SELECT * FROM Entregas WHERE StatusEntrega = 'Atrasada';

--Listar todos os produtos e suas marcas
SELECT Produtos.Nomeproduto, Marcas.nomemarca FROM Produtos
JOIN Marcas ON Produtos.marca = Marcas.marcaID

--Listar todos os produtos e seus fornecedores

SELECT Produtos.Nomeproduto, Fornecedores.nomefornecedor FROM Produtos
JOIN Fornecedores ON Produtos.fornecedor = Fornecedores.fornecedorID

--Listar clientes com pedidos recentes (últimos 90 dias)

SELECT Clientes.nomecliente, Pedidos.pedidoid, Pedidos.datapedido, Pedidos.status FROM Pedidos 
JOIN Clientes ON Pedidos.clienteid = Clientes.clienteid
WHERE DataPedido BETWEEN TO_DATE ('01/09/2024', 'DD/MM/YYYY') AND TO_DATE ('30/11/2024', 'DD/MM/YYYY');
