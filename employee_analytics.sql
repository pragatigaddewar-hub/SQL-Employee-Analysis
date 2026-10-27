CREATE DATABASE IF NOT EXISTS employee_analytics;
USE employee_analytics;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
emp_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
age INT,
salary DECIMAL(10,2),
experience INT,
city VARCHAR(30),
joining_date DATE
);
INSERT INTO employees
(emp_id,name,department,age,salary,experience,city,joining_date)
VALUES
(1,'Rahul','IT',33,55000,4,'Pune','2022-02-14'),
(2,'Raman','HR',22,46000,2,'Mumbai','2024-04-10'),
(3,'Divya','Finance',26,66000,3,'Chennai','2022-10-23'),
(4,'Amit','HR',27,88000,4,'Delhi','2021-12-24'),
(5,'Ankit','IT',28,85000,5,'Mumbai','2019-09-22'),
(6,'Kiran','HR',30,90000,7,'Chennai','2018-12-16'),
(7,'Shyam','Finance',28,68000,4,'Pune','2020-11-23'),
(8,'Ravina','IT',35,56000,3,'Pune','2023-10-29'),
(9,'Tejal','IT',27,99000,4,'Mumbai','2022-02-13'),
(10,'Parag','HR',34,88000,5,'Pune','2023-10-11'),
(11,'Ram','Finance',36,65000,4,'Chennai','2022-11-19'),
(12,'Kavita','HR',29,89000,6,'Mumbai','2019-10-24'),
(13,'Lina','IT',25,77000,3,'Mumbai','2020-05-22'),
(14,'Kailash','Finance',36,86000,8,'Pune','2018-10-30'),
(15,'Ravi','HR',29,84000,7,'Delhi','2019-03-18');
SELECT *
FROM employees;


# Total number of employees in the company.
SELECT COUNT(*)
FROM employees;

# Result : 15
# Insight : The company has 15 employees.


# Average salary of all employees in the company. 
SELECT AVG(salary)
FROM employees;

# Result : 76133.333
# Insight : The average salary of employee is 76133.333


# Highest salary in the company. 
SELECT MAX(salary)
FROM employees;

# Result : 99,000
# Insight : The highest salary in the company is 99,000


# Lowest salary in the company. 
SELECT MIN(salary)
FROM employees;

# Result : 46,000
# Insight : The lowest salary in the company is 46,000


# Total salary paid to all employees.
SELECT SUM(salary)
FROM employees;

# Result : 1,142,000
# Insight : Total salary paid to all employees is 1,142,000


# Number of employee in each department.
SELECT department,COUNT(*) AS employee_count
FROM employees
GROUP BY department;

# Result :
# IT      : 5
# HR      : 6
# Finance : 4
# Insight : HR has the highest number of employees.
 
 
 # Average salary by department.
SELECT department,AVG(salary) AS avg_salary
FROM employees
GROUP BY department; 

# Result : 
#  IT      :  74,400
# HR      :  80,833.333 
# Finance :  71,250

# Insight :  HR has the highest average salary.


# Highest salary in each department.
SELECT department,MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

# Result : 
# IT      : 99,000
# HR      : 90,000
# Finance : 86,000

# Insight : IT department has the highest salary.


# Number of employees earning more than 80,000
SELECT COUNT(*) AS employee_count
FROM employees
WHERE salary > 80000;

# Result : 8
# Insight : 8 employees are earning more than 80,000


# Employees with more than 5 years of experience.
SELECT name 
FROM employees
WHERE experience > 5;

# Result : Kiran,Kavita,Kailash,Ravi 
# Insight :  4 employees have more than 5 years experience.


# Employees from Mumbai
SELECT name
FROM employees
WHERE city = 'Mumbai';

# Result : Raman,Ankit,Tejal,Kavita,Lina
# Insight : 5 employees are from Mumbai.


# Employees aged above 30
SELECT name
FROM employees
WHERE age > 30;

# Result : Rahul,Ravina,Parag,Ram,Kailash
# Insight : 5 employees are aged above 30 


# Employees who joined after 2022
SELECT name
FROM employees
WHERE joining_date > '2022-12-31';

# Result : Raman,Ravina,Parag
# Insight : 3 employees joined after 2022


# Average experience of employees
SELECT AVG(experience) AS avg_experience
FROM employees;

# Result : 4.6
# Insight : The average experience is 4.6 years.



# Employees with salary between 60,000 and 90,000
SELECT name,salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000;

# Result : Divya,Amit,Ankit,Kiran,Shyam,Parag,Ram,Kavita,Lina,Kailash,Ravi
# Insight : 11 employees have salaries between 60,000 and 90,000


