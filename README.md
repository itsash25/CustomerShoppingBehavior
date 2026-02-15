# Customer Shopping Behaviour Analysis (Power BI)

## 📌 Project Overview
This project analyzes customer shopping behaviour using transactional retail data to uncover insights about customer segments, subscription impact, discounts, demographics, and purchasing patterns. The goal is to support data-driven decisions for marketing, retention, and sales strategy.

## 🛠️ Tools & Technologies
- Power BI (Data modeling, DAX, Dashboarding)
- SQL (Data validation & exploration – optional)
- Excel / CSV (Source data)

## 📊 Key KPIs
- Total Customers: 3.9K  
- Average Purchase Amount: $59.76  
- Average Customer Rating: 3.75  

## 📈 Dashboard Features
- Customer distribution by Subscription Status (Yes/No)
- Sales by Category (Clothing, Accessories, Footwear, Outerwear)
- Revenue comparison: Discount vs No Discount
- Sales by Age Group (Young, Adults, Middle-Aged)
- Customer segmentation by Previous Purchases:
  - New
  - Returning
  - Loyal
- Interactive filters:
  - Subscription Status  
  - Gender  
  - Shipping Type  
  - Category  

## 🧠 Customer Segmentation Logic
Customers were segmented based on the `previous_purchases` column:
- New: Low or zero previous purchases  
- Returning: Moderate purchase history  
- Loyal: High number of previous purchases  

> Note: The dataset did not include an explicit repeat-customer flag, so customer types were engineered using purchase history.

## 🔍 Key Insights
- Majority of customers fall under the Loyal segment, contributing to a stable revenue base.
- Non-subscribed customers form a larger share of the customer base.
- Clothing and Accessories generate the highest sales volume.
- Adult and Middle-Aged customers contribute significantly more revenue than younger customers.
- Orders without discounts generate higher total revenue compared to discounted orders.

## 📁 Repository Structure
- /data → Raw dataset  
- /powerbi → Power BI (.pbix) file  
- /images → Dashboard screenshots  
- README.md  

## 🚀 Future Improvements
- Add time-series analysis (monthly/quarterly trends)
- Include churn or retention metrics
- Build a customer lifetime value (CLV) estimate
- Add cohort analysis for repeat purchases
