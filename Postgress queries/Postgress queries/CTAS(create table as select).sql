create table order_count_order_status
as

select order_status, count(*)
from orders
group by 1;


select * 
from order_count_order_status
where order_status in ('PENDING_PAYMENT', 'CANCELED');

create table orders_stg
as
select *
from orders
where false;

select *
from orders_stg;