# Employees working in IT or Finance department
SELECT name
FROM employees
WHERE department IN ('IT','Finance');

# Result : Rahul,Divya,Ankit,Shyam,Ravina,Tejal,Ram,Lina,Kailash
# Insight : 9 employees work in IT or Finance  departments.


# Employees from Pune with more than 5 years of experience.
SELECT name,city,experience
FROM employees
WHERE city = 'Pune'
      AND experience > 5;
      
# Result : Kailash have 8 years experience    
# Insight : Kailash has 8 years of experience and he is from Pune. 


# Employees from Mumbai with salary above 80,000
SELECT name,city,salary
FROM employees
WHERE city = 'Mumbai'
      AND salary > 80000;
      
# Result : Ankit,Tejal,Kavita
# Insight : 3 employees from Mumbai earn more than 80,000.


# Employees in HR department with more than 5 years of experience.  
SELECT name,department,experience
FROM employees
WHERE department = 'HR'
      AND experience > 5;

# Result : Kiran,Kavita,Ravi
# Insight : 3 employees in HR have more than 5 years experience. 


# Employees with salary above the company average  salary.
SELECT name,salary
FROM employees
WHERE salary >
(
SELECT AVG(salary)
FROM employees
);

# Result : Amit,Ankit,Kiran,Tejal,Parag,Kavita,Lina,Kailash,Ravi
# Insight : 9 employees earn more than the average salary.


# Department-wise total salary.
SELECT department,SUM(salary) AS total_salary
FROM employees
GROUP BY department;

# Result : 
# IT      : 372000
# HR      : 485000
# Finance : 285000
# Insight : HR has the highest total salary.


# Departments with more than 4 employees. 
SELECT department,COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING employee_count > 4;

# Result : 
# IT  : 5
# HR  : 6
# Insight : IT and HR have more than 4 employees.


# Departments with average salary above 75000
SELECT department,AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 75000;

# Result : 
# HR : 80833.333
# Insight : HR has the highest average salary.


# Departments with total salary above 300000
SELECT department,SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 300000;

# Result : 
# IT  : 372000
# HR  : 485000
# Insight : HR has the highest total salary.


# Cities with more than 2 employees.
SELECT city,COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING employee_count > 2;

# Result : 
# Pune : 5
# Mumbai : 5
# Chennai : 3
# Insight : 3 cities have more than 2 employees. 


# Departments where the highest salary is above 85000
SELECT department,MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING highest_salary > 85000;

# Result :
# IT      : 99000
# HR      : 90000
# Finance : 86000
# Insight : IT has the highest salary.


# Department with more than 1 employee earning above 80000
SELECT department,COUNT(*) AS employee_count
FROM employees
WHERE salary > 80000
GROUP BY department
HAVING employee_count > 1;
           
# Result :            
# HR : 5
# IT : 2
# Insight : HR has the highest employee count.


# Department-wise average experience
SELECT department,AVG(experience) AS avg_experience
FROM employees
GROUP BY department;

# Result:
# IT      : 3.8
# HR      : 5.17
# Finance : 4.75
# Insight : HR has the highest average experience.


# Department-wise minimum salary
SELECT department,MIN(salary) AS min_salary
FROM employees
GROUP BY department;

# Result :
# IT      :  55000
# HR      :  46000
# Finance :  65000
# Insight : HR has the lowest minimum salary.


# Department-wise maximum experience.
SELECT department,MAX(experience) AS max_experience
FROM employees
GROUP BY department;

# Result : 
# IT      : 5
# HR      : 7
# Finance : 8
# Insight : Finance has the highest maximum experience.


# Department-wise employee count and average salary.
SELECT department,COUNT(*) AS employee_count,
               AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

# Result :
# IT : employee count 5 and average salary is 74400
# HR : employee count 6 and average salary is 80833.33
# Finance : employee count 4 and average salary is 71250
# Insight : HR has the highest employee count and average salary.


# Department-wise employee count and maximum salary.
SELECT department,COUNT(*) AS employee_count,
       MAX(salary) AS max_salary
FROM employees
GROUP BY department;
# Result :
# IT      : 5 , 99000
# HR      : 6 , 90000
# Finance : 4 , 86000
# Insight : IT has the highest maximum salary and HR has the highest employee count.    


# Department-wise employee count and minimum salary.
SELECT department, COUNT(*) AS employee_count,
              MIN(salary) AS min_salary
FROM employees
GROUP BY department;
# Result :
# IT      : 5 , 55000
# HR      : 6 , 46000
# Finance : 4 , 65000            
# Insight : HR has the highest employee count and lowest minimum salary.


