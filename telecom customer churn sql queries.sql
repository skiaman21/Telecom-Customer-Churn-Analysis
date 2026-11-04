create table telecom_customers(
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    married VARCHAR(5),
    number_of_dependents INT,
    city VARCHAR(100),
    zip_code INT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    number_of_referrals INT,
    tenure_months INT,
    offer VARCHAR(30),
    phone_service VARCHAR(5),
    avg_monthly_long_distance_charges DECIMAL(10,2),
    multiple_lines VARCHAR(5),
    internet_service VARCHAR(5),
    internet_type VARCHAR(30),
    avg_monthly_gb_download DECIMAL(10,2),
    online_security VARCHAR(5),
    online_backup VARCHAR(5),
    device_protection_plan VARCHAR(5),
    premium_tech_support VARCHAR(5),
    streaming_tv VARCHAR(5),
    streaming_movies VARCHAR(5),
    streaming_music VARCHAR(5),
    unlimited_data VARCHAR(5),
    contract VARCHAR(30),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),
    monthly_charge DECIMAL(10,2),
    total_charges DECIMAL(12,2),
    total_refunds DECIMAL(12,2),
    total_extra_data_charges DECIMAL(12,2),
    total_long_distance_charges DECIMAL(12,2),
    total_revenue DECIMAL(12,2),
    customer_status VARCHAR(20),
    churn_category VARCHAR(50),
    churn_reason VARCHAR(150)
);


select * from telecom_customers
limit 10;

--Query 1: Churn & Revenue Summary
SELECT 
    customer_status,
    COUNT(customer_id) AS total_customers,
    ROUND(COUNT(customer_id) * 100.0 / SUM(COUNT(customer_id)) OVER (), 2) AS status_percentage,
    ROUND(SUM(total_revenue)::numeric, 2) AS total_revenue
FROM telecom_customers
GROUP BY customer_status;

--Query 2: Churn & Revenue Loss by Contract Type
select 
	contract,
	count(customer_id) as total_customers,
	count(customer_id) filter (where customer_status='Churned') as churned_customers,
	round(
		count(customer_id) filter (where customer_status='Churned')*100.0/count(customer_id),
		2
	) as churn_rate_pct,
	round
		(sum(total_revenue) filter (where customer_status='Churned'),
		2) 
	as lost_revenue
from telecom_customers
group by contract
order by churned_customers desc

--Query 3: Top 5 Churn Reasons by Lost Revenue
select churn_category, churn_reason,
count(*) as churend_customer,
sum(total_revenue) as revenue_lost,
rank() over (order by sum(total_revenue) desc) as revenue_loss_rank
from telecom_customers
where customer_status='Churned'
group by churn_category,churn_reason
order by sum(total_revenue) desc
limit 5

--Query 4: Tenure Group vs. Churn Vulnerability
with tenure_buckets as (
select customer_id,
        customer_status,
        monthly_charge,
        total_revenue,
		CASE 
	    	WHEN tenure_months <= 6 THEN '0-6 Months'
	        WHEN tenure_months <= 12 THEN '6-12 Months'
	        WHEN tenure_months <= 24 THEN '1-2 Years'
	        WHEN tenure_months <= 48 THEN '2-4 Years'
	        ELSE '4+ Years'
	  	end as tenure_group
from telecom_customers
)

select 
	tenure_group,
	count(customer_id) as total_customer,
count(customer_id) filter (where customer_status='Churned') as churned,
round(count(customer_id) filter (where customer_status='Churned')*100.0/count(customer_id),2) as churn_rate
from tenure_buckets
group by tenure_group
order by churn_rate desc

--Query 5: Impact of Tech Support Add-On on Retention
select premium_tech_support,
count(customer_id) as total_customer,
count(customer_id) filter (where customer_status='Churned') as churned_customer,
round(count(customer_id) filter (where customer_status='Churned')*100.0/count(customer_id),2) as churn_rate
from telecom_customers
where internet_service='Yes'
group by premium_tech_support
order by churn_rate desc



