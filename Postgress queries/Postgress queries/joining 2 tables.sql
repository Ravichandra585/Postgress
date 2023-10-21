select *
from orders
where order_status in('COMPLETE', 'CLOSED') 
group by 1;

select *
from order_items
where order_item_order_id = 2;

select order_item_order_id
from order_items
order by 1 asc;

select order_item_order_id, round(sum(order_item_subtotal)::numeric, 2) as order_revenue
from order_items
group by order_item_order_id
having round(sum(order_item_subtotal)::numeric, 2) > 2000
order by 2 asc;

select oi.order_item_product_id, oi.order_item_subtotal, o.order_status
from orders as o
left outer join order_items as oi on o.order_id = oi.order_item_order_id
where o.order_status in('COMPLETE', 'CLOSED');

select o.order_id, o.order_date, oi.order_item_id, oi.order_item_product_id, oi.order_item_subtotal, o.order_status
from orders as o
join order_items as oi on o.order_id = oi.order_item_order_id
where o.order_status in('COMPLETE', 'CLOSED')
order by 1;

select o.order_date, oi.order_item_product_id, round(sum(oi.order_item_subtotal)::numeric, 2) as order_revenue, o.order_status
from orders as o
join order_items as oi on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by 1, 2, 4
order by 1, 3 desc;


