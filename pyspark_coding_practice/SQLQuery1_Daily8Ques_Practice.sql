

---------------------------------------------------------------1️ Select all employees from the Employee table.----------------------------------------

SELECT * FROM Prac_M.Employees1


----------------------------------------------------------------2.  Select employee name and salary only.--------------------------------------------------

SELECT F_Name, L_Name, salary FROM Prac_M.Employees1

-----------------------------------------------------------------3. Find employees whose salary is greater than 50,000.-----------------------------------

SELECT emp_id, F_Name, salary
FROM Prac_M.Employees1
WHERE salary > 50000

-------------------------------------------------------------4. Find total employees in each department.---------------------------------------------
SELECT dept_id, COUNT(*) AS Total_Employees
FROM Prac_M.Employees1
GROUP BY dept_id
ORDER BY dept_id

------------------------------------------

SELECT d.dept_name, count(*) AS Tptal_Employees
FROM Prac_M.Employees1 e
JOIN Prac_M.department d
		ON e.dept_id = d.dept_id
GROUP BY dept_name
ORDER BY dept_name

-------------------------------------------------------------5. List employees who joined in the year 2024.----------------------------------------------------

SELECT emp_id, F_Name, L_Name, join_date
FROM Prac_M.Employees1
WHERE YEAR(join_date) = '2024'


--------------------------------------------------------------6. Find employees whose name starts with letter 'M'--------------------------------------------------------

SELECT F_Name,L_Name 
FROM Prac_M.Employees1
WHERE F_Name LIKE 'M%'

---------------------------------------------------------------7.Find highest salary employee in each department.------------------------------------------------------------

SELECT  dept_id, MAX(salary) AS Highest_Salary 
FROM Prac_M.Employees1
GROUP BY dept_id
ORDER BY  dept_id DESC


----------------------------------------------------------------

SELECT  d.dept_name ,MAX(salary) OVER (PARTITION BY (d.dept_name) ) AS Highest_Salary
FROM Prac_M.Employees1 e JOIN Prac_M.department d 
	ON d.dept_id= e.dept_id
---------------------------------------------------------------------------

SELECT emp_id, F_name, L_name, salary
FROM Prac_M.Employees1 e
WHERE Salary = (
					SELECT MAX(salary) 
					FROM Prac_M.Employees1
					WHERE dept_id = e.dept_id
				)


---------------------------------------------------- 8. For each department, assign row_number based on highest salary first.----------------------------------------------------------------------

SELECT e.emp_id,e.F_Name, e.L_Name, e.salary,e.dept_id,d.dept_name, 
		ROW_NUMBER() OVER(Partition BY d.dept_name ORDER BY e.salary DESC)  AS Row_Number
FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id= e.dept_id
ORDER BY emp_id ,  Row_Number

-----------------------------------------------------9. Select all employees who belong to the ‘HR’ department.Use WHERE.----------------------------------------------------------------------------

SELECT * FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
WHERE dept_name = 'HR'

------------------------------------------------------10. Show employee name, salary and department ordered by salary (descending).------------------------------------------------------------

SELECT e.F_Name, e.L_Name,e.salary, d.dept_name
FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
ORDER BY salary

-------------------------------------------------------11.  Find employees whose salary is between 40,000 and 80,000.Use BETWEEN-------------------------------------------

SELECT emp_id,F_Name, L_Name, salary
FROM Prac_M.Employees1 
WHERE salary BETWEEN  700000 AND 900000

--------------------------------------------------------12. Count how many employees have a manager_id as NULL.(Employees without manager)---------------------------------------------------------------------------

SELECT COUNT(*) AS EMP_Without_Manager
FROM Prac_M.Employees1
WHERE manager_id IS NULL


--------------------------------------------------------13. Find the total salary expense for each department.GROUP BY + SUM.-----------------------------------------------

SELECT sum(salary)AS Salary_ExpenseEach_dept, d.dept_name
FROM Prac_M.Employees1 e  JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
GROUP BY dept_name


