/*
570. Managers with at Least 5 Direct Reports

Task:
Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.
Return the result table in any order.
The result format is in the following example.

Example 1:
Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | None      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/

/*
goal: query to find managers with 5+ reports, any order
sequence:
1. need to identify managers (managerid) -> name, managerid
2. need to count managerids (count name, group by managerid)
3. join the tables (where name is taken from managerid = id) and display all managers where count is 5+
*/

select
name
from employee
join
(select
managerid as managers_id,
count(managerid) as direct_reports
from employee
where managerid is not null
group by managerid
having count(managerid) >= 5) as temp on employee.id = temp.managers_id