# Department-wise average age.
SELECT department, AVG(age) AS avg_age
FROM employees
GROUP BY department;
# Result :
# IT      : 29.6
# HR      : 28.5
# Finance : 31.5
# Insight : Finance has the highest average age.


# Department-wise minimum age
SELECT department,MIN(age) AS min_age
FROM employees
GROUP BY department;

# Result :
# IT      : 25
# HR      : 22
# Finance : 26
# Insight : HR has the lowest minimum age.


# Department-wise maximum age
SELECT department,MAX(age) AS max_age
FROM employees
GROUP BY department;

# Result :
# IT      : 35
# HR      : 34
# Finance : 36
# Insight : Finance has the highest maximum age.


# Department-wise total experience
SELECT department,SUM(experience) AS total_experience
FROM employees
GROUP BY department;
# Result :
# IT      : 19
# HR      : 31
# Finance : 19
# Insight : HR has the highest total experience.


# Department-wise average salary and total salary.
SELECT department, AVG(salary) AS avg_salary,
           SUM(salary) AS total_salary
FROM employees
GROUP BY department;        

# Result :
# IT      : 74400 , 372000
# HR      : 80833.333 , 485000
# Finance : 71250 , 285000
# Insight : HR has the highest average salary and the highest total salary.  



# Department-wise average age and average experience.
SELECT department, AVG(age) AS avg_age,
            AVG(experience) AS avg_experience
FROM employees
GROUP BY department;      

# Result :
# IT      : 29.6 , 3.8
# HR      : 28.5 , 5.17
# Finance : 31.5 , 4.75   
# Insight : Finance has the highest average age and HR has the highest average experience.


# Department-wise highest salary in the company.
SELECT department , 
       MAX(salary) AS max_salary
FROM employees
GROUP BY department;        

# Result :
# IT      : 99000
# HR      : 90000
# Finance : 86000
# Insight : IT has the highest maximum salary.


# Employee with highest salary in the company. 
SELECT name 
FROM employees
WHERE salary =
(
SELECT MAX(salary) 
FROM employees
);

# Result : Tejal
# Insight : Tejal has the highest salary. 


# Employee with lowest salary in the company.
SELECT name 
FROM employees
WHERE salary =
(
SELECT MIN(salary)
FROM employees
);

# Result : Raman
# Insight : Raman has the lowest salary.


# Employees earning the highest salary in each department.
SELECT e.name , e.department , e.salary
FROM employees AS e
JOIN
(
SELECT department,MAX(salary) AS max_salary
FROM employees 
GROUP BY  department 
) AS m
ON e.department = m.department
AND e.salary = m.max_salary;

# Result :
# Kiran : HR  : 90000
# Tejal : IT  : 99000
# Kailash : Finance : 86000
# Insight : Tejal has the highest salary in the company.


# Employee earning more than the average salary of their department. 
SELECT e.name,e.salary,e.department
FROM employees AS e
WHERE salary >
(
SELECT AVG(salary) AS avg_salary
FROM employees AS e2
WHERE e2.department = e.department
);

# Result :
# Amit    : 88000 : HR
# Ankit   : 85000 : IT
# Kiran   : 90000 : HR
# Tejal   : 99000 : IT
# Parag   : 88000 : HR
# Kavita  : 89000 : HR
# Lina    : 77000 : IT
# Kailash : 86000 : Finance
# Ravi    : 84000 : HR
# Insight : Tejal has the highest salary.



# Employees with their department average salary.
SELECT e.name,e.department,e.salary,m.avg_salary
FROM employees e
JOIN
(
SELECT department,AVG(salary) AS avg_salary
FROM employees 
GROUP BY department
)AS m
ON e.department = m.department;

# Result :
# Rahul   : IT      : 55000  : 74400
# Raman   : HR      : 46000  : 80833.333
# Divya   : Finance : 66000  : 71250
# Amit    : HR      : 88000  : 80833.333
# Ankit   : IT      : 85000  : 74400
# Kiran   : HR      : 90000  : 80833.333
# Shyam   : Finance : 68000  : 71250
# Ravina  : IT      : 56000  : 74400
# Tejal   : IT      : 99000  : 74400
# Parag   : HR      : 88000  : 80833.333
# Ram     : Finance : 65000  : 71250
# Kavita  : HR      : 89000  : 80833.333
# Lina    : IT      : 77000  : 74400
# Kailash : Finance : 86000  : 71250
# Ravi    : HR      : 84000  : 80833.333
# Insight : Each employee is shown with their department average salary.