--------------------------------------------------------14. List employees who joined in the last 6 months.Use date functions (DATEDIFF or >= DATEADD).--------------
SELECT e.emp_id, e.F_Name, e.L_Name, d.dept_name, e.join_date
FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
WHERE join_date >= DATEADD(MONTH, -6, CAST(GETDATE() AS DATE))
ORDER BY join_date DESC


---------------------------------------------------------15. Find second highest salary in the company.--------------------------------------------------

SELECT  MAX(salary)AS second_Highest_Salary
FROM Prac_M.Employees1 
WHERE salary < (
	SELECT MAX(salary) 
	FROM Prac_M.Employees1)
---------------------------------------------------------------Highest Salary---------------------------------------------------

SELECT salary AS highest_salary
FROM Prac_M.Employees1
WHERE salary = (
    SELECT MAX(salary)
    FROM Prac_M.Employees1);

---------------------------------------------------16. For each department, show employees whose salary is above department average.--------------------------
SELECT
    e.emp_id,
    e.f_name,
    e.l_name,
    e.dept_id,
    e.salary
FROM Prac_M.Employees1 e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Prac_M.Employees1
    WHERE dept_id = e.dept_id
)
ORDER BY e.dept_id, e.salary DESC;

--------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT
    emp_id,f_name, l_name,dept_id,
    salary
FROM (
    SELECT e.*, AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg_salary
    FROM Prac_M.Employees1 AS e
) t
WHERE t.salary > t.dept_avg_salary
ORDER BY dept_id, salary DESC;


-------------------------------------------------------------- 17. Show all employees whose department is NOT ‘HR’.-----------------------------------------------------------------------

SELECT e.emp_id, e.F_Name, e.L_Name, d.dept_name
FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
WHERE d.dept_name <> 'HR'
ORDER BY emp_id

----------------------------------------------------------------18. Select employees whose name contains the letter ‘a’.--------------------------------------------------------------------

SELECT emp_id,F_Name, L_Name
FROM Prac_M.Employees1 
WHERE L_Name LIKE '%a%' OR F_Name LIKE '%a%'
ORDER BY emp_id


-----------------------------------------------------------------19. Find employees who joined before 2023.---------------------------------------------------------------------------------

SELECT emp_id, F_Name,L_Name, join_date
FROM Prac_M.Employees1
WHERE join_date < '2023-01-01'
ORDER BY join_date

-----------------------------------------------------------------20. Show the average salary for each department.-----------------------------------------------------------

SELECT  AVG(e.salary) AS Avg_Salary, d.dept_name
FROM Prac_M.Employees1 e JOIN Prac_M.department d
		ON d.dept_id = e.dept_id
GROUP BY d.dept_name

-----------------------------------------------------------------21. List departments having more than 5 employees.---------------------------------------------------------

SELECT d.dept_name, COUNT(*) AS total_EMP
From Prac_M.Employees1 e join Prac_M.department d
		ON d.dept_id = e.dept_id
GROUP BY dept_name
HAVING COUNT(*) >1
ORDER BY total_EMP DESC


-----------------------------------------------------------------22. Show employees whose salary is more than the average salary of entire company.---------------------------------------------------------------------

SELECT emp_id, F_Name, L_Name, salary
FROM Prac_M.Employees1 
WHERE salary > (select AVG(salary) FROM Prac_M.Employees1 )

------------------------------------------------------------------- AVG salary of company -------------------------------------------------------------------------------
SELECT AVG(salary) As AVG_salary FROM Prac_M.Employees1
 
------------------------------------------------------------------23. For each employee, show their manager’s name.-----------------------------------------------------------

SELECT e.emp_id, e.F_Name, e.L_Name , m.manager_name
FROM Prac_M.Employees1 e JOIN Prac_M.Employees1 m
			ON e.manager_id = m.emp_id

