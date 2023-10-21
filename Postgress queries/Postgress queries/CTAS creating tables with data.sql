 create table new_daily_revenue
as

select o.order_date, round(sum(oi.order_item_subtotal)::numeric, 2) as order_revenue, o.order_status
from orders as o
join order_items as oi
on o.order_id = oi.order_item_order_id
where order_status in('COMPLETE', 'CLOSED')
group by 1, 3;

drop table daily_revenue

ALTER TABLE new_daily_revenue RENAME TO daily_revenue;

select *
from daily_revenue;

select *
from daily_revenue
order by order_date;

create table daily_product_revenue
as

select o.order_date, oi.order_item_product_id, round(sum(oi.order_item_subtotal)::numeric, 2) as order_revenue, o.order_status
from orders as o
join order_items as oi on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by 1, 2, 4;

select *
from daily_product_revenue
order by 1, 3 desc;