-- MS SQL Server

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