------------------------------------------------------------------24. Show top 3 highest paid employees in the company.----------------------------------------------------------
with sal AS(
SELECT  emp_id, F_Name,L_Name, salary,
dense_rank() OVER(  ORDER bY salary DESC) AS rnk
FROM Prac_M.Employees1
)
SELECT emp_id, f_Name, L_Name, salary 
FROM sal 
where rnk <= 3

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT  TOP 3 emp_id, F_Name,L_Name,  salary
FROM Prac_M.Employees1
ORDER BY salary DESC


-------------------------------------------------------- DAY 4 : 1.	Show all employees who have a salary less than 35,000.----------------------------------------------------------

SELECT * FROM Prac_M.Employees1 WHERE salary <35000


-------------------------------------------------------------2.	Select employee name and joining year only.---------------------------------------------------------------------------

SELECT F_Name, L_Name, join_date FROM Prac_M.Employees1


-------------------------------------------------------------3.	Find all employees whose manager_id is NOT NULL.-----------------------------------------------------------------------

SELECT * FROM Prac_M.Employees1 WHERE manager_id IS NOT NULL


-------------------------------------------------------------4. Find the number of employees who joined each year.----------------------------------------------------------------

SELECT 
		YEAR(join_date) AS joining_year,
		COUNT(*) AS employee_count
FROM Prac_M.Employees1 
GROUP BY YEAR(join_date)

---------------------------------------------------------------5. 	Show departments where the average salary is above 50,000.------------------------------------------------

SELECT d.dept_name, AVG(e.salary) AS Avg_salary_dept 
FROM Prac_M.Employees1 e JOIN Prac_M.department d 
	ON  d.dept_id = e.dept_id
GROUP bY dept_name
HAVING AVG(e.salary) > 50000


---------------------------------------------------------------6.	Find employees whose salary is within the top 30% of all salaries.-------------------------------------------

WITH emp AS (
		SELECT 
			emp_id, F_Name,  L_Name, salary,
			ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn,
			COUNT(*) OVER() AS total_employees
			FROM Prac_M.Employees1
)
SELECT emp_id, F_Name, L_Name, salary
FROM emp
WHERE rn <= total_employees * 0.3
ORDER BY salary DESC

-----------------------------------------------------------------7.	Display each employee with their manager's name and manager's department.-----------------------------------

SELECT manager_id, manager_name, emp_id, F_Name
FROM Prac_M.Employees1

ORDER BY emp_id

-----------------------------------------------------------------8.	Find the third highest salary in each department.----------------------------------------------------------

WITH cte AS (
    SELECT 
        dept_id,
        emp_id,
        F_Name,
        L_Name,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM Prac_M.Employees1
)
SELECT dept_id, emp_id, F_Name, L_Name, salary
FROM cte
WHERE rn = 3;


---------------------- day 5 : 1. Display emp_name and salary for employees whose salary is between 50,000 and 90,000.-------------------------

SELECT 
		first_name, last_name, salary
FROM imp.employees
WHERE salary BETWEEN 50000 AND 90000


----------------------2 . Display emp_name and dept_name for all employees, including employees without any department.------------------------

SELECT 
		e.first_name, e.last_name,
		d.department_name
FROM imp.employees e 
LEFT JOIN imp.department d
		ON d.department_id = e.department_id


----------------------- 3. Find department‑wise total salary, but show only departments where total salary > 200,000.---------------------------------

SELECT
	SUM(e.salary) AS Total_Salary,
	d.department_name
FROM imp.employees e 
JOIN imp.department d
	ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 20000

----------------------4. Display emp_name, dept_id, salary and show average salary of the department for every employee-----------------------

SELECT
		e.first_name, e.last_name,
		e.department_id, e.salary,d.department_name,
		AVG(e.salary) OVER(PARTITION BY d.department_name) AS Avg_salary
FROM imp.employees e
JOIN imp.department d
	ON d.department_id = e.department_id


-----------------------5 . Find employees who belong to the HR department . -------------------

SELECT 
		e.first_name, e.last_name
