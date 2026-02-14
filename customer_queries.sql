SELECT * FROM customer_table;
SELECT Max(previous_purchases),Min(previous_purchases) FROM customer_table;

-- Total Revenue Generate by male vs female customers 
SELECT gender,SUM(purchase_amount) AS Total_Revenue FROM customer_table
GROUP BY gender;

-- Which customers used a discount but still spent more than the average purchase amount?
SELECT customer_id as Cust_ID, purchase_amount as Amount  FROM customer_table
WHERE discount_applied='YES'
AND purchase_amount>(SELECT avg(purchase_amount) FROM customer_table);

-- Which are the top 5 products with the highest average rating? 
SELECT item_purchased As Item, ROUND(avg(review_rating),2) As Avg_Rating FROM customer_table
group by item_purchased
order by avg(review_rating) desc limit 5;

-- Compare the avg purchase amount between Standard and Express Shipping 
SELECT shipping_type AS shipping_type, ROUND(AVG(purchase_amount),2) AS Avg_Purchase_Amount
FROM customer_table
WHERE shipping_type='Express' OR shipping_type='Standard'
GROUP BY shipping_type;

-- Do subscribed customers spend more? Compare avg spend and total revenue between subscribed and unsubscribed customers
SELECT AVG(purchase_amount) AS Avg_Purchase_Amount, SUM(purchase_amount) AS Total_Purchase_Amount,subscription_status As Subscription
FROM customer_table
GROUP BY subscription_status;

-- Which 5 products rely on discounts for purchases? 
SELECT item_purchased AS item, ROUND(SUM(CASE WHEN discount_applied='YES' THEN 1 ELSE 0 END)/COUNT(*) *100,2) AS Discount_rate
FROM customer_table
GROUP BY item_purchased
order by Discount_rate desc
limit 5;


-- Segment customers into new,returning,and loyal based on their total no of purchases and show the count of each segment.
SELECT customer_id,previous_purchases,category,
CASE
	WHEN previous_purchases<=5 THEN 'New'
    WHEN previous_purchases<=20 AND previous_purchases>5 THEN 'Returning'
    ELSE 'Loyal'
END AS Customer_Type
FROM customer_table
GROUP BY customer_id,previous_purchases,category;

-- What are the top 3 most purchased products within each category
WITH CTE AS(
SELECT item_purchased,category,count(customer_id) as total_orders,row_number() OVER(partition by category order by count(customer_id) desc) AS RN
FROM customer_table
group by item_purchased,category
)
SELECT item_purchased,category,total_orders FROM CTE WHERE RN<=3;

-- Are customers who are repeat buyers (more than 5 purchases) also likely to subscribe?
SELECT subscription_status,count(customer_id) as repeat_buyers
FROM customer_table
WHERE previous_purchases>5
group by subscription_status;


