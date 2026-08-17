

CREATE TABLE imp.Emp(
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO imp.Emp VALUES
(1, 'Amit', 'IT', 60000),
(2, 'Neha', 'HR', 45000),
(3, 'Rohit', 'IT', 80000),
(4, 'Pooja', 'Finance', 70000),
(5, 'Anil', 'HR', 50000);


INSERT INTO imp.Emp (emp_id, emp_name, department, salary)
VALUES
(1, 'Amit', 'Sales', 60000),
(2, 'Neha', 'HR', 55000),
(3, 'Ravi', 'Admin', 70000),
(4, 'Pooja', 'Finance', 65000),
(5, 'Suresh', 'Sales', 50000);



---------------------Table : Orders-------------------------------------

CREATE TABLE imp.Orders1 (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO imp.Orders1 VALUES
(101, 1, '2024-01-10', 20000),
(102, 1, '2024-02-15', 35000),
(103, 2, '2024-01-20', 15000),
(104, 3, '2024-03-10', 40000),
(105, 3, '2024-03-25', 20000);


-----------------------------Table 3 : Sales-------------------------------------
CREATE TABLE imp.Sales (
    sale_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    price INT
);

INSERT INTO imp.Sales VALUES
(1, 101, '2024-01-05', 10, 500),
(2, 102, '2024-01-10', 5, 2000),
(3, 101, '2024-02-12', 8, 500),
(4, 103, '2024-02-20', 3, 7000),
(5, 102, '2024-03-15', 6, 2000);

----------------------------------Table 4 : Employee_Salary-------------------------------------
CREATE TABLE imp.Employee_Salary (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO imp.Employee_Salary VALUES
(1, 'Amit', 'IT', 70000),
(2, 'Neha', 'IT', 90000),
(3, 'Rohit', 'HR', 60000),
(4, 'Pooja', 'HR', 75000),
(5, 'Anil', 'Finance', 80000);


-----------------------------------Tables : Employees_Hierarchy----------------------------

CREATE TABLE imp.Employees_Hierarchy1 (
    emp_id INT,
    job_name VARCHAR(50),
    manager_id INT
);

INSERT INTO imp.Employees_Hierarchy1 VALUES
(1, 'CEO', NULL),
(2, 'Manager', 1),
(3, 'Team Lead', 2),
(4, 'Developer', 3),
(5, 'Intern', 4);





-------------------------------1. Using a CTE, find all employees whose salary is greater than the average salary of the company.--------------------


WITH cte1 AS (
				SELECT AVG(salary) AS avg FROM imp.Emp
)
SELECT *
FROM imp.Emp e join cte1 c
ON  salary > avg;

-----2. Using a CTE, calculate the total order amount for each customer, and then return only those customers whose total amount is greater than 50,000.--

WITH cte2 AS (
		SELECT SUM(amount) AS order_amount  FROM imp.Orders1
		GROUP BY customer_id
)

SELECT *
FROM cte2
WHERE order_amount > 50000

--------------------------------3. Using a CTE and ROW_NUMBER(), find the highest-paid employee in each department.---------------------------------------

WITH cte3 AS (
		SELECT first_name, last_name, d.department_name,  row_number() OVER(PARTITION BY department_name ORDER BY salary DESC) AS Highest_Paid_emp
		FROM imp.employees e JOIN imp.department d
			ON e.department_id = d.department_id

)

SELECT * 
FROM  cte3 
WHERE Highest_Paid_emp <= 1

---------------------------------  4 . First CTE ? calculate total revenue per product (quantity * price) . ----------------------
---------------------------------  4.2 . Second CTE ? calculate the average revenue across all products . ------------------------
---------------------------------  4 .3. Final output ? return products whose revenue is above average. --------------------------

WITH Product_Revenue AS (
		SELECT   product_id ,SUM(quantity * price) AS total_revenue
		FROM imp.Sales
		GROUP BY product_id

),


Average_Revenue AS (
    SELECT
        AVG(total_revenue) AS avg_revenue
    FROM Product_Revenue
)


SELECT
   
    pr.total_revenue,
	pr.product_id 
FROM Product_Revenue pr
JOIN Average_Revenue ar
    ON pr.total_revenue > ar.avg_revenue;

------------------------------- 1. 1.	Using a CTE, find all employees whose salary is greater than the average salary.------------------

WITH empsal AS (

	SELECT AVG(salary) AS avg_salary
	FROM imp.Emp
)
SELECT *
FROM imp.Emp e JOIN empsal e1
ON e.salary > e1.avg_salary


------------------------------3.	Using a CTE, find departments that have more than 3 employees..------------------------------------------

WITH dep_cte AS(
	SELECT  department,COUNT(emp_id) AS depc
	FROM imp.Emp
	GROUP BY department
	
)

SELECT * FROM dep_cte
WHERE depc >=2


--------------------------- 4.	Using a CTE, display employees whose salary is below the company average.----------------------------------


WITH empsal AS (

	SELECT AVG(salary) AS avg_salary
	FROM imp.Emp
)
SELECT *
FROM imp.Emp e JOIN empsal e1
ON e.salary < e1.avg_salary

----------------------------5.	Using a CTE, calculate the total salary paid per department.---------------------
WITH CTE_paid AS (
		SELECT department, SUM(salary) AS paid_sal
		FROM imp.Emp
		GROUP BY department
)
SELECT *
FROM CTE_paid cp

---------------------------6. Find departments where average salary > 55,000 . -----------------------------------------------------------------

WITH cte_avg AS (
		
		SELECT AVG(salary) AS Avg_sal, department
		FROM imp.Emp
		GROUP BY department
)
SELECT *
FROM cte_avg
WHERE  Avg_sal > 55000

-------------------------- 7 . Find departments where total salary is more than 1,20,000. ----------------------

WITH total_sal AS (
		SELECT SUM(salary) AS total_salary, department
		FROM imp.Emp
		GROUP BY department
)
SELECT * 
FROM total_sal
WHERE total_salary > 120000

--------------------------- 8 . Find departments having more than 2 employees. ------------------------
WITH cte_emp2 AS(
		SELECT  COUNT(emp_name) AS emp_count, department
		FROM imp.Emp
		GROUP BY department		
)

SELECT *
FROM cte_emp2
WHERE  emp_count > =2

-------------------------- 9 . Find department where average salary is less than 40,000. ----------------------


WITH avg_sal2 AS (
		SELECT AVG(salary) AS Average_Salary, department
		FROM imp.Employee_Salary
		GROUP BY department		
)
SELECT *
FROM avg_sal2
WHERE Average_Salary  > 40000

---------------------------10. Find job where average salary is more than 40,000. --------------------------

WITH avgsal3 AS (
		SELECT AVG(e.salary) AS Avg_sal, h.job_name
		FROM imp.Emp e JOIN imp.Employees_Hierarchy1 h
			ON e.emp_id = h.emp_id
		GROUP BY h.job_name
)
SELECT *
FROM avgsal3
WHERE Avg_sal > 40000

--------------------------11. Find the highest paid employee in each department. ----------------

WITH highest_paid_emp AS (
		SELECT  
				emp_name,
				department,
				salary,
				ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS highest
				FROM imp.Emp
)
SELECT * 
FROM highest_paid_emp
WHERE highest <= 1


-------------------------12. Find the lowest paid employee in each department.---------------

WITH lowest_paid_emp AS (
			SELECT 
					emp_name,
					department,
					salary,
					ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS lowest_paid_Employee
					FROM imp.Emp					
)
SELECT *
FROM lowest_paid_emp
WHERE lowest_paid_Employee <=1

-------------------------- 13. Find the top 2 highest paid employees in each department.-------------------
WITH top_2 AS (
		SELECT	
				emp_name,
				department,
				salary,
				RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid
				FROM imp.Emp
)
SELECT *
FROM top_2 
WHERE highest_paid < =2

---------------------------14. Find the second highest salary in each department.-------------

WITH cte_sec AS (
		SELECT 
			department,
			salary,
			DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS second_highest_salary
			FROM imp.Emp
)
SELECT *
FROM cte_sec
WHERE second_highest_salary = 2

----------------------------- 15. Find the best‑selling product in each category.-----------------

WITH cte_p AS (
		SELECT TOP 1 product_id,
			SUM(quantity) total_qnt
		FROM imp.SalesS
		GROUP BY product_id
		ORDER BY total_qnt DESC
)

SELECT * 
FROM cte_p 


-----------------------------16. Find employees whose salary is greater than the average salary.---------------------------------

WITH cte_sal AS (
			SELECT AVG(salary) AS avg_salary
			FROM imp.employees
)
select *
FROM imp.employees
WHERE salary > (SELECT avg_salary FROM cte_sal)

----------------------------17. Find employees whose salary is less than the average salary.-----

WITH cte_sal1 AS(
		SELECT AVG(salary) AS avg_sal
		FROM imp.employees
)
SELECT *
FROM imp.employees
WHERE salary  < (SELECT avg_sal FROM cte_sal1)

---------------------------18. Find employees who earn more than the maximum salary in HR department.--------------

WITH cte2 AS (
		SELECT MAX(salary) AS max_sal
		FROM imp.Emp
		WHERE department = 'HR'
)
SELECT *
FROM imp.Emp 
WHERE salary > (SELECT max_sal FROM cte2)

--------------------------19. Find products whose price is higher than average product price.------------------

WITH  cte3 AS (
		SELECT AVG(price) AS avg_product_price
		from imp.Sales
)
SELECT *
FROM imp.Sales
WHERE price > (SELECT avg_product_price FROM cte3)

--------------------------20. Find orders whose order amount is greater than total average order amount.------------------

WITH cte4 AS (
		SELECT avg(amount) AS total_avg_amount 
		FROM imp.Orders1
)
SELECT *
FROM imp.Orders1
WHERE amount > (SELECT SUM(total_avg_amount ) AS tol FROM cte4)



--------------------- 21. Calculate running total of salary ordered by employee joining date.--------------------------------

WITH running_salary AS (
    SELECT
        first_name,
        hire_date,
        salary,
        SUM(salary) OVER (
            ORDER BY hire_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_total_salary
    FROM imp.employees
)
SELECT *
FROM running_salary;



---------------------22. Calculate running total of sales amount by order date.-----------------------------------

WITH running_total_sales AS (

		SELECT  sale_id, SUM(price) OVER (ORDER BY sale_date   
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    
) AS total_sales_r
		FROM imp.Sales

)
SELECT * FROM running_total_sales


------------------- 23. Calculate department‑wise running total of salary, ordered by salary. ----------------------------

SELECT 


------------------24. Find monthly cumulative revenue ordered by month.------------------------------------

WITH cte AS (
    SELECT
        DATEFROMPARTS(YEAR(sale_date), MONTH(sale_date), 1) AS month,
        SUM(price) AS monthly_revenue
    FROM imp.Sales
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
)
SELECT
    month,
    SUM(monthly_revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM cte
ORDER BY month;












---------------------------25. Calculate cumulative count of employees based on joining date. -------------------

WITH cte_cumcal AS (
		
		SELECT   employee_id,first_name, last_name, hire_date ,COUNT(*) OVER ( ORDER BY hire_date  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS cumulative_Count
		FROM imp.employees
)

SELECT *
FROM cte_cumcal