FROM imp.employees e
WHERE  department_id = (
		SELECT department_id FROM imp.department
		WHERE department_name = 'HR'
)


---------------------- 6 . Find employees who have never placed any orders. ----------------------------------------

SELECT 
		e.first_name, e.last_name 
FROM imp.employees e 
WHERE   NOT EXISTS(
			SELECT o.order_id
			FROM imp.Orders o
			WHERE e.employee_id = o.employee_id
)

------------------------ 7. Find employee where order id is not NULL . ---------------------------------------------
SELECT * FROM imp.employees e
JOIN imp.Orders o
	ON e.employee_id = o.employee_id
WHERE o.order_id  IS NOT NULL

------------------------- 8 . Find employee where order_id is NULL . ----------------------------------------------------
SELECT * 
FROM imp.employees e 
LEFT  JOIN imp.Orders o 
	ON e.employee_id = o.employee_id
WHERE order_id IS NULL

------------------------  9. Using a CTE, find all employees whose salary is greater than the average salary of the company. ------------

WITH cte1 AS (
		SELECT AVG(salary) AS Avg_Salary
		FROM imp.employees
)

SELECT * 
FROM imp.employees e JOIN cte1 c
ON e.salary > c.Avg_Salary

-------------------------------------------------------------

-------------------------- 10 . Display emp_name and salary for employees whose salary is greater than 60,000. -----------------------------------
SELECT 
		first_name, last_name, salary
FROM imp.employees
WHERE salary > 60000


------------------------- 11 . Display emp_name and dept_name for all employees, including employees who do not belong to any department.-------------------

SELECT 
		e.first_name, 
		e.last_name, 
		d.department_name
FROM imp.employees e 
LEFT JOIN imp.department d
		ON e.department_id = d.department_id


----------------------- 12 . Find dept_id and number of employees in each department, but show only departments having more than 3 employees.------

SELECT 
	d.department_id,
	COUNT(e.employee_id) AS No_of_emp
FROM imp.employees e JOIN imp.department d
	ON e.department_id = d.department_id
GROUP BY d.department_id
HAVING COUNT(e.employee_id) >=2

------------------------ 13. Display emp_name, dept_id, salary and show the highest salary of the department for every employee . -------------------
SELECT 
	first_name, 
	last_name, 
	department_id,
	salary,
	MAX(salary) OVER(PARTITION BY department_id ORDER BY salary DESC) AS highest_salary
FROM imp.employees

----------------------- 14. Find employees who belong to the Finance department. ------
SELECT
	first_name
FROM imp.employees
WHERE department_id = (
			select department_id 
			FROM imp.department
			WHERE department_name = 'HR')

----------------------- 15. Find employees who have never placed any orders. -------

SELECT
	first_name,
	last_name
FROM imp.employees e
WHERE NOT EXISTS(
		SELECT  1
		FROM imp.Orders o
		WHERE o.employee_id = e.employee)

SELECT * FROM imp.Orders


------------------------16. Display emp_name and hire_date for employees hired between 2018 and 2022.-----------

SELECT first_name, last_name, hire_date
FROM imp.employees
WHERE hire_date BETWEEN '2018' AND '2022'


-------------------17. Display emp_name and dept_name for employees who belong to the IT department. --------------

SELECT e.first_name, e.last_name, d.department_name
FROM imp.employees e JOIN imp.department d
	ON e.department_id = d.department_id
WHERE d.department_name = 'IT'


------------------ 18. Find dept_id and total salary for each department, but show only departments where total salary > 180000.-----------------

SELECT SUM(e.salary) AS total_salary,d.department_name
FROM imp.employees e JOIN imp.department d
	ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) >18000

------------------19. Display emp_name, dept_id, salary and assign ROW_NUMBER within each department ordered by salary descending.-----------

SELECT	first_name,
		last_name, 
		department_id, 
		salary,
		ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS Row_Numbers
FROM imp.employees 

