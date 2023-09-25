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
