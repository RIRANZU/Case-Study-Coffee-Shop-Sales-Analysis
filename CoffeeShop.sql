--Understanding my data
SELECT*
FROM BRIGHT_COFFEE.PUBLIC.COFFEE_SHOP;

--Finding opening and closing time
SELECT MIN(TRANSACTION_TIME) As Opening_time, MAX(TRANSACTION_TIME) As Closing_time
FROM BRIGHT_COFFEE.PUBLIC.COFFEE_SHOP;

--New Table to assit with a detailed dashboard
SELECT  TO_DATE(transaction_date) as Purchase_date,
        DAYOFMONTH(TO_DATE(TRANSACTION_DATE)) as Month_Name,
        MONTHNAME(TO_DATE(TRANSACTION_DATE)) as Name_of_month,
        DAYNAME(TO_DATE(TRANSACTION_DATE)) as Day_Name,

        CASE
        WHEN Day_Name not in('Sat','Sun') THEN 'Weekday'
        ELSE 'Weekend'
        END As Day_Of_The_Week,

        CASE
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
        END AS Time_Bucket,
        transaction_id,
        COUNT(TRANSACTION_QTY) As Number_of_Transactions,
        product_id,
        product_type,
        product_detail,
        product_category,
        ROUND(SUM(IFNULL(transaction_qty,0)*IFNULL(unit_price,0)),2) As Total_Sales,
        store_id,
        store_location

FROM BRIGHT_COFFEE.PUBLIC.COFFEE_SHOP
GROUP BY ALL;

    



    
    
