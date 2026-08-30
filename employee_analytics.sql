CREATE DATABASE employee_analytics;
USE employee_analytics;
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
(5,'Ankit','IT',23,85000,5,'Mumbai','2019-09-22'),
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
DELETE FROM employees;
SELECT*
FROM employees;
INSERT INTO employees
(emp_id,name,department,age,salary,experience,city,joining_date)
VALUES
(1,'Rahul','IT',33,55000,4,'Pune','2022-02-14'),
(2,'Raman','HR',22,46000,2,'Mumbai','2024-04-10'),
(3,'Divya','Finance',26,66000,3,'Chennai','2022-10-23'),
(4,'Amit','HR',27,88000,4,'Delhi','2021-12-24'),
(5,'Ankit','IT',23,85000,5,'Mumbai','2019-09-22'),
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
SELECT*
FROM employees;