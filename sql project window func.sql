select*from sales12

--Q-1 Display the total sales amount for each customer.


select customer_name,sum(quantity*price) as total_sales
from sales12
group by customer_name


-- Q-2  Rank the customers based on their total sales amount.

select customer_name , rank() over(order by  sum(quantity*price)desc) as sales_rank
from sales12
group by customer_name



-- Q-3  Display the daily sales amount for each product using a window function.


select date,product_name,sum(price*quantity) over (partition by date) as daily_sales
from sales12




-- Q-4  Display the top-selling product for each customer.

-- -select customer_name,product_name ,sum(quantity*price) ,rank() 
-- over (order by product_name) as top_selling_product
-- from sales12
-- group by product_name,customer_name

SELECT customer_name, product_name, total_sales_amount
FROM (
  SELECT customer_name, product_name, SUM(price * quantity) AS total_sales_amount,
         RANK() OVER(PARTITION BY customer_name ORDER BY SUM(price * quantity) DESC) AS rank
  FROM sales12
  GROUP BY customer_name, product_name
) 
WHERE rank = 1;


-- Q-5 Display the average quantity of each product sold per day using a window function.
SELECT date, product_name,  ROUND(AVG(quantity) OVER(PARTITION BY product_name ORDER BY date), 2) AS avg_quantity_per_day
FROM sales12
ORDER BY date, product_name;