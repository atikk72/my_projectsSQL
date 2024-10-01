-- lets create a sales table
-- Q-1 Display all columns of the sales table:
select*from sales

--Q-2 Fetch the transaction_id and sale_amount columns where sale_amount is greater than 20:
-- Here we will use group by clause
-- here we can use either group by or go with normal where clause i have done both 
select transaction_id,sale_amount
from sales
group by 
transaction_id,sale_amount
having sale_amount >20


select transaction_id,sale_amount
from sales
where sale_amount>20





--Q-3 Display the customer_id, sale_date, and sale_amount columns
-- where sale_amount is between 10 and 20, sorted by sale_date in descending order:

select customer_id,sale_date,sale_amount
from sales where sale_amount between 10 and 20
order by sale_date desc



-- Q-4What is the total sales amount for all transactions?
select sum(sale_amount) as total_sale_amount from sales


-- Q-5 What is the average sale amount for all transactions?
select avg(sale_amount) as avg_sale_amopunt from sales


-- Q-6 Calculate the maximum and minimum sale amount for all transactions:
select max(sale_amount) as max_sale , min(sale_amount) as min_sale
from sales

-- Q-7 Calculate the total sales amount for each product.
select  product_name,sum(sale_amount) from sales
group by product_name


-- Q-8 calculate the total sales amount for each customer,
-- but only show results for customers who have spent more than $50 in total.
select customer_id, sum(sale_amount) 
from sales
group by customer_id
having  sum(sale_amount) >50



 