# Employees whose salary is higher than their department average salary.
SELECT e.name , e.salary,
       e.department , m.avg_salary
FROM employees AS e
JOIN
(       
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
) AS m
ON e.department = m.department
WHERE e.salary > m.avg_salary;

# Result :
# Amit    : 88000 : HR      : 80833.333
# Ankit   : 85000 : IT      : 74400
# Kiran   : 90000 : HR      : 80833.333
# Tejal   : 99000 : IT      : 74400
# Parag   : 88000 : HR      : 80833.333
# Kavita  : 89000 : HR      : 80833.333
# Lina    : 77000 : IT      : 74400
# Kailash : 86000 : Finance : 71250
# Ravi    : 84000 : HR      : 80833.333
# Insight : Tejal has the highest salary.


# Employees whose salary is equal to their department's minimum salary.
SELECT e.name,e.salary,e.department,m.min_salary
FROM employees AS e
JOIN
(
SELECT department,MIN(salary) AS min_salary
FROM employees
GROUP BY department
) AS m
ON e.department = m.department
WHERE e.salary = m.min_salary;

# Result :
# Rahul : 55000 : IT      : 55000
# Raman : 46000 : HR      : 46000
# Ram   : 65000 : Finance   : 65000
# Insight : Raman has the minimum salary.


# employees whose salary is equal to their department's maximum salary.
SELECT e.name,e.salary,e.department,m.max_salary
FROM employees AS e
JOIN
(
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
) AS m
ON e.department = m.department
WHERE e.salary = m.max_salary;

# Result :
# Kiran   : 90000 : HR      : 90000
# Tejal   : 99000 : IT      : 99000
# Kailash : 86000 : Finance : 86000
# Insight : Tejal has the highest salary.


# Employees who are earning more than their department's minimum salary.
SELECT e.name, e.salary,e.department,m.min_salary
FROM employees AS e
JOIN 
(
SELECT department,MIN(salary) AS min_salary
FROM employees
GROUP BY department
) AS m
ON e.department = m.department
WHERE e.salary > m.min_salary;

# Result :
# Divya   : 66000  : Finance : 65000
# Amit    : 88000  : HR      : 46000
# Ankit   : 85000  : IT      : 55000
# Kiran   : 90000  : HR      : 46000
# Shyam   : 68000  : Finance : 65000
# Ravina  : 56000  : IT      : 55000
# Tejal   : 99000  : IT      : 55000
# Parag   : 88000  : HR      : 46000
# Kavita  : 89000  : HR      : 46000
# Lina    : 77000  : IT      : 55000
# Kailash : 86000  : Finance : 65000
# Ravi    : 84000  : HR      : 46000
# Insight : 12 employees earn more than their department's minimum salary.


# Employees earning less than their department's average salary.
SELECT e.name,e.salary,e.department,m.avg_salary
FROM employees AS e
JOIN
(
SELECT department,AVG(salary) AS avg_salary
FROM employees
GROUP BY department
) AS m
ON e.department = m.department
WHERE e.salary < m.avg_salary;

# Result :
# Rahul  : 55000  : IT      : 74400
# Raman  : 46000  : HR      : 80833.333
# Divya  : 66000  : Finance : 71250
# Shyam  : 68000  : Finance : 71250
# Ravina : 56000  : IT      : 74400
# Ram    : 65000  : Finance : 71250
# Insight : 6 employees earn less than their department's average salary.



# Rank employees based on salary from highest to lowest.
SELECT name,salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;
# Result :
# Tejal  : 99000 : 1
# Kiran  : 90000 : 2
# Kavita : 89000 : 3
# Amit   : 88000 : 4
# Parag  : 88000 : 4
# Kailash: 86000 : 6
# Ankit  : 85000 : 7
# Ravi   : 84000 : 8
# Lina   : 77000 : 9
# Shyam  : 68000 : 10
# Divya  : 66000 : 11
# Ram    : 65000 : 12
# Ravina : 56000 : 13
# Rahul  : 55000 : 14
# Raman  : 46000 : 15
# Insight : Tejal has the highest salary and rank 1.



# Rank employees based on salary using DENSE_RANK()
SELECT name,salary,
      DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;      

# Result :
# Tejal  : 99000 : 1
# Kiran  : 90000 : 2
# Kavita : 89000 : 3
# Amit   : 88000 : 4
# Parag  : 88000 : 4
# Kailash: 86000 : 5
# Ankit  : 85000 : 6
# Ravi   : 84000 : 7
# Lina   : 77000 : 8
# Shyam  : 68000 : 9
# Divya  : 66000 : 10
# Ram    : 65000 : 11
# Ravina : 56000 : 12
# Rahul  : 55000 : 13
# Raman  : 46000 : 14
# Insight : Tejal has the highest salary and rank 1.



