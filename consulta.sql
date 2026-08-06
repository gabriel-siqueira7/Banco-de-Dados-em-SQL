/*
atividade módulo 12
*/

use restaurante; 

select * from produtos;  -- nome e categoria dos produtos que tem preço maior que 30
select nome, categoria from produtos where preco > 30;

select * from clientes;  -- nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985
select nome, telefone, data_nascimento from clientes where data_nascimento < '1985-01-01';

select * from info_produtos; -- id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”
select id_produto, ingredientes from info_produtos where ingredientes = 'carne';
select id_produto, ingredientes from info_produtos where ingredientes like '%carne%'; -- outros ingredientes relacionados a 'carne'

select * from produtos; -- nome e a categoria dos produtos ordenados em ordem alfabética por categoria, para cada categoria deve ser ordenada pelo nome do produto
select nome, categoria from produtos order by nome asc, categoria asc; 
select nome, preco from produtos order by preco desc limit 5; -- Selecione os 5 produtos mais caros do restaurante;
select 'Prato principal' from produtos order by categoria limit 2 offset 5; -- selecionar 2 produtos da categoria ‘Prato Principal’ e pular 6 registros (offset = 5)

select pedidos; -- Faça backup dos dados da tabela pedidos com o nome de backup_pedidos
create table backup_pedidos as select * from pedidos; 
drop table pedidos_backup; -- backup duplicado excluído