----------------20. Display emp_name and salary for employees whose salary is less than 70,000.--------------

SELECT emp_name , salary
FROM imp.Emp
WHERE salary < 70000

---------------21. Display emp_name and dept_name for employees who belong to the Sales department. ------------------------------

SELECT e.emp_name, d.department_name
FROM  imp.Emp e
RIGHT JOIN imp.department d
	ON d.department_name = e.department
WHERE d.department_name = 'Sales'

------22. Find dept_id and number of employees in each department, but show only departments having more than 2 employees.------

SELECT 
		
		department_id,
		COUNT(employee_id) AS dept_count
FROM imp.employees
GROUP BY department_id
HAVING COUNT(employee_id) >=2

-------------23. Display emp_name, dept_id, salary and assign DENSE_RANK based on salary within each department---------

SELECT		
			first_name,
			department_id,
			salary,
			department,
			DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
FROM imp.employees


----------------24. Find employees whose department name is IT. -----------------------

SELECT first_name, department
FROM imp.employees
WHERE department_id IN (
		SELECT department_id 
		FROM imp.employees
		WHERE department = 'IT'
)


---------------25. Find employees who do not have any orders. -------------

SELECT *
FROM imp.Emp e
WHERE NOT EXISTS(
		SELECT 1
		FROM imp.Orders1 o
		WHERE o. customer_id = e.emp_id
)


---------------26. Display emp_name and salary from imp.Emp for employees whose salary is greater than 60,000.------------------------------

SELECT emp_name , salary
FROM imp.Emp
WHERE salary > 60000


-------------27. Display emp_name, department, and amount for employees who have placed orders.---------

SELECT  e.emp_name, e.department, o.amount, o.order_id
FROM imp.Emp e JOIN imp.Orders1 o
	ON e.emp_id = o.customer_id


------------28. Find department‑wise average salary from imp.Emp, but show only departments where average salary is above 55,000.---------------------

SELECT  AVG(salary) AS Avg_salary, department
FROM imp.Emp
GROUP BY department
HAVING AVG(Salary) > 55000


---29. From imp.Employee_Salary, display emp_name, department, salary and assign RANK based on salary within each department (highest salary = rank 1).--

SELECT	emp_name, 
		department, 
		salary, 
		RANK() OVER(PARTITION BY department ORDER BY salary) AS rank_sal
FROM imp.Employee_Salary

---------------------30 . Find employees from imp.Emp who have placed at least one order.-----------------

SELECT * 
FROM imp.Emp
WHERE EXISTS(
		SELECT 1
		FROM imp.Orders1 o
		WHERE emp_id = o.customer_id 
)



------------------.-----------------------------------------------------------------------------

SELECT * 
FROM imp.Emp e
WHERE NOT EXISTS (
	SELECT 1
	FROM imp.Orders1 o
	WHERE e.emp_id = o.customer_id

)

------------------32. Show emp_name and hire_date for employees hired after 2020.-------------------------------

SELECT * FROM imp.Emp

ALTER TABLE imp.Emp
ADD hire_date DATE;


UPDATE imp.Emp
SET hire_date = '2021-01-15'
WHERE emp_id = 1;

UPDATE imp.Emp
SET hire_date = '2020-06-10'
WHERE emp_id = 2;

UPDATE imp.Emp
SET hire_date = '2022-03-20'
WHERE emp_id = 3;

UPDATE imp.Emp
SET hire_date = '2019-11-05'
WHERE emp_id = 4;

UPDATE imp.Emp
SET hire_date = '2023-02-18'
WHERE emp_id = 5;


--------------------------31. Show emp_name and hire_date for employees hired after 2020.. -------------------------------------

SELECT
		emp_name,
		hire_date
FROM imp.Emp
WHERE hire_date >= '2021-01-01'


---------------------------32. Show emp_name and department_name for all employees, including employees who do not belong to any department.------------------

		
SELECT
		e.first_name,
		d.department_name
FROM imp.employees e
LEFT JOIN imp.department d
	ON e.department_id = d.department_id


-------------------- 33. Find department_id and average salary of each department,but show only departments where average salary > 60,000.----------

SELECT department_id,
		AVG(salary) AS avg_salary
FROM imp.employees
GROUP BY department_id
HAVING AVG(salary) > 60000


----------------------34. Show emp_name, department_id, salary, and average salary of that department for every employee.--------------------

SELECT 
		first_name,
		department_id,
		salary,
		AVG(salary) OVER(PARTITION BY department_id) AS avg_sal
FROM imp.employees

-----------------------35. Find employees who belong to the HR department,---------------------

SELECT *
FROM imp.employees
WHERE department_id IN ( 
		
				SELECT department_id
				FROM imp.department
				WHERE department_name = 'HR'
)

---------------------- 36. Find employees who have never placed any orders.------------------------

SELECT *
FROM imp.employees e
WHERE NOT EXISTS (
		SELECT 1
		FROM imp.Orders1 o
		WHERE e.employee_id = o.customer_id
)


------------------------37. Using a CTE, find employees whose salary is greater than the company’s average salary.-----------------------

WITH cte1 AS (
		SELECT   
				AVG(salary) AS avg_sal
		FROM imp.employees		
)

SELECT *
FROM imp.employees e JOIN cte1 c
	ON e.salary > c.avg_sal


------------------ OR -----------------

	WITH cte_avg AS (
    SELECT AVG(salary) AS avg_sal
    FROM imp.employees
)
SELECT *
FROM imp.employees
WHERE salary > (SELECT avg_sal FROM cte_avg);


---------------- 38. Show emp_name and hire_date for employees hired after 2021.---------------------
SELECT 
		emp_name,
		hire_date
From imp.Emp
WHERE hire_date >= '2022-01-01'

----------------- 39. Show emp_name and department_name for all employees, including employees who do not belong to any department.----------------

SELECT 
		first_name,
		department_name
FROM imp.employees e LEFT JOIN  imp.department d
		ON d.department_id = e.department_id

-------------------40. Find department_id and average salary of each department, but show only departments where average salary > 60,000.---------------

SELECT  
		department_id,
		AVG(salary) AS avg_salary
FROM imp.employees
GROUP BY department_id
HAVING AVG(salary)> 60000


--------------------41. Show emp_name, department_id, salary, and the maximum salary of that department for every employee.-------------------------------

SELECT 
		first_name,
		department_id,
		salary,
		MAX(salary) OVER(PARTITION BY department_id ORDER BY salary DESC) AS max_Sal
FROM imp.employees

--------------------42. Find employees who belong to the IT department,---------------------

SELECT *
FROM imp.employees
WHERE department_id IN (
		SELECT department_id
		FROM imp.department
		WHERE department_name = 'IT'
)

------------------- 43. Find employees who have never placed any orders.--------------------

SELECT *
FROM imp.employees e
WHERE NOT EXISTS (
		SELECT 1
		FROM imp.Orders1 o
		WHERE o.customer_id = e.employee_id
)

------------------44. Using a CTE, find employees whose salary is greater than the company’s average salary.----------------

WITH cte AS (
		SELECT AVG(salary) as avg_sal
		FROM imp.Emp
)
SELECT *
FROM  imp.Emp e join cte c
 ON  e.salary > c.avg_sal 

 
 -------------------45. Show emp_name and salary for employees whose salary is greater than 55,000.-------------

 SELECT emp_name, salary
 FROM imp.Emp
 WHERE salary > 55000

 ------------------46. Show emp_name and department_name for all employees, including employees who do not belong to any department.-------------

 SELECT first_name, department_name
 FROM imp.employees e 
 LEFT JOIN imp.department d
	ON e.department_id = d.department_id

-----------------47. Find department_id and total salary for each department, but show only departments where total salary is greater than 150,000.---------------------
SELECT department_id, 
		SUM(salary) AS total_salary
FROM imp.employees
GROUP BY department_id
HAVING sum(salary) > 15000


-------------------48. Show emp_name, department_id, salary, and the average salary of their department for every employee.---------------------

SELECT first_name AS emp_name,
		department_id,
		salary,
		AVG(salary) OVER (PARTITION BY department_id) AS avg_sal
FROM imp.employees


------------------49. Find employees who belong to the HR department,------------

SELECT *
FROM imp.employees e
WHERE department_id IN(
		SELECT department_id
		FROM imp.department d
		WHERE d.department_name  = 'HR'
)

----------------- 50. Find employees who have never placed any orders.-------------------------------

SELECT *
FROM imp.employees e
WHERE NOT EXISTS(
		SELECT 1
		FROM imp.Orders1 o
		WHERE  e.employee_id = o.customer_id
) 


-----------------51. Using a CTE, find employees whose salary is greater than company average salary.--------------------

WITH cte AS (
		SELECT AVG(salary) AS avgsal
		FROM imp.employees

)
SELECT *
FROM imp.employees e join cte c
	ON e.salary > c.avgsal


-------------------- 52. Write a SQL query to fetch employees whose salary is greater than 50000.-------------------------------------------------------

SELECT * FROM imp.employees
WHERE salary > 50000


---------------------53. find the average salary of each department.------------------------

SELECT  department_id,avg(salary) AS avg_Salary 
FROM imp.employees
GROUP BY department_id

--------------------54. Find the total order amount handled by each employee (show employee name also).----------------------


SELECT SUM(o.amount) AS total_amount, e.emp_name
FROM imp.Emp  e JOIN imp.Orders1 o
		ON e.emp_id = o.emp_id
GROUP BY e.emp_name

--------------------55.  Renamed column name. ------------------------

SELECT * FROM imp.Orders1;

EXEC sp_rename 'imp.Orders1.customer_id', 'emp_id', 'COLUMN'

--------------------56. highest salary employee from each department. ----------

SELECT emp_name,  department, salary
FROM (  
		 SELECT emp_name,department,salary,

		ROW_NUMBER() OVER(PARTITION BY department ORDER BY  salary DESC ) As Highest_salary
		FROM imp.Emp
) t
WHERE Highest_salary  =1



--------------------57.Top 2 highest salaries from employee table. ---------------
SELECT emp_name,salary
FROM
(
	SELECT  emp_name, salary, 
	DENsE_RANK() OVER(ORDER BY salary DESC) AS Top_2_salary
	FROM imp.Emp
) t
WHERE Top_2_salary <=2 

----------------------58. Find employees who earn more than average salary. -------------


WITH cte1 AS (
				SELECT  Avg(salary) AS avg_sal
				FROM imp.Emp
) 
SELECT e.emp_name, e.salary, c.avg_sal
FROM  imp.Emp e join cte1 c
 ON e.salary > c.avg_sal

 -----------------------59. Find employees who earn more than average salary using subquery. ---------------------------

 SELECT emp_name, salary
 FROM imp.Emp
 WHERE salary > (
	SELECT AVG(salary) AS AVG_salary
	FROM imp.Emp
 )

 --------------------------- 60. Find employees who have at least one order. -----------------------------------------------------------------------

 SELECT  emp_name
 FROM imp.Emp e
 WHERE EXISTS (
			select emp_id 
			from imp.Orders1 o
			where e.emp_id = o.emp_id
 )

 --------------------------- 61. Find employees who have NOT placed any orders. -----------------------

 SELECT emp_name
 FROM imp.Emp e
 WHERE EXISTS (
		SELECT  emp_id 
		FROM imp.Orders1 o
		WHERE e.emp_id = o.emp_id
 )

 ----------------------------62. Find duplicate records based on emp_name and salary. ----------------------------------

 SELECT e1.emp_name, e1.salary
 FROM imp.Emp e1 join imp.Emp e2
	ON e1.emp_id = e2.emp_id