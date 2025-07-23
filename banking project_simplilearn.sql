use finance;
create table cccc_data
LOAD DATA INFILE 'C:/Users/am407/OneDrive/Desktop/Capstone Project/Banking-Financial Fraud Detection/cc_data.csv'
INTO TABLE cc
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from cc_data;
show tables;
desc cc_data;
desc location_data;

select count(*) as total_transactions from cc_data;

select merchant, count(*) as transaction_count from cc_data group by(merchant) order by transaction_count desc limit 10;

select category , avg(amt) from cc_data group by(category);

select count(is_fraud) as fraud_transaction from cc_data where is_fraud=1;

SELECT(CAST(SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) AS percentage_fraudulent
FROM cc_data;

SELECT (SUM(is_fraud) * 100.0) / COUNT(*) AS percentage_fraudulent FROM cc_data;

select cc_data.trans_date_trans_time,cc_data.merchant,cc_data.gender,cc_data.category,cc_data.amt,cc_data.lat,cc_data.long ,location_data.cc_num from cc_data left join location_data on cc_data.cc_num=location_data.cc_num;

Select min(trans_date_trans_time) as earliest_Transaction,max(trans_date_trans_time) as latest_transaction from cc_data;

select city,city_pop from cc_data order by city_pop  desc limit 1;

select sum(amt) as total_amount_spent from cc_data;

select category,count(trans_num) from cc_data group by (category);

select gender,avg(amt) as average_trasaction_amount from cc_data group by(gender);

Based on the data, Sunday has the highest average transaction amount.

SQL Query
Here is the specific SQL query to find the single day of the week with the highest average transaction amount.

SQL

SELECT DATE_FORMAT(trans_date_trans_time, '%W') AS day_of_week, AVG(amt) AS average_transaction_amount
FROM cc_data GROUP BY DATE_FORMAT(trans_date_trans_time, '%W')
ORDER BY average_transaction_amount DESC LIMIT 1;

SELECT
    DATE_FORMAT(trans_date_trans_time, '%W') AS day_of_week,
    AVG(amt) AS average_transaction_amount
FROM
    cc_data
GROUP BY
    DATE_FORMAT(trans_date_trans_time, '%W')
ORDER BY
    average_transaction_amount DESC;trans_date_trans_time;
    
    desc cc_data