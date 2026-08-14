/*
Projeto 3
*/

Use restaurante;

-- Crie uma view chamada resumo_pedido do join entre essas tabelas: pedidos: id, quantidade e data / clientes: nome e email / funcionarios: nome / produtos: nome, preco
select * from pedidos;
select * from clientes;
select * from funcionarios;
select * from produtos;

create view resumo_pedido as 
select pe.id_pedido as pedidos, pe.quantidade, pe.data_pedido, c.nome as clientes, c.email, fun.nome as funcionarios, pr.nome as produtos, pr.preco
from pedidos pe
join clientes c on c.id_cliente = pe.id_cliente
join funcionarios fun on pe.id_funcionario = fun.id_funcionario
join produtos pr on pe.id_produto = pr.id_produto
order by c.nome;

select * from resumo_pedido;

-- Selecione o id do pedido, nome do cliente e o total (quantidade * preco) de cada pedido da view resumo_pedido

explain
select pedidos, clientes, 
sum(quantidade * preco) as valor_total
from resumo_pedido
group by pedidos, clientes
order by clientes;

-- Atualiza o view resumo pedido, adicionando campo total

create or replace view resumo_pedido as
select pe.id_pedido as pedidos, pe.quantidade, pe.data_pedido, c.nome as clientes, c.email, fun.nome as funcionarios, pr.nome as produtos, pr.preco,
(pe.quantidade * pr.preco) as Total
from pedidos pe
join clientes c on c.id_cliente = pe.id_cliente
join funcionarios fun on pe.id_funcionario = fun.id_funcionario
join produtos pr on pe.id_produto = pr.id_produto
order by c.nome;

-- Repita a consulta da questão 3, utilizando o campo total adicionado

select * from resumo_pedido;

-- Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto na nossa query

explain
select * from resumo_pedido;

-- adicionado o comando 'index' para melhor pesquisa dos dados

create index idx_pedidos_produto on pedidos(id_produto);
create index idx_pedidos_cliente on pedidos(id_cliente);
create index idx_pedidos_funcionario on pedidos(id_funcionario);

-- Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela info produtos, quando passar o id de produto como argumento (entrada) da função

select * from info_produtos;

DELIMITER //

create function restaurante.BuscaIngredientesProduto(p_idProduto int)
returns varchar(200)
reads sql data
begin
declare nomeIngredientes varchar(200);

select ingredientes into nomeIngredientes
from restaurante.info_produtos
where id_produto = p_idProduto;

return nomeIngredientes;
end//

DELIMITER ;

-- Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10

select restaurante.BuscaIngredientesProduto (10);

-- Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função

select * from resumo_pedido;

-- a média para sabermos a média por pedido

select avg(valor_total_pedido) as media_geral_por_pedido
from (select pedidos, sum(Total) as valor_total_pedido
from resumo_pedido
group by pedidos)
as total_de_cada_pedido; -- média geral por pedido R$ 44,83 

-- agora para função de mediaPedido

DELIMITER //

create function mediaPedido(pedidoID int)
returns varchar(100)
reads sql data
begin
declare totalPedido decimal(10, 2);
declare desempenho varchar(100);

select coalesce(sum(preco * quantidade), 0) into totalPedido
from resumo_pedido
where resumo_pedido.pedidos = pedidoID;

set desempenho = 
case
when totalPedido = 0 then 'Sem Vendas'
when totalPedido <= 15.00 then 'Baixo'
when totalPedido <= 40.00 then 'Médio'
else 'Alto'
end;
return desempenho;
end//

DELIMITER ;

-- Execute a função ‘mediaPedido’ com o id de pedido 5 e depois 6

select mediaPedido(5) as desempenho_vendas;

select mediaPedido(6) as desempenho_vendas;
