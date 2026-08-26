SELECT COUNT(*) FROM retailsales;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * 
FROM retailsales 
WHERE 
sale_date='2022-11-05';




-- Q.2 Write a SQL query to retrieve all transactions where the 
-- category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT *
FROM retailsales
WHERE
category='Clothing'
AND
sale_date >= '2022-11-01'
AND sale_date <  '2022-12-01'
And quantiy <4;



-- Q.3 Write a SQL query to calculate the total sales (total sale) for each category.
SELECT category,
SUM(total_sale) AS total_avg,
COUNT(*) AS count_order
FROM retailsales
GROUP by 1;



-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
ROUND(avg(age),2)
FROM 
retailsales 
WHERE 
category='Beauty';




-- Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.

SELECT * 
FROM retailsales 
WHERE total_sale>1000;



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT COUNT(transactions_id) as count_transaction,
gender,category
FROM retailsales
GROUP by gender,
category;



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT * FROM 
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
FROM monthly_sales) 
WHERE rank =1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

SELECT customer_id,Sum(total_sale) as total_purchase
FROM retailsales 
GROUP by 1
ORDER by 2 desc
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT COUNT(DISTINCT(customer_id)) AS unique_customers ,category
FROM retailsales 
GROUP by  2;

-- Q.10 Write a SQL query to create each shift and number 
-- of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sales
AS
	(SELECT *,
		CASE 
			WHEN extract(HOUR FROM sale_time)<12 THEN 'Morning'
			WHEN extract(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END as shift
	FROM retailsales)
SELECT shift,COUNT(transactions_id) From hourly_sales
GROUP by shift;


--End of this Practice
