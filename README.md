# Retail Sales SQL Analysis

A SQL practice project for analyzing retail sales data using queries focused on transactions, categories, customers, sales trends, and time-based order patterns.

## 📌 Project Overview

This project contains a collection of SQL queries written against a `retailsales` table. The queries demonstrate common SQL techniques used in data analysis, including:

- Filtering records by date and category
- Aggregating sales with `SUM()` and `AVG()`
- Counting transactions and unique customers
- Grouping data by category and gender
- Identifying top customers
- Analyzing monthly sales performance
- Using Common Table Expressions (CTEs)
- Using window functions such as `RANK()`
- Extracting year, month, and hour from date/time fields
- Creating business-friendly time shifts with `CASE`

## 🗂️ Project Structure

```text
.
├── RetailerData.sql    # SQL queries and analysis exercises
└── README.md           # Project documentation
```

## 🛠️ Technologies

- **SQL**
- Relational database supporting standard SQL functions such as `EXTRACT()`, CTEs, and window functions

> **Note:** Some syntax in the SQL file, such as `EXTRACT()` and date/time handling, is database-specific. PostgreSQL-compatible syntax is a reasonable choice for running the current queries.

## 📊 Dataset

The queries operate on a table named:

```sql
retailsales
```

The SQL file references fields including:

| Column | Purpose |
|---|---|
| `transactions_id` | Transaction identifier |
| `sale_date` | Date of sale |
| `sale_time` | Time of sale |
| `customer_id` | Customer identifier |
| `gender` | Customer gender |
| `age` | Customer age |
| `category` | Product category |
| `quantiy` | Quantity sold |
| `total_sale` | Total value of the sale |

The exact schema and data types should be verified against the database used to run the project.

## 🔎 Analysis Questions

`RetailerData.sql` covers the following analysis tasks:

1. Retrieve all sales made on a specific date.
2. Filter clothing transactions by quantity and November 2022.
3. Calculate total sales and order count for each category.
4. Calculate the average customer age for the Beauty category.
5. Find transactions with sales greater than 1,000.
6. Count transactions by gender and category.
7. Calculate average sales by month and identify the best-selling month in each year.
8. Find the top 5 customers based on total sales.
9. Count unique customers in each category.
10. Classify orders into Morning, Afternoon, and Evening shifts and count transactions per shift.

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone <your-repository-url>
cd <your-repository-folder>
```

### 2. Create or select your database

Create the `retailsales` table and load the retail sales dataset into your SQL database.

### 3. Run the SQL file

Open `RetailerData.sql` in your preferred SQL client and execute the queries.

For PostgreSQL, you can also run:

```bash
psql -d <database_name> -f RetailerData.sql
```

Replace `<database_name>` with your database name.

## 💡 SQL Concepts Demonstrated

### Filtering

Uses `WHERE` conditions to retrieve records matching specific business requirements.

### Aggregation

Uses functions such as:

```sql
SUM()
AVG()
COUNT()
```

to produce sales and customer metrics.

### Grouping

Uses `GROUP BY` to analyze results across categories, genders, customers, and time periods.

### CTEs

The monthly sales analysis uses a Common Table Expression to make the query easier to organize and read.

### Window Functions

`RANK()` is used to determine the highest-performing month within each year.

### CASE Expressions

The shift analysis uses `CASE` to convert sale times into business-friendly periods:

- **Morning:** before 12:00
- **Afternoon:** 12:00–17:00
- **Evening:** after 17:00

## ⚠️ Query Notes

Before using the SQL file in production or presenting the results, review the following items:

- **Question 2 mismatch:** The comment says quantity sold should be **more than 10**, but the current query uses `quantiy < 4`. The condition should be updated if the intended requirement is quantity greater than 10.
- **Column name:** `quantiy` appears to be a typo for `quantity`. Confirm the actual column name in the database before changing it.
- **Q7 wording:** The query ranks months by **average sale**, so “best-selling month” here means the month with the highest average transaction value, not necessarily the highest total sales.
- **Q6:** The query uses `transactions_id`; verify that this matches the actual transaction ID column in the database.
- **Database compatibility:** Functions such as `EXTRACT()` may require adjustments depending on the SQL database being used.

## 🎯 Learning Objectives

This project is useful for practicing SQL skills that are commonly required in entry-level data analyst and business intelligence roles, especially:

- Data filtering
- Data aggregation
- Customer analysis
- Sales performance analysis
- Time-series analysis
- Business KPI calculation
- Advanced SQL querying

## 📈 Possible Improvements

Future versions of the project could include:

- Data cleaning and validation queries
- Monthly and yearly revenue dashboards
- Category-level sales trends
- Customer segmentation
- Repeat-customer analysis
- Revenue contribution by category
- Running totals and month-over-month growth
- Views for commonly used business metrics
- A Power BI or Tableau dashboard built from the SQL results

## 👤 Author

**Hrutik Hiwase**

If you found this project useful, feel free to ⭐ the repository and use the queries as a starting point for your own SQL practice.