# Assign a unique row number to employees based on salary from highest to lowest.
SELECT name,salary,
ROW_NUMBER() OVER(ORDER BY salary DESC)
FROM employees;

# Result :
# Tejal  : 99000 : 1
# Kiran  : 90000 : 2
# Kavita : 89000 : 3
# Amit   : 88000 : 4
# Parag  : 88000 : 5
# Kailash: 86000 : 6
# Ankit  : 85000 : 7
# Ravi   : 84000 : 8
# Lina   : 77000 : 9
# Shyam  : 68000 : 10
# Divya  : 66000 : 11
# Ram    : 65000 : 12
# Ravina : 56000 : 13
# Rahul  : 55000 : 14
# Raman  : 46000 : 15
# Insight : Tejal has the highest salary and is assigned row number 1.



# Rank employees by salary within each department. 
SELECT name,department,salary,
RANK() OVER(PARTITION BY department
            ORDER BY salary DESC) AS salary_rank
FROM employees;          

# Result :
# Kailash : Finance : 86000 : 1
# Shyam   : Finance : 68000 : 2
# Divya   : Finance : 66000 : 3
# Ram     : Finance : 65000 : 4
# Kiran   : HR      : 90000 : 1
# Kavita  : HR      : 89000 : 2
# Amit    : HR      : 88000 : 3
# Parag   : HR      : 88000 : 3
# Ravi    : HR      : 84000 : 5
# Raman   : HR      : 46000 : 6
# Tejal   : IT      : 99000 : 1
# Ankit   : IT      : 85000 : 2
# Lina    : IT      : 77000 : 3
# Ravina  : IT      : 56000 : 4
# Rahul   : IT      : 55000 : 5
# Insight : Kailash has the highest salary in Finance, Kiran in HR, Tejal in IT.



# Find the top 2 highest paid employees from each department.
SELECT name,department,salary,salary_rank
FROM 
(
SELECT name,department,salary,
    RANK() OVER(PARTITION BY department
                  ORDER BY salary DESC) AS salary_rank
FROM employees
) AS ranked
WHERE salary_rank <= 2;

# Result :
# Kailash  : Finance  : 86000 : 1
# Shyam    : Finance  : 68000 : 2
# Kiran    : HR       : 90000 : 1
# Kavita   : HR       : 89000 : 2
# Tejal    : IT       : 99000 : 1
# Ankit    : IT       : 85000 : 2
# Insight : Kailash has the highest salary in Finance,Kiran in HR and Tejal in IT.



# Find the second highest salary in the company using DENSE_RANK().
SELECT salary
FROM
(
SELECT salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees) AS ranked
WHERE salary_rank = 2;

# Result : 90000
# Insight : 90000 is the second highest salary in the company.


# Find the top 3 highest paid employees in the company using row number.
SELECT salary
FROM
(
SELECT salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employees
) AS ranked
WHERE salary_rank <= 3;    
# Result : 99000,90000,89000
# Insight : The top 3 highest salaries are 99000,90000,89000.


# Find the lowest 3 salaries in the company using row number.
SELECT salary
FROM
(
SELECT salary,
    ROW_NUMBER() OVER(ORDER BY salary) AS salary_rank
FROM employees
) AS ranked    
WHERE salary_rank <= 3;

# Result : 46000,55000,56000
# Insight : The lowest 3 salaries are 46000,55000 and 56000.



# Find the highest paid employee from each department using DENSE_RANK().
SELECT name,department,salary
FROM
(
SELECT name,department,salary,
      DENSE_RANK() OVER(PARTITION BY department
                          ORDER BY salary DESC) AS salary_rank
FROM employees
) AS ranked
WHERE salary_rank = 1;      

# Result :
# Kailash : Finance : 86000
# Kiran   : HR      : 90000             
# Tejal   : IT      : 99000
# Insight : Kailash has the highest salary in Finance, Kiran in HR, Tejal in IT.



# Find the second highest paid employee from each department using DENSE_RANK().
SELECT name,department,salary
FROM
(
SELECT name,department,salary,
    DENSE_RANK() OVER(PARTITION BY department
                        ORDER BY salary DESC) AS salary_rank
FROM employees
) AS ranked
WHERE salary_rank = 2;                     

# Result :
# Shyam : Finance : 68000
# Kavita : HR     : 89000
# Ankit  : IT     : 85000   
# Insight : Shyam has the second highest salary in Finance, Kavita in HR, Ankit in IT.
