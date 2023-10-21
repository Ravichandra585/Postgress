select *
from daily_product_revenue
order by 1, 3 desc;

 
 select order_date, order_item_product_id, order_revenue,
 rank() over(order by order_revenue desc) as rnk
 from daily_product_revenue
 where order_date = '2014-01-01 00:00:00.0'
 order by order_revenue desc;
 
 
 select order_date, order_item_product_id, order_revenue
 --rank() over(order by order_revenue desc) as rnk
 from daily_product_revenue
 where to_char (order_date::date, 'yyyy-mm') = '2014-01'
 order by order_date, order_revenue desc;
 
 select order_date, order_item_product_id, order_revenue,
 rank() over(partition by to_char (order_date::date, 'yyyy-mm') = '2014-01' 
			 order by order_revenue desc) as rnk,
			 dense_rank() over(partition by to_char (order_date::date, 'yyyy-mm') = '2014-01' 
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where to_char (order_date::date, 'yyyy-mm') = '2014-01'
 order by order_date, order_revenue desc;
 

  select order_date, order_item_product_id, order_revenue,
 rank() over(partition by order_date
			 order by order_revenue desc) as rnk,
			 dense_rank() over(partition by order_date
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where to_char (order_date::date, 'yyyy-mm') = '2014-01'
 order by order_date, order_revenue desc;
 
 
 --Nested query
 
 select *
 from (  select order_date, order_item_product_id, order_revenue,
 			rank() over(
			 order by order_revenue desc) as rnk,
			 dense_rank() over(
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where order_date = '2014-01-01 00:00:00.0') as Nq
 where rnk <= 5 
 order by order_revenue desc;
 
 
 --CTE
 
 with daily_product_revenue_ranks as
 (select order_date, order_item_product_id, order_revenue,
 			rank() over(
			 order by order_revenue desc) as rnk,
			 dense_rank() over(
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where order_date = '2014-01-01 00:00:00.0'
 ) select * 
 from daily_product_revenue_ranks
 where rnk <= 5 
 order by order_revenue desc;
 
 
  select *
 from (  select order_date, order_item_product_id, order_revenue,
 			rank() over(order by order_revenue desc) as rnk,
			 dense_rank() over(order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where order_date = '2014-01-01 00:00:00.0') as Nq
 where rnk <= 5 
 order by order_revenue desc;
 
 --Nested query using partitions
 
 select * from (select order_date, order_item_product_id, order_revenue,
 rank() over(partition by order_date
			 order by order_revenue desc) as rnk,
			 dense_rank() over(partition by order_date
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where to_char (order_date::date, 'yyyy-mm') = '2014-01'
 order by order_date, order_revenue desc) as Nq
 where rnk <=5
 order by 1, 3 desc;
 
 --CTE with partitions
 
  
  with daily_product_revenue_ranks as 
  (select order_date, order_item_product_id, order_revenue,
 rank() over(partition by order_date
			 order by order_revenue desc) as rnk,
			 dense_rank() over(partition by order_date
			 order by order_revenue desc) as dense_rnk
 from daily_product_revenue
 where to_char (order_date::date, 'yyyy-mm') = '2014-01'
 order by order_date, order_revenue desc) 
 select * from daily_product_revenue_ranks
 where dense_rnk <= 5
 order by 1, 3 desc;
 
 
   