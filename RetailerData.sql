Select count(*) from retailsales;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * 
from retailsales 
where 
sale_date='2022-11-05';




-- Q.2 Write a SQL query to retrieve all transactions where the 
-- category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select *
from retailsales
WHERE
category='Clothing'
and
sale_date >= '2022-11-01'
AND sale_date <  '2022-12-01'
And quantiy <4;



-- Q.3 Write a SQL query to calculate the total sales (total sale) for each category.
Select category,
Sum(total_sale) as total_avg,
count(*) as count_order
from retailsales
group by 1;



-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
ROUND(avg(age),2)
from 
retailsales 
where 
category='Beauty';




-- Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.

(select * 
from retailsales 
where total_sale>1000);



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

Select count(transactions_id) as count_transaction,
gender,category
from retailsales
group by gender,
category;



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
Select * from 
(WITH monthly_sales AS (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sales
    FROM retailsales
    GROUP BY 1, 2
)
SELECT
    year,
    month,
    avg_sales,
    RANK() OVER (
        PARTITION BY year
        ORDER BY avg_sales DESC
    ) AS rank
FROM monthly_sales) where rank =1;


Select * from retailsales
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

select customer_id,Sum(total_sale) as total_purchase
from retailsales 
group by 1
order by 2 desc
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select Count(distinct(customer_id)) as unique_customers ,category
from retailsales 
group by  2;

-- Q.10 Write a SQL query to create each shift and number 
-- of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
With hourly_sales
as
	(select *,
		case 
			When extract(hour from sale_time)<12 then 'Morning'
			When extract(hour from sale_time) between 12 and 17 Then 'Afternoon'
			else 'Evening'
		end as shift
	from retailsales)
select shift,count(transactions_id) from hourly_sales
group by shift;


Select extract(year from current_date) 

--End of this Practice