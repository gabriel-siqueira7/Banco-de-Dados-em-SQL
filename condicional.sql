/* 
atividadwe proposta módulo 13
*/

use restaurante;

select * from pedidos;

select * from pedidos -- Selecione todos os pedidos que do id funcionário igual a 4 e status é igual a ‘Pendente’
where id_funcionario = 4 and status_pedido = 'pendente'; 

select * from pedidos where not status_pedido = 'concluído'; -- Selecione todos os pedidos que o status não é igual a ‘Concluído’

select * from pedidos;
select * from pedidos where id_produto in (1, 3, 5, 7, 8) order by id_pedido asc; -- Selecione os pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8

select * from clientes;
select * from clientes where nome like 'C%'; -- Selecione os clientes que começam com a letra c

select * from info_produtos;
select * from info_produtos -- Selecione as informações de produtos que contenham nos ingredientes ‘carne’ ou ‘frango’
where (ingredientes like '%Carne%' or ingredientes like '%Frango%'); 

select * from produtos;
select * from produtos where preco between '20.00' and '30.00'; -- Selecione os produtos com o preço entre 20 a 30

select * from pedidos; -- Atualizar id pedido 6 da tabela pedidos para status = NULL
select * from pedidos where id_pedido = 6;
set sql_safe_updates = 1;
insert into pedidos (id_pedido, id_cliente, id_funcionario, id_produto, quantidade, preco, data_pedido, status_pedido) values
					(6, 1, 2, 3, 1, 29.90, '2024-06-14', 'Pendente');
update pedidos 
set status_pedido = null
where id_pedido = 6;

select * from pedidos where status_pedido is null; -- Selecione os pedidos com status nulos

select id_pedido, status_pedido, ifnull( status_pedido, 'Cancelado') from pedidos; -- Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'

select * from funcionarios; -- Selecione o nome, cargo, salário dos funcionários e adicione um campo chamado media_salario, que irá mostrar ‘Acima da média’, para o salário > 3000, senão 'Abaixo da média'
select nome, cargo, salario,
case
when salario > 3000 then 'Acima da media'
when salario < 3000 then 'Abaixo da media'
end as media_salario
from funcionarios
order by nome asc;
