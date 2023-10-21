SELECT * FROM PRODUCTS;

select * from order_details_v;

select order_date
from order_details_v
order by 1 desc;

select *
from products as p
left outer join order_details_v as odv
on odv.order_item_product_id = p.product_id
and to_char(odv.order_date::timestamp, 'yyyy-mm') = '2014-01'
where odv.order_item_product_id is null;


