/*
atividade proposta módulo 14
*/

use restaurante; -- Use o banco de dados restaurante

select * from pedidos; -- Calcule a quantidade de pedidos
select count(quantidade) from pedidos;

select count(distinct id_cliente) from pedidos; -- Calcule a quantidade de clientes únicos que realizaram pedidos

select * from produtos; -- Calcule a média de preço dos produtos
select round(avg(preco),2) from produtos;

select * from produtos; -- Calcule o mínimo e máximo do preço dos produtos
select max(preco) from produtos;
select min(preco) from produtos;

select * from produtos; -- Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
select nome, preco, row_number() over (order by preco desc) as ranking_preco from produtos limit 5;

select * from produtos; -- Selecione a média dos preços dos produtos agrupados por categoria
select categoria, round(avg(preco), 2) as media_preco from produtos group by categoria order by categoria;

select * from info_produtos; -- Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
select fornecedor, count(id_produto) from info_produtos group by fornecedor;

select * from info_produtos; -- Selecionar os fornecedores que possuem mais de um produto cadastrado
select fornecedor, count(id_produto) from info_produtos group by fornecedor having count(id_produto) > 1;

select * from pedidos; -- Selecionar os clientes que realizaram apenas 1 pedido
select id_cliente, count(id_cliente) from pedidos where id_produto group by id_cliente having count(id_cliente) = 1;