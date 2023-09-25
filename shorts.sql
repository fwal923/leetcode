-- MS SQL Server

-- 182. Duplicate Emails
select
email Email
from person
group by email
having count(email) >1

-- 183. Customers Who Never Order
select
name as Customers
from
customers c
left join orders o on c.id = o.customerid
where o.customerid is null
  
-- 586. Customer Placing the Largest Number of Orders
select top 1
customer_number
from
orders
group by customer_number
order by count(order_number) desc
  
-- 595. Big Countries
select
name, population, area
from
world
where population >= 25000000 or area >= 3000000

-- 1527. Patients With a Condition
select
patient_id, patient_name, conditions
from
patients
where conditions like '% DIAB1%' or conditions like 'DIAB1%'

-- 1581. Customer Who Visited but Did Not Make Any Transactions
select customer_id, count (v.visit_id) as count_no_trans
from visits v
left outer join transactions t on v.visit_id = t.visit_id
where t.visit_id IS NULL
group by customer_id
