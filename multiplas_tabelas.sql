/*
Atividade proposta modulo 15
*/

use restaurante;

select * from produtos; -- Selecionar: produtos: id, nome e descrição / info_produtos:  ingredientes
select * from info_produtos;
select produtos.id_produto, produtos.nome, produtos.descricao, info_produtos.ingredientes
from produtos
inner join info_produtos
on produtos.id_produto = info_produtos.id_produto;

select * from clientes; -- Selecionar: pedidos:  id, quantidade e data / clientes: nome e email
select * from pedidos;
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email
from pedidos
inner join clientes
on pedidos.id_cliente = clientes.id_cliente;

select * from pedidos; -- Selecionar: pedidos:  id, quantidade e data / clientes: nome e email / funcionarios: nome
select * from clientes;
select * from funcionarios;
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email, funcionarios.nome
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario;

select * from pedidos; -- Selecionar: pedidos:  id, quantidade e data / clientes: nome e email / funcionarios: nome / produtos: nome, preco
select * from clientes;
select * from funcionarios;
select * from produtos;
select pedidos.id_pedido, pedidos.quantidade, pedidos.data_pedido, clientes.nome, clientes.email, funcionarios.nome, produtos.nome, produtos.preco
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join funcionarios on pedidos.id_funcionario = funcionarios.id_funcionario
inner join produtos on pedidos.id_produto = produtos.id_produto;

select * from clientes; -- Selecionar o nome dos clientes com os pedidos com status ‘Pendente’ e exibir por ordem descendente de acordo com o id do pedido
select * from pedidos;
select c.nome
from clientes c
inner join pedidos pe on c.id_cliente = pe.id_cliente
where pe.status_pedido = 'pendente'
order by pe.id_pedido desc;

select * from clientes; -- Selecionar clientes sem pedidos
select * from pedidos;
select c.*
from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null;

select * from clientes; -- Selecionar o nome do cliente e o total de pedidos cada cliente
select * from pedidos;
select nome,
(select count(*) from pedidos where pedidos.id_cliente = clientes.id_cliente) as total_pedidos
from clientes;

select * from pedidos; -- Selecionar o preço total (quantidade*preco) de cada pedido
select * from produtos;
select * from clientes;
select c.nome, c.email,
(select sum(pe.quantidade*pr.preco)
from pedidos pe
join produtos pr on pe.id_produto = pr.id_produto
where pe.id_cliente = c.id_cliente) as total_pedido
from clientes c order by total_pedido desc;