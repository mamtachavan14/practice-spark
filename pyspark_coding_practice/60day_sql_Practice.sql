
CREATE TABLE imp.Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);



INSERT INTO imp.Employees (emp_id, emp_name, salary, department) VALUES
(1, 'Amit', 50000, 'HR'),
(2, 'Neha', 70000, 'IT'),
(3, 'Ravi', 60000, 'IT'),
(4, 'Sneha', 40000, 'HR'),
(5, 'Karan', 70000, 'IT'),
(6, 'Pooja', 30000, 'Finance'),
(7, 'Rahul', 30000, 'Finance'),
(8, 'Neha', 70000, 'IT');

insert into imp.Employees(emp_id,emp_name,salary,email,dept_id,hire_date)
VALUES(8,'Rahul Roy',92000,'rahul@gmail.com',4,'2025-09-01')


-----------------------------------------
ALTER TABLE imp.Employees
ADD email VARCHAR(100);



SELECT * FROM imp.Employees

----------------------------------------

UPDATE imp.Employees
SET email = CASE emp_id
    WHEN 1 THEN 'amit@gmail.com'
    WHEN 2 THEN 'neha1@gmail.com'
    WHEN 3 THEN 'ravi@gmail.com'
    WHEN 4 THEN 'sneha@gmail.com'
    WHEN 5 THEN 'karan@gmail.com'
    WHEN 6 THEN 'pooja@gmail.com'
    WHEN 7 THEN 'rahul@gmail.com'
    WHEN 8 THEN 'neha2@gmail.com'
END;
---------------------------------------------------

ALTER TABLE imp.Employees
ADD dept_id INT
----------------------------------------------

UPDATE imp.Employees
SET dept_id = CASE emp_id
    WHEN 1 THEN 1  -- Amit (HR)
    WHEN 2 THEN 2  -- Neha (IT)
    WHEN 3 THEN 2  -- Ravi (IT)
    WHEN 4 THEN 1  -- Sneha (HR)
    WHEN 5 THEN 2  -- Karan (IT)
    WHEN 6 THEN 3  -- Pooja (Finance)
    WHEN 7 THEN 3  -- Rahul (Finance)
    WHEN 8 THEN 2  -- Neha (IT)
END;

--------- hire date add in emp table.
ALTER TABLE imp.Employees
ADD hire_date DATE

UPDATE imp.Employees
SET hire_date = CASE emp_id
    WHEN 1 THEN '2023-01-15'
    WHEN 2 THEN '2022-06-10'
    WHEN 3 THEN '2023-03-20'
    WHEN 4 THEN '2024-01-05'
    WHEN 5 THEN '2022-11-12'
    WHEN 6 THEN '2024-02-18'
    WHEN 7 THEN '2024-03-25'
    WHEN 8 THEN '2023-08-01'
END;
--------------------------------------------


CREATE TABLE imp.Departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50)
);


INSERT INTO imp.Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing')


select * FROM imp.Departments






------------------------------------------------------------------------------------------------

CREATE TABLE imp.Orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    amount INT,
    order_date DATE
);


INSERT INTO imp.Orders VALUES
(101, 1, 1000, '2024-01-10'),
(102, 2, 2000, '2024-01-11'),
(103, 2, 1500, '2024-01-12'),
(104, 3, 1200, '2024-01-13'),
(105, 5, 2500, '2024-01-14'),
(106, 5, 1000, '2024-01-15'),
(107, 2, 500,  '2024-01-16');


--------------------------------------



CREATE TABLE imp.Logs (
    id INT,
    num INT
);

INSERT INTO imp.Logs VALUES
(1, 10),
(2, 10),
(3, 10),
(4, 20),
(5, 30),
(6, 30),
(7, 30),
(8, 40),
(9, 10),
(10, 10),
(11, 10);

---------------------------------

SELECT * FROM imp.Employees;
SELECT * FROM imp.Orders;
SELECT * FROM imp.Logs;

-------------------------------------------------------------------------------------------------

CREATE TABLE imp.Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO imp.Customers VALUES
(1, 'Anil', 'Mumbai', '2024-01-01'),
(2, 'Priya', 'Pune', '2024-01-05'),
(3, 'Rahul', 'Nashik', '2024-01-10'),
(4, 'Sneha', 'Mumbai', '2024-01-15'),
(5, 'Karan', 'Pune', '2024-01-20'),
(6, 'Pooja', 'Nagpur', '2024-01-25');


CREATE TABLE imp.Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO imp.Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Chair', 'Furniture', 5000),
(104, 'Table', 'Furniture', 8000),
(105, 'Headphones', 'Electronics', 2000);




CREATE TABLE imp.Customer_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);


INSERT INTO imp.Customer_Orders VALUES
(1001, 1, '2024-02-01', 50000),
(1002, 2, '2024-02-02', 30000),
(1003, 1, '2024-02-03', 2000),
(1004, 3, '2024-02-04', 8000),
(1005, 4, '2024-02-05', 5000),
(1006, 1, '2024-02-06', 30000),
(1007, 5, '2024-02-07', 50000);

ALTER TABLE imp.Customer_Orders
ADD delivery_date DATE;

UPDATE imp.Customer_Orders
SET product_id = 1,
    delivery_date = '2026-02-05'
WHERE order_id = 1001;

UPDATE imp.Customer_Orders
SET product_id = 2,
    delivery_date = '2026-02-06'
WHERE order_id = 1002;

UPDATE imp.Customer_Orders
SET product_id = 3,
    delivery_date = '2026-02-07'
WHERE order_id = 1003;

UPDATE imp.Customer_Orders
SET product_id = 4,
    delivery_date = '2026-02-08'
WHERE order_id = 1004;

UPDATE imp.Customer_Orders
SET product_id = 5,
    delivery_date = '2026-02-09'
WHERE order_id = 1005;
-------------------------------------


CREATE TABLE imp.Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO imp.Order_Details VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1003, 105, 1),
(4, 1004, 104, 1),
(5, 1005, 103, 1),
(6, 1006, 102, 1),
(7, 1007, 101, 1);
---------------------------------------------------

CREATE TABLE imp.Sale (
    Sale_ID INT PRIMARY KEY,
    Product_ID INT,
    Sale_Date DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO imp.Sale (Sale_ID, Product_ID, Sale_Date, Amount)
VALUES
(1, 101, '2026-01-10', 1500.00),
(2, 102, '2026-01-11', 2200.50),
(3, 103, '2026-01-12', 875.25);

SELECT * FROM imp.Sale
-------------------------------------------------------------------------------------------------


CREATE TABLE imp.Products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

INSERT INTO imp.Products1 (product_id, product_name)
VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Headphones'),
(4, 'Keyboard'),
(5, 'Mouse');

SELECT * FROM imp.Products1

ALTER TABLE imp.Customer_Orders
ADD product_id INT;

					----------  Interview Questions.   ----------------



----------------------------1.  Scenario: You have duplicate employees in table.----------------------------------------------------------
--------------------------- Task:Find employees having same name and salary more than once . ----------------------------------------------

SELECT  emp_name, salary , COUNT(*) AS duplicates
FROM imp. Employees
GROUP BY Emp_name, salary
HAVING COUNT(*)> 1


------------------------------ Show duplicate rows, not just count ---------------------

SELECT emp_name, salary
FROM (
    SELECT emp_name, salary,
           ROW_NUMBER() OVER(PARTITION BY emp_name, salary ORDER BY emp_id) AS rn
    FROM imp.Employees
) t
WHERE rn > 1;


---------------------------- 2. Scenario:Company wants to know second highest paid employee(s)------------
---------------------------  Task: Return employee name and salary . --------------------------------------

------------------------ Type 1 : Using sub Query. -----------------------------

SELECT emp_name, salary 
FROM imp.Employees
WHERE salary = (
		SELECT MAX(salary)
		FROM imp.Employees
		WHERE salary < (
				SELECT MAX(salary)
				FROM imp.Employees
		)
)


------------------- Type 2 : Using Windows Function dense rank.--------------

SELECT emp_name, salary
FROM (
		SELECT emp_name, salary,
		DENSE_RANK() OVER( ORDER BY salary DESC) AS second_highest_paid_emp
		FROM imp.Employees
) t
WHERE second_highest_paid_emp =2

------------------------- 3. Scenario: System logs store repeated values . --------------------------------
------------------------  Task: Find numbers that appear at least 3 times consecutively. -------------------

SELECT  DISTINCT num
FROM (
		SELECT num,
			Lag(num) OVER( ORDER BY id) AS prev_num,
			LEAD(num) OVER( ORDER BY id) AS next_num
		FROM imp.Logs
) t
WHERE  num = prev_num AND  num = next_num

------------------------- 4 .  Find employees whose total order amount is greater than 3000 . --------------------

SELECT e.emp_name, SUM(o.amount) AS total_ordr_amount
FROM imp.Employees e JOIN imp.Orders o
	ON e.emp_id = o.emp_id
GROUP BY e.emp_name
HAVING SUM(o.amount) >= 3000

------------------------ 5. Find employees whose salary is greater than the average salary of their department . --------------------

SELECT emp_name, department, salary
FROM imp.Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM imp.Employees
    WHERE department = e.department
);

WITH cte1 AS (
    SELECT department, AVG(salary) AS avg_sal
    FROM imp.Employees
    GROUP BY department
) 
SELECT e.emp_name, e.department, e.salary, c1.avg_sal
FROM imp.Employees e 
JOIN cte1 c1
    ON e.department = c1.department
WHERE e.salary > c1.avg_sal;


----------------------------------- 6. Find top 3 highest salaries from Employees table (include duplicates) . ----------------------

SELECT emp_name, salary
FROM(
	SELECT emp_name, salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) as Highest_sal
	FROM imp.Employees
) t
WHERE Highest_sal <= 3



----------------------------------- 7. Find employees who have no orders . ---------------------------

SELECT e. emp_id,e.emp_name
FROM imp.Employees e
WHERE 
NOT EXISTS (
	SELECT 1
	FROM imp.Orders o
	WHERE e.emp_id = o.emp_id

)

---------------------------------- 8. Count orders per employee (include zero orders) . -------------------------------
SELECT  e.emp_name , 
		COUNT(o.order_id)AS Count_orders
FROM imp.Employees e
LEFT JOIN imp.Orders o
	ON e.emp_id = o.Emp_id
GROUP BY e.emp_name

---------------------------------- 9. Highest salary per department . ------------------------------------------------

SELECT emp_name, salary, department
FROM  (
		SELECT  
		emp_name, 
		salary , 
		department, 
		ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS highest_salary
		FROM imp.Employees
		
) t

WHERE highest_salary =1
ORDER BY salary DESC

----------------------------------- 10 . Delete duplicate record . -------------------------------------

DELETE  FROM imp.Employees
WHERE emp_id NOT IN(
		SELECT MIN(emp_id)
		FROM imp.Employees
		GROUP BY emp_name, salary
)
		
SELECT * FROM imp.Employees
---------------------------------------  Type 2 : using cte n window fub=nction row_number .-----------------------
WITH cte AS (
		
		SELECT emp_id ,
				ROW_NUMBER()  OVER( PARTITION BY emp_name, salary ORDER BY emp_id)AS rn
				FROM imp.Employees
)
DELETE FROM cte
WHERE rn > 1


--------------------------------------- 11. Find 3rd highest salary from Employees table . -----------------------------------

SELECT  emp_name , salary
FROM (
	SELECT 
			emp_name, salary,
			DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
			FROM imp.Employees
)t
WHERE rn =1

SELECT emp_name,salary FROM imp.Employees

---------------------------------------- 12. Find employees who placed more orders than average number of orders per employee . --------------------

SELECT emp_id, COUNT(*) AS total_orders
FROM imp.Orders
GROUP BY emp_id
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM imp.Orders
        GROUP BY emp_id
    ) t
);


----------------------------------------- 13. Find which department has maximum total salary . ---------------------------

WITH cte1 AS (
		SELECT department, SUM(salary) AS total_salary
		FROM imp.Employees
		GROUP BY department
)
SELECT * 
FROM cte1
WHERE total_salary = (
			SELECT MAX(total_salary) FROM cte1
)

SELECT * FROM imp.Employees

------------------------------------------ 14. In Orders table, find employees who placed orders on consecutive days . -----------------------

SELECT DISTINCT emp_id
FROM (
		SELECT
				emp_id,
				order_date,
				LAG(order_date) OVER(PARTITION BY emp_id oRDER BY order_date) AS prev_date
				FROM imp.Orders
)t
WHERE DATEDIFF(day, prev_date, order_date) = 1;


----------------------------------------- 15. Show running total of amount for each employee ordered by date . ------------------------------

SELECT emp_id,
       order_date,
       amount,
       SUM(amount) OVER(
           PARTITION BY emp_id
           ORDER BY order_date
       ) AS running_total
FROM imp.Orders;


-------------------------------------------- 16 . Find employees whose salary is greater than the average salary of the company.--------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary > (
	SELECT avg("salary") as avg_sal
	FROM imp.Employees
)



-----------------------------------------------17. Find departments having more than 2 employees.------------------------------------

SELECT department,COUNT(*) AS emp_count
FROM imp.Employees
GROUP BY department
HAVING COUNT(*) >= 2

SELECT * FROM imp.Employees


----------------------------------------------- 18. Find employees who earn the highest salary in their department. ---------------------------

SELECT emp_name , salary, department
FROM imp.Employees
WHERE salary = (
		SELECT MAX(salary) 
		FROM imp.Employees
)

------------------------------------------------ 19. Find the second highest salary from Employees table. -----------------------------------------------

SELECT emp_name, salary
FROM (
		SELECT emp_name, salary,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS rn
		FROM imp.Employees
)t
WHERE rn = 2

SELECT * FROM imp.Employees

----------------------------------------- 20. Find customers who placed more orders than the average number of orders placed by all customers.------------------------------

WITH order_count AS (
    SELECT emp_id, COUNT(*) AS total_orders
    FROM imp.Orders
    GROUP BY emp_id
)

SELECT *
FROM order_count
WHERE total_orders > (
    SELECT AVG(total_orders)
    FROM order_count
);


----------------------------------------- 21. Find employees whose salary is less than the company average salary.. ------------------------------------------------------------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary < (
		SELECT AVG(salary)
		FROM imp.Employees
)

----------------------------------------- 22. Find total salary of each department. ---------------

SELECT  department, SUM(salary) As total_salary
FROM imp.Employees
GROUP BY department


------------------------------------------ 23. Find employees who have the same salary as another employee. ------------------------------------------------------

SELECT emp_name , salary
FROM imp.Employees
WHERE salary IN (
		SELECT salary 
		FROM imp.Employees
		GROUP BY salary
		HAVING COUNT(*) > 1
)



------------------------------------------ 24. Find third highest salary using DENSE_RANK() . --------------------------------------

WITH cte AS (
		SELECT emp_name, salary,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS thr_sal
FROM imp.Employees
)
SELECT *
FROM cte
WHERE thr_sal = 3

------------------------------------------ 25. Find customers who placed orders on consecutive days. --------------------------------------------

SELECT DISTINCT emp_id
FROM(
		SELECT
		emp_id,order_date,
		lAG(order_date) OVER(PARTITION BY emp_id ORDER BY order_date) AS prev_date
		FROM imp.Orders
)t
WHERE DATEDIFF(day, prev_date,order_date) =1 


--------------------------------------------- 26.  write query to find heighest salary of an employees .--------------------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary = (
		SELECT MAX(salary)
		FROM imp.Employees
		)


--------------------------------------------- 27.  write query to find seccond heighest salary of an employees .--------------------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary = (
		SELECT MAX(salary)
		FROM imp.Employees
		WHERE salary <(
			SELECT MAX(salary) FROM imp.Employees
		)
)


--------------------------------------------- 28.  write query to find 3rd or nt heighest salary of an employees .--------------------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary = (
		SELECT MAX(salary)
		FROM imp.Employees
		WHERE salary <(
			SELECT MAX(salary)
			FROM imp.Employees
			WHERE salary <(
				SELECT MAX(salary)
				FROM imp.Employees
			)
		)
)

---------------------------------------------- 29. write a query to find employees whose salary is greatter than the average salary . -----------------------------------------

SELECT emp_name,salary
FROM imp.Employees
WHERE salary > (
	SELECT avg(salary) 
	FROM imp.Employees
)

SELECT avg(salary) as avg_salary FROM imp.Employees

--------------------------------------------- 30. Write a query to find the highest paid employee in each department. ----------------------

WITH cte AS (
		SELECT
				emp_name,salary, department,
				DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS mx
				FROM imp.Employees
				
)
SELECT * fROM cte
WHERE mx = 1

------------------------------------- 31. Write query to  find top 3 salaries in each department. ------------------

WITH cte AS (
			SELECT	emp_name, salary, department,
					DENSE_RANK() OVER(PARTITION BY department ORDER BY salary desc)AS top_sal
			FROM imp.Employees
)
SELECT * 
FROM cte
WHERE top_sal <= 3


-------------------------------------- 32. Write a query to find duplicate record in a table . -------------------------------------------

SELECT emp_name, salary, COUNT(*) AS cnt
FROM imp.Employees
GROUP BY emp_name, salary
HAVING COUNT(*) > 1;


-------------------------------------- 33. Write a query to delete a duplicate record from table. --------------------------------------

DELETE FROM imp.Employees
WHERE emp_id NOT IN (
		SELECT MIN(emp_id)
		FROM imp.Employees
		GROUP BY emp_name, salary
)



--------------------------------------- 34. Write a query to display employee name along with theire department name--------------------------------------

SELECT emp_name, department
FROM imp.Employees

----------------------------------------35. Write a query to find employees who are not assingn to any department. ---------------------------

SELECT emp_name, department
FROM imp.Employees
WHERE department IS  NULL


---------------------------------------- 36. Write a query to display department  that do not have any employee .------------------------------

SELECT d.department
FROM imp.Departments d
LEFT JOIN imp.Employees e
    ON d.department = e.department
WHERE e.emp_id IS NULL;


----------------------------------------- 37. Find employees whose salary is greater than the company average salary. ---------------------------------------

SELECT emp_name, salary
FROM  imp.Employees
WHERE salary > (
		SELECT AVG(salary)
		FROM imp.Employees

) 


----------------------------------------- 38. Find the number of employees in each department. -----------

SELECT emp_name, department, COUNT(*) AS no_of_emp
FROM imp.Employees
GROUP BY emp_name, department

------------------------------------------ 39. Display departments that do not have any employees. ------------------------------------------------

SELECT e.emp_name, d.department
FROM imp.Employees e
LEFT JOIN imp.Departments d
	ON e.department = d.department
WHERE emp_name IS NULL


----------------------------------------- 40. Find the 2nd highest salary using DENSE_RANK(). ---------------

SELECT emp_name,
		salary
FROM(
	SELECT 
		emp_name,
		salary ,
		DENSE_RANK() OVER(ORDER BY salary  DESC) AS rn
	FROM imp.Employees
)t
WHERE rn = 2

----------------------------------------- 41. Find customers who placed more orders than the average number of orders. -------------------------

SELECT  emp_id, order_id
FROM imp.Orders
WHERE order_id > (
		SELECT  AVG(order_id)
		FROM imp.Orders
)

------------------------------------------42. delete a employees whwere emp_name = 'Neha only emp_name. -----------------------------


DELETE FROM imp.Employees
WHERE emp_name = 'Neha';

----------------------------------------- 43. Find employees whose salary is equal to the minimum salary in the company.-----------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary = (
		SELECT min(salary)
		FROM imp.Employees
)

--------------------------------------- 44. Find departments whose average salary is greater than 50,000. -----------------

WITH cte AS(
		SELECT 
			
			department,
			AVG(salary)as avgsal
		FROM imp.Employees
		GROUP BY department

) 
SELECT *
FROM cte
WHERE avgsal> 50000


------------------------------------- 45. Find employees who earn the same salary as at least one other employee. ---------------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary IN (
    SELECT salary
    FROM imp.Employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);



------------------------------------ 46. Find the 3rd highest salary using DENSE_RANK(). ------------------------------------

SELECT emp_name, salary
FROM(
		SELECT emp_name, salary,
		DENSE_RANK() OVER(ORDER BY salary DESC)AS rank
		FROM imp.Employees
)t
WHERE rank = 3




---------------------- 47. Find employees whose total order amount is greater than the average total order amount of all employees.-------------


WITH order_total AS (
    SELECT emp_id,
           SUM(amount) AS total_amount
    FROM imp.Orders
    GROUP BY emp_id
)
SELECT emp_id, total_amount
FROM order_total
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM order_total
);


---------------------------------------------  48. Find second highest salary.----------------------------------------------

SELECT emp_name, salary
FROM imp.Employees 
WHERE salary = (
SELECT MAX(salary) AS salary
FROM imp.Employees
WHERE salary < (
		SELECT  MAX(salary)
		FROM imp.Employees)
	
)


SELECT emp_name, salary
FROM (
    SELECT emp_name,
           salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM imp.Employees
) t
WHERE rnk = 2;

-------------------------------------------- 49. Display each department and the number of empoyees in it.  ----------------------

SELECT emp_name, department, COUNT(*) AS emp_count
FROM imp.Employees
GROUP BY emp_name,department

---------------------------------------------- 50. Find duplicates email ids. ------------------------------------


SELECT email,
       COUNT(*) AS duplicate_count
FROM imp.Employees
GROUP BY email
HAVING COUNT(*) > 1


----------------------------- 51. Display employees name and salary where salary is greater than 60000.-------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary > 60000


----------------------------- 52. Display employee name and department name. -------------------------------------------------

SELECT emp_name, department
FROM imp.Employees e 
INNER JOIN imp.Departments d
	ON e.dept_id = d.dept_id


-----------------------------  53. Find all employees whose salary is greater than 50000.--------------------------

SELECT 
		emp_name,
		salary
FROM imp.Employees
WHERE salary > 50000

SELECT * FROM imp.Employees


------------------------ 54. Displaythe names of the employees hired after 1 january 2022. -----------

SELECT 
		emp_name,
		hire_date
FROM imp.Employees
WHERE hire_date > '2021-01-01'

-------- 55. Find each department average salary. show only department where the average salary is greater than 60000. -------------------

SELECT d.department, AVG(e.salary) AS Average_salary
FROM imp.Employees e JOIN imp.Departments d
	ON e.dept_id = d.dept_id
GROUP BY department
HAVING AVG(e.salary) > 60000
	
SELECT * FROM imp.Departments

---------------------------- 56. Display top 3 highest paid  employees . ----------------------------------------

SELECT emp_name, salary
FROM(
		SELECT
		emp_name,
		salary,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
		FROM imp.Employees
)t
WHERE rnk <=3

------------------------------ 57. Find second highest salary without using limit or top . -----------------------

SELECT MAX(salary) AS second_highest_salary
FROM imp.Employees
WHERE salary <(
		SELECT MAX(salary) 
		FROM imp.Employees
)
--------- 58. Senario : You have table with order_id, cust_id,order_date, amount: WAQ to find the latest order for each customer . -------------------------
 
 SELECT * FROM imp.Customer_Orders

 SELECT		
		order_id,
		customer_id,
		order_date,
		total_amount
FROM (
			SELECT *,
			ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
			FROM imp.Customer_Orders
) t
WHERE rn = 1


------------- 59. write a query to display all employees whose salary is between 40000 and 70000, sorted by salary in desending order. ----------------------------------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary BETWEEN 40000 AND 70000
ORDER BY salary DESC

--------------- 60. Write a query to find the number of employees in each department. ----------------------------

SELECT	COUNT(*) AS No_of_Emp,
		d.department
FROM imp.Employees e 
JOIN imp.Departments d
	ON e.dept_id = d.dept_id
GROUP BY department
		
----------------- 61. WAQ to display emp_name, department.-------------------------------

SELECT e.emp_name, d.department
FROM imp.Employees e
JOIN imp.Departments d
	ON e.dept_id = e.dept_id


------------------- 62. WAQ to assign a rank to employees based on salary in desending order using a window function. -------------------

SELECT 
		emp_name,
		salary,
		RANK() OVER(ORDER BY salary DESC) AS rnk
FROM imp.Employees

-------------------- 63. WAQ to find all duplicate email addresses. ----------------------------

SELECT  COUNT(*) AS duplicates_email
FROM imp.Employees
GROUP BY  email
HAVING COUNT(*) > 1


--64. Senario 2: WAQ to find total purchase amount for each customers, but display only those customer whose total purchase amount is greater than 50000. -------------------------------

SELECT  customer_id, SUM(total_amount) AS total_purchase 
FROM imp.Customer_Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 50000

----- 65. WAQ to display high salary if salary >= 80000, Medium salary if salary between 50000 and 79999, Low  salary if salary < 50000 .----

 SELECT 
		emp_name,
		salary,
		CASE 
			WHEN salary >= 80000 THEN  'High salary' 
			WHEN salary  BETWEEN 50000 AND 79999 THEN 'Medium salary'
			WHEN salary < 50000 THEN 'Low salary'
		END AS salary_category
FROM imp.Employees

-------------- 66. WAQ to display emp_name, length of emp_name, use the appropiate sql string function . ------------------------

SELECT	emp_name,
		len(emp_name) AS length_of_emp_name
FROM imp.Employees
		
------------------- 67. WAQ to display emp_name, manage name  from the same table employees table.------------------------

SELECT 
		e.emp_name AS Employee_Name ,
		m.emp_name AS Manager_Name
FROM imp.Employees e 
LEFT JOIN imp.Employees m
	ON m.managerid = e.emp_id

----------------- 68. Find high paid employee in each department using window function .-------------
SELECT	emp_name, 
		salary,
		dept_id
FROM(
		SELECT
		emp_name, 
		salary,
		dept_id,
		DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS hp
		FROM imp.Employees
) t
WHERE hp =1

------------------ 69.WAQ to find the 3rd highest salary . Try two method using dense_rank and without using window function. -----------------------

SELECT emp_name, salary
FROM (
		SELECT emp_name, salary,
		DENSE_RANK() OVER(ORDER BY salary DESC) AS hp
		FROM imp.Employees
)t
WHERE hp =3
	
----------- Method 2 ---

SELECT MAX(salary) AS max_salary
FROM imp.Employees
WHERE salary < ( 
			SELECT MAX(salary )
			FROM imp.Employees
			WHERE salary < (
							SELECT MAX(salary) 
							FROM imp.Employees
				)
		
)

--------------------------- 70. Senario 3:  WAQ to display the monthly sales  total . ----------

SELECT 
		MONTH(Sale_date) AS Month,
		SUM(amount) AS Total
FROM imp.Sale
GROUP BY MONTH(sale_date)
ORDER BY MONTH(sale_date)

---------------------------- 71. WAQ cte to display all employees whose salary is greater than 50000 . -------------------

with cte AS (
		SELECT emp_name, salary
		FROM imp.Employees
)
SELECT * FROM cte
WHERE salary > 50000



----------------------------- 72. Using cte find a average salary of each department . --------------

with cte1 AS (
		SELECT  dept_id,AVG(salary) avg_sal
		FROM imp.Employees
		GROUP BY dept_id 
)
select * 
From cte1

-------------------------- 73. Using cte display emp whose salary is greater than the average salary of theire department .------

WITH cte AS(
				SELECT  dept_id, AVG(salary) as avg_sal
				FROM imp.Employees
				GROUP BY dept_id
)
SELECT e.* 
FROM imp.Employees e 
JOIN cte c
ON e.dept_id = c.dept_id
WHERE e.salary > c.avg_sal


------------------------------------------------------


--------------------------- 74. Using cte and rownumber display the top 2 highest paid emp in each department .--------

WITH CTE4 AS (
		SELECT emp_name, salary,dept_id,
		ROW_NUMBER()OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_no
		FROM imp.Employees
)
SELECT * 
FROM CTE4
WHERE row_no <=2



--------------- 75. Using cte find customers whose total purchase amount is greater than the average purchase amount off all customer. ----------------

WITH CTE5 AS (
    SELECT customer_id,
           SUM(total_amount) AS total_p_amount
    FROM imp.Customer_Orders
    GROUP BY customer_id
),
CTE AS (
    SELECT AVG(total_p_amount) AS avg_p_amount
    FROM CTE5
)
SELECT c1.*
FROM CTE5 c1
CROSS JOIN CTE c2
WHERE c1.total_p_amount > c2.avg_p_amount;


---------------- 76.  Senario 5 : Using  CTE find the latest order placed by each customer.-------------------------
WITH CTE AS(
		SELECT customer_id, order_date
		ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rno
		FROM imp.Customer_Orders
)
SELECT *
FROM CTE 
WHERE order_date = 1 


-------------------- 78.  Display the current sale amount and the previous sale amount.---------------------------

SELECT  order_id As sale_id,
		total_amount As Current_sale_amount,
		LAG("total_amount") OVER(ORDER BY order_id) AS Previous_Sale_amount
FROM imp.Customer_Orders


--------------------- 79. Display the current sales amount and next sales amount.--------------
SELECT order_id,
		total_amount As current_amount,
		LEAD("total_amount")OVER(ORDER BY order_id) AS Next_Amount
FROM imp.Customer_Orders


--------------------- 80. Display each emp along with the highest salary in theire dept. ---------------

SELECT emp_name,
		dept_id,
		FIRST_VALUE("salary") OVER(PARTITION BY dept_id ORDER BY salary DESC) AS highest_salary
FROM imp.Employees

--------------------- 81. Divide emp into 4 salary quartilis based on salary.---------------------

SELECT	emp_name,
		salary,
		NTILE(4)OVER( ORDER BY salary )AS Salary_Group
FROM imp.Employees

----------------------- 82. Calculate the difference between the current sale and the previous sale amount. ---------------

SELECT		
			order_date As sale_date,
			total_amount AS amount,
			LAG("total_amount")OVER(ORDER BY order_id) AS previous_amount,
			total_amount - LAG("total_amount")OVER(ORDER BY order_id) AS Differenc
FROM imp.Customer_Orders


--- 83. senario 3 : For each customer,compare the current order amount with the previous order amount and display weather the amount increased,decreased, or remained the same.-------------

SELECT
    customer_id, 
	order_id, 
	order_date,
    total_amount AS current_amount,
    LAG(total_amount) OVER ( PARTITION BY customer_id ORDER BY order_date ) AS previous_amount,
    CASE
        WHEN LAG(total_amount) OVER (  PARTITION BY customer_id ORDER BY order_dat) IS NULL
        THEN 'First Order'
        WHEN total_amount >
             LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date)
        THEN 'Increased'
        WHEN total_amount <
             LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date)
        THEN 'Decreased'
        ELSE 'Remained Same'
    END AS order_status
FROM imp.Customer_Orders;


-------------- 84. Display emp_name and  department name . ------------------------------------------

SELECT e.emp_name, d.department
FROM imp.Employees e
INNER JOIN imp.Departments d
	ON e.dept_id = d.dept_id

---------------- 85. Display all employees , including those who are not assigned to any depatment. ---------------

SELECT e.emp_name, d.department
FROM imp.Employees e
LEFT JOIN imp.Departments d
ON e.dept_id = d.dept_id

----------------- 86. Display the employee name and manager name. -----------------------

SELECT e.emp_name, m.emp_name AS manage_anme
FROM imp.Employees e 
LEFT JOIN imp.Employees m
	ON e.ManagerId = m.emp_id

SELECT * FROM imp.Customer_Orders

-------------------- 87. Display all employees and all deoartments , including records that dont have a matching row.------------------------------

SELECT e.emp_name, d.department
FROM imp.Employees e
FULL OUTER JOIN imp.Departments d
ON e.dept_id = d.dept_id

---------------------- 88. Display customer who have never placed an order.-------------------

SELECT c.customer_name, co.order_id
FROM imp.Customers c
LEFT JOIN imp.Customer_Orders co
ON c.customer_id = co.customer_id
	WHERE order_id IS NULL


---------------------- 89. Senario 7 : Display customer_name, product_name, no.of emp.----------------------------------------------------------
SELECT c.customer_name,
       p.product_name,
       COUNT(o.order_id) AS no_of_orders
FROM imp.Customer_Orders o
JOIN imp.Products1 p
    ON o.product_id = p.product_id
JOIN imp.Customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name, p.product_name;

------------------------ 90. Display the order_id,order_date, Year, month, day . ---------------------------------

SELECT order_id, order_date,
		Year(order_date) AS Year_,
		month(order_Date) AS Month_,
		Day(order_date) AS Day
FROM imp.Customer_Orders

-------------------------- 91. Find all orders placed in last 30 days. ------------

SELECT order_id, order_date
FROM imp.Customer_Orders
WHERE order_date >= DATEADD(DAY, -30, GETDATE())

------------------------- 92. Find the number of orders placed each month. -----------------------

SELECT COUNT(order_id) AS Total_Orders, MONTH(order_date) AS Months
FROM imp.Customer_Orders
GROUP BY MONTH(order_date)
ORDER BY Months


------------------------ 93. Find difference in days between two dates: order_date, delivery_date .-----------------

SELECT 
		order_id,
		order_date,
		DATEDIFF(DAY, order_date, delivery_date) AS delivery_date_diff_day

FROM imp.Customer_Orders

----------------------- 94. Find customer who did not place any order in  last  90 days . -----------------

SELECT customer_id
FROM imp.Customer_Orders
GROUP BY customer_id
HAVING MAX(order_date) < DATEADD(DAY, -90, GETDATE());


------------------------- 95. Find the total sales for each month of the current year. ----------------------

SELECT
    MONTH(order_date) AS Month,
    SUM(total_amount) AS Total_Sales
FROM imp.Customer_Orders
WHERE YEAR(order_date) = YEAR(GETDATE())
GROUP BY MONTH(order_date)
ORDER BY Month;

---------------------------- 96. Display the length of each emp.----------------

SELECT len(emp_name) AS emp_lenth, emp_name
FROM imp.Employees

----------------------------- 97. Display the three character of each employees name .-------

SELECT  LEFT(emp_name, 3) AS Emp_3_Character
FROM imp.Employees

------------------------------ 98. Display the last 2 character of each employees . ------------------

SELECT right(emp_name,2) AS emp_2ch
FROM imp.Employees

------------------------------- 99. Convert employees names to uppercase and lower case .--------

SELECT UPPER(emp_name) AS NAME,
		LOWER(emp_name) AS name
FROM imp.Employees


-------------------------------- 100. remove leading and trailing spaces from employees names .----------

SELECT RTRIM(emp_name) AS Name
fROM imp.Employees

----------------------------------101. Replace  Roy with Rathod in the name. --------

SELECT REPLACE(emp_name, 'Roy','Rathod') AS New_Name
fROM imp.Employees


---------------------------------- 103. Find the position of the letter a in eachemployees name .-------------------

SELECT CHARINDEX('a', emp_name) AS pos_of_a
FROM imp.Employees

---------------------------------  104. Display the Full name by combining first_name and last_name . ------

SELECT CONCAT('first_name','last_name') AS Full_Name
FROM imp.Employees


------------------------------------ 105. Extract the domain from an email address . ----------------------

SELECT SUBSTRING(email, CHARINDEX('@',email)+1,lEN(email)) AS domain
FROM imp.Employees


------------------------------------ 106. Display the employees whose name starts with 'A' and ends with 'n' .--------

SELECT emp_name 
FROM imp.Employees
WHERE emp_name LIKE 'A%t'


---------------------------------- 107. Display all employees using CTE. ------------------------

WITH cte AS(
		SELECT *
		FROM imp.Employees
)
SELECT *
FROM cte

----------------------------------- 108. Display employees whose salary is greater than 50000 using CTE.---------

WITH cte2 AS(
		SELECT salary
		FROM imp.Employees
		WHERE salary > 50000
)
SELECT *
FROM cte2


------------------------------------ 109 . Find the average salary of each department using a CTE. -------------------------------------

WITH cte3 AS(
			SELECT dept_id, AVG(salary) AS avg_salary
			FROM imp.Employees
			GROUP BY dept_id,salary
)
SELECT *
FROM cte3

--------------110. Find employees whose salary is greater than the average salary of theire department. ---------------------

WITH cte4 AS (
		
		SELECT AVG(salary) as avg_sal
		FROM imp.Employees

)
SELECT emp_name,salary, avg_sal
FROM imp.Employees e
JOIN cte4 c
ON  e.salary > c.avg_sal

-------------------111. Find the highest paid employees in each department using a cte .----------------------------

WITH cte5 AS (
		SELECT emp_name, dept_id,
		ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY  salary DESC) AS highest_salary
		FROM imp.Employees
)
SELECT *
FROM cte5
WHERE highest_salary =1


------------ 112. Senario Based : Calculate the total sales for each customer. Display only customers whose total sales are greater than 50000. ------------

WITH cte6 AS (
			SELECT  customer_id,SUM(total_amount) AS total_sale
			FROM imp.Customer_Orders
			GROUP BY customer_id
)

SELECT *
FROM cte6
WHERE total_sale > 50000

SELECT * FROM imp.Sale

------------------- 113. create a view to display all employees details . ------------------

create view imp.emp_details AS
select * FROM imp.Employees

select * from imp.emp_details

-------------------- 114. Create a view to display employees with salary ggreater than 50000 .----------------------------
CREATE VIEW imp.highest_salary_v AS
SELECT * FROM imp.Employees
WHERE salary > 50000

SELECT* fROM imp.highest_salary_v

----------------------115. Display data from view .------------------------------

SELECT * FROM imp.emp_details

-----------------------116. Modify an existing view to include only employee id, name, and department.-------------------------------

ALTER  view  imp.emp_details AS
SELECT emp_id,emp_name,dept_id
FROM imp.Employees
SELECT  * FROM imp.emp_details

------------------------- 117. Delete a view .-----------------------------------

DROP VIEW imp.emp_details

---------------------------118. senario: ----------------------------------

create view imp.sales_summary AS
SELECT  c.customer_name, 
		p.product_name,
		SUM(o.total_amount) AS total_sales
FROM imp.Customers c
JOIN imp.Customer_Orders o
	ON c.customer_id = o.customer_id
JOIN imp.Products p
	ON o.product_id = p.product_id
GROUP BY o.total_amount, c.customer_name, p.product_name

SELECT * FROM imp.sales_summary

------------------------------ 119.   Create a scaler function to return the square of a number . -----------------------------------------

CREATE FUNCTION imp.GetSquare
(
	@num INT
)

RETURNS INT
AS
BEGIN
	RETURN @num * @num
END;


SELECT dbo.GetSquare


------------------------------- 120. Create a scaler function to calculate the yearly salary from a monthly salary.------------------------------


CREATE FUNCTION imp.YearlySalary
(
	@monthlysalary DECIMAL(10,2)
)
RETURN DECIMAL(10,2)
AS 
BEGIN
	RETURN @monthlysalary * 12;
END

----------------------------------121. create a scaler function to return the full name by combining first and last name .-----------------------------

CREATE FUNCTION imp.GetFullName
(
	@ first_name VARCHAR(50),
	@last_name VARCHAR(50)
)
RETURN VARCHAR(50)
AS
BEGIN
	RETURN CONCAT(@first_name, ' ',  @name);
END;

SELECT imp.GetFullName('Mamta','Chavan');



-------------------------------- 122. create table value function to display all employees from a specific department .------------

CREATE FUNCTION imp.@EmpbyDept
(
	@dept_id INT
)
RETURNS TABLE
AS
RETURN
(
	sELECT *
	FROM imp.Employees
	WHERE dept_id = @dept_id)


SELECT * FROM imp.@EmpbyDept(10);


-------------------------------- 123. Create Table value function to display employees whose salary is greater than 50000.-----------------------

CREATE FUNCTION dbo.@GetHighSalary
(
	@salary INT
)
RETURN TABLE
AS
RETURN
(
	SELECT *
	FROM imp.Employees
	WHERE salary > 50000

SELECT * FROM dbo.@GetHighSalary

------------------------------------ 124. create temporary table to store employee details . ----------------------------------

CREATE TABLE #Employee
(
	EmpId INT,
	EmpName VARCHAR(50),
	salary DECIMAL(10,2)
)


----------------------------------- 125. Insert 3 records into the temporary table .--------------

INSERT INTO #Employee
VALUES
(101,'Amit', 45000),
(102,'Neha',60000),
(103,'Rahul',55000);


----------------------------------- 126. Display all records from the temporary table. ---------------

SELECT * 
FROM #Employee

-------------------------------- 127. Create a table variable to store employee details .----------

DECLARE @Employee TABLE
(
		Empid INT,
		EmpName VARCHAR(50),
		Salary DECIMAL(10,2)
)


INSERT INTO @Employee
VALUES
(101,'Amit',45000),
(102,'Neha',60000),
(103,'Rahul',55000);

----------------------------------- 128. Insert 3 records into the table variable . ----------------------
DECLARE @Employee TABLE
(
		Empid INT,
		EmpName VARCHAR(50),
		Salary DECIMAL(10,2)
)
INSERT INTO @Employee
VALUES
(101,'Amit',45000),
(102,'Neha',60000),
(103,'Rahul',55000);

------------------------------------ 129. Display employees whose salary is greater than 50000 from the table variable. ----------------------
DECLARE @Employee TABLE
(
		Empid INT,
		EmpName VARCHAR(50),
		Salary DECIMAL(10,2)
)

INSERT INTO @Employee
VALUES
(101,'Amit',45000),
(102,'Neha',60000),
(103,'Rahul',55000);

SELECT *
FROM @Employee
WHERE salary > 50000;

----------------------------------- 130. Create a stored procedure to display all employee. ------------------------------

CREATE PROCEDURE imp.GetAllEmployees
AS
BEGIN
		SELECT *
		FROM imp.Employees;
END;

EXEC imp.GetAllEmployees

---------------------------------131. Create a stored procedure to displayemployees whose salary is greater than 50000 . --------------

CREATE PROCEDURE imp.GetEmpBySalary
AS
BEGIN
		SELECT *
		FROM imp.Employees
		WHERE salary > 50000;
END;

EXEC imp.GetEmpBySalary


------------------------------ 132. Create a stored procedure that accept an employee id and display employee details . -----------

CREATE  PROCEDURE imp.GetEmpDetails
		@EmpID INT
AS
BEGIN
		SELECT *
		FROM imp.Employees
		WHERE emp_id = @EmpID;
END ;

EXEC imp.GetEmpDetails @EmpId = 1

-------------------------- 133. Create stored procedure to insert a new employee .------------

CREATE PROCEDURE imp.InsertEmployee
	@EmpID INT,
	@EmpName VARCHAR(50),
	@Salary  decimal(10,2),
	@DeptID INT,
	@HireDate DATE,
	@ManagerID INT
AS
BEGIN
	INSERT INTO imp.Employees
	VALUES (@EmpID, @EmpName, @Salary,@DeptID, @HireDate, @ManagerID);
END;

EXEC imp.InsertEmployee
	@EmpID = 4,
	@EmpName = "Pooja",
	@Salary = 55000,
	@DeptId = 10,
	@HireDate = "2023-01-15",
	@ManagerID = 1
END;

-------------------------- 134. Create Strored procedure to update an employees salary . ----------------------

CREATE PROCEDURE imp.UpdateSalary
	@EmpID INT,
	@salary DECIMAL(10,2)
AS
BEGIN
		UPDATE imp.Employees
		SET salary = @salary
		WHERE emp_id =@EmpID;
END;

EXEC imp.UpdateSalary
	@EmpID = 5,
	@salary = 60000


------------------------------ 135. Create stored procedure to delete amn employees using employee id .-----

CREATE PROCEDURE imp.DeleteEmp
	@EmpID INT
AS
BEGIN
	DELETE FROM imp.Employees
	WHERE  emp_id = @EmpID;
END;

EXEC imp.DeleteEmp @EmpID = 6;

------------------------------- 136. Create a stored procedure that accept a department id and display all employees in that department .---------------

CREATE PROCEDURE imp.GetEmpByDept
	@DeptId INT
AS
BEGIN
	SELECT *
	FROM imp.Employees
	WHERE dept_id = @DeptId;
END;

EXEC imp.GetEmpByDept @DeptId = 10;

-------------------------------- 137. Create an after insert trigger .------------------------

CREATE TRIGGER trg_AfterInsert
ON imp.Employees
AFTER INSERT
AS
BEGIN
	PRINT 'Employees record inserted successfully.';
END;

---------------------------------- 138. Create an After Update Trigger. ---------------------------------------------

CREATE TRIGGER trg_AfterUpdate
ON imp.Employees
AFTER UPDATE
AS
BEGIN
	PRINT 'Employee recird updated successfully.';
END;

-----------------------------------139. Creatw an After DELETE Trigger. ----------------

CREATE TRIGGER trg_AfterDelete
ON imp.Employees
AFTER DELETE
AS
BEGIN
	PRINT 'Employees record deleted successfully.';
END;

-----------------------------------140. Create an Audit Table and Store inserted Records .--------------------------------------

CREATE TABLE imp.EmployeeAudit
(
	EmpID INT,
	EmpName VARCHAR(50),
	salary DECIMAL(10,2),
	ActionDate DATETIME
);

CREATE TRIGGER trg_AuditInsert
ON imp.Employees
AFTER INSERT
AS
BEGIN
	INSERT INTO imp.EmployeeAudit
	(
		EmpId,
		EmpName,
		salary,
		ActitionDate
	)
	
	SELECT 
			EmpId,
			EmpName,
			salary,
			GETDATE()
	FROM inserted;
END;


--------------------------------------141. create a Trigger to Prevent Deleting Records .---------------------------------------------

Create Trigger trg_PreventDelete
ON imp.Employees
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Delete operation is not allowed.';
END;

-------------------------------------- 142. Update an employees salary and save the changes using COMMIT . ---------------------------------
BEGIN TRANSACTION;

UPDATE Employees
SET salary = 600000
WHERE emp_id = 7;

COMMIT;


--------------------------------------- 143. Delete an employee and undo the changes using ROLLNACK . ---------------------------

BEGIN TRANSACTION ;

DELETE FROM Employees
WHERE emp_id = 8;

ROLLBACK;

--------------------------------------- 144. Perform multiple operations in one transaction . -------------

BEGIN TRANSACTION ;

INSERT INTO imp.Employees
VALUES(6, 'Priya', 55000, 10);

UPDATE Employees
SET salary = 65000
WHERE emp_id = 9;

DELETE FROM imp.Employees
WHERE emp_id = 10;

COMMIT;

---------------------------------------- 145. Money Transfer scenario . --------------------------------------------

BEGIN TRANSACTION ;

UPDATE Accolunt
SET Balance = Balance -100
WHERE AccountID = 1;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 2;

COMMIT;


----------------------------------------------------------------------------------------------------------------------

CREATE TABLE imp.Employees_A (
    EmpID INT,
    EmpName VARCHAR(50),
    Department VARCHAR(30)
);

INSERT INTO imp.Employees_A VALUES
(101, 'Amit', 'IT'),
(102, 'Neha', 'HR'),
(103, 'Rahul', 'Finance'),
(104, 'Priya', 'IT');


CREATE TABLE imp.Employees_B (
    EmpID INT,
    EmpName VARCHAR(50),
    Department VARCHAR(30)
);

INSERT INTO imp.Employees_B VALUES
(103, 'Rahul', 'Finance'),
(104, 'Priya', 'IT'),
(105, 'Karan', 'Marketing'),
(106, 'Sneha', 'HR');


--------------------------------------- 146. Display employee names from Employee_A and employee_B without duplicates .------------------------

SELECT * FROM imp.Employees_A
	UNION
SELECT * FROM imp.Employees_B

--------------------------------------- 147. Display employees nmes from Employees_A and Employees_B including duplicates . ----------------

SELECT * FROM imp.Employees_A
	UNION ALL
SELECT * FROM imp.Employees_B

----------------------------------------- 148. Display common employees present in both tables . -----------

SELECT EmpName, Department FROM imp.Employees_A

	INTERSECT

SELECT EmpName, Department FROM imp.Employees_A


------------------------------------------ 149. Display employees present in Employees_A but not in Employees_B .------------

SELECT EmpName , Department FROM imp.Employees_A
	EXCEPT
SELECT EmpName, Department FROM imp.Employees_B

------------------------------------------- 150 : Branch Scenario : Display all employees without duplicates .--------------------

SELECT EmpName FROM imp.BranchA
	UNION
SELECT EmpName FROM imp.BranchB

-------------------------------------------- 151. Create table using Primary Key .--------------------------------------

CREATE TABLE imp.EmployeesP(
		emp_id INT  PRIMARY KEY,
		emp_name VARCHAR(50),
		salary DECIMAL(10,2)
)


-------------------------------------------- 152. Create Table using a Foreign Key .------------

CREATE TABLE imp.DepartmentP(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(50),
	
)

---------------------------------------------153. Create table using UNIQUE contraint .-------

CREATE TABLE imp.EmployeesMP(
	emp_id INT PRIMARY KEY ,
	emp_name VARCHAR(20),
	email VARCHAR(1000) UNIQUE
)

--------------------------------------------- 154. Create table using not null .-----------------------------

CREATE tABLE imp.EmployeesM(
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(40) NOT NULL,
	salary DECIMAL(10,2)
)

---------------------------------------------- 155. Create table using check constraint .-------------

CREATE TABLE imp.EmployeesMGC(
		emp_id INT PRIMARY KEY,
		emp_name VARCHAR(50),
		salary DECIMAL(10,2),
		CHECK (salary >0)
)

----------------------------------------------- 156. Create table using DEFAULT constraint .--------

CREATE TABLE imp.EmployeesAB(
	emp_id int primary key,
	emp_name varchar(40),
	city varchar(50) DEFAULT 'Pune'
)

----------------------------------------------- 157. Find the department wise average salary from employees table.---------

SELECT  salary , dept_id
FROM imp.Employees
GROUP BY dept_id,salary

-------------------------------------------- 158. Display emp_name, dept_name, salary using employees and departments.---

SELECT e.emp_name, e.salary, d.department
FROM imp.Employees e
JOIN imp.Departments d
	ON  e.dept_id = d.dept_id

------------------------------ 159. Find employees whose salary is greater than the average salary of all employees .--------

SELECT emp_name, salary
FROM imp.Employees
WHERE salary > (
			SELECT AVG(salary) AS Avgsal
			FROM imp.Employees
	)

------------------------------ 160. Find the second highest salary using a window function. -------------------

SELECT  emp_name, 
		salary
FROM (	

		SELECT 
		emp_name, 
		salary, 
		DENSE_RANK() OVER(ORDER BY salary desc) AS rk
		FROM imp.Employees
		
) t
WHERE rk =2

------------------------------- 161. Senario: Find Highest paid employee in each department .--------------------

SELECT emp_name,salary,dept_id
FROM (
		SELECT  emp_name, 
				salary , 
				dept_id,
				DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary desc) AS high_paid_emp
		FROM imp.Employees
) t
 WHERE high_paid_emp =1
			