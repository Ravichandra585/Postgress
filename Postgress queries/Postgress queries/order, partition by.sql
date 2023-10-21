select order_date, order_revenue
from daily_revenue
group by 1,2
order by 1;

select order_date, order_revenue,
sum(order_revenue) over (partition by 1)
from daily_revenue;
group by 1, 2;


select to_char(dr.order_date::timestamp, 'yyyy-mm') as order_month, dr.order_date, dr.order_revenue,
	sum(order_revenue) over
	(partition by to_char(dr.order_date::timestamp, 'yyyy-mm')) as monthly_order_revenue
from daily_revenue as dr
order by 2;


select order_date, order_revenue,
min(order_revenue) over (partition by 1) as total_order_revenue
from daily_revenue
order by 1;

select order_date, order_revenue,
sum(order_revenue) over (partition by 1) as total_order_revenue
from daily_revenue
order by 1;

select order_date, order_revenue,
max(order_revenue) over (partition by 1) as total_order_revenue
from daily_revenue
order by 1;

