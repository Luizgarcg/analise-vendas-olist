
-- Desafio 1: Quais os 5 estados com mais pedidos?
select clientes.customer_state, count(pedidos.order_id) from clientes join pedidos on clientes.customer_id = pedidos.customer_id group by clientes.customer_state order by count(pedidos.order_id) desc limit 5;
-- Desafio 2: Quais os 5 estados com mais pedidos entregues?
select  count(pedidos.order_id),clientes.customer_state from pedidos join clientes on pedidos.customer_id = clientes.customer_id where pedidos.order_status = 'delivered' group by clientes.customer_state order by count(pedidos.order_id) desc limit 5;
-- Desafio 3: Quantos itens foram vendidos em cada status de pedido?
select count(itens_pedido.order_item_id),pedidos.order_status from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id group by pedidos.order_status order by  count(itens_pedido.order_item_id) desc;
-- Desafio 4: Quais os 5 estados com maior faturamento (soma do preço dos itens)?
select clientes.customer_state,sum(itens_pedido.price) from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id join clientes on pedidos.customer_id = clientes.customer_id group by clientes.customer_state order by sum(itens_pedido.price) desc limit 5;
-- Desafio 5: Quais os 5 estados com maior preço médio por item (e quantos itens cada um vendeu)?
select  clientes.customer_state,count(itens_pedido.order_item_id),avg(itens_pedido.price) from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id join clientes on pedidos.customer_id = clientes.customer_id group by clientes.customer_state order by avg(itens_pedido.price) desc limit 5;
-- Desafio 6: Quais as 10 cidades com maior faturamento?
select clientes.customer_city,sum(itens_pedido.price) from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id join clientes on pedidos.customer_id = clientes.customer_id group by clientes.customer_city order by sum(itens_pedido.price) desc limit 10;
-- Desafio 7: Quais os 5 estados com maior preço médio por item, considerando só estados com pelo menos 500 itens vendidos?
select  clientes.customer_state,count(itens_pedido.order_item_id),avg(itens_pedido.price) from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id join clientes on pedidos.customer_id = clientes.customer_id group by clientes.customer_state having count(itens_pedido.order_item_id) >= 500 order by avg(itens_pedido.price) desc limit 5;
-- Desafio 8: Quais estados têm faturamento acima de 500 mil em pedidos entregues?
select clientes.customer_state,sum(itens_pedido.price) from itens_pedido join pedidos on itens_pedido.order_id = pedidos.order_id join clientes on pedidos.customer_id = clientes.customer_id where pedidos.order_status = 'delivered' group by clientes.customer_state having sum(itens_pedido.price) > 500000 order by sum(itens_pedido.price) desc;

