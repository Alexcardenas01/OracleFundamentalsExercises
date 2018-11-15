--Basic Select sentense
-- Selección de todas las columnas
SELECT * FROM DEPARTMENTS;
-- Selección de columnas concretas
SELECT department_id, department_name, manager_id, location_id FROM DEPARTMENTS;


--DML Data manipulation language
--Select, insert, update, delete, merge
DESCRIBE employees;
--Nombre         ¿Nulo?   Tipo         
-------------- -------- ------------ 
--EMPLOYEE_ID    NOT NULL NUMBER(6)    
--FIRST_NAME              VARCHAR2(20) 
--LAST_NAME      NOT NULL VARCHAR2(25) 
--EMAIL          NOT NULL VARCHAR2(25) 
--PHONE_NUMBER            VARCHAR2(20) 
--HIRE_DATE      NOT NULL DATE         
--JOB_ID         NOT NULL VARCHAR2(10) 
--SALARY                  NUMBER(8,2)  
--COMMISSION_PCT          NUMBER(2,2)  
--MANAGER_ID              NUMBER(6)    
--DEPARTMENT_ID           NUMBER(4) 

SELECT employee_id "Identificador de usuario", last_name "Apellido", department_id FROM employees;
SELECT * FROM job_history;
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id) VALUES (500, 'Cárdenas', 'acardenas@oracle1.com', '04/09/2018', 'IT_PROG');
-- Uso de operadores
SELECT last_name, employee_id, salary, salary + 300 "increment" FROM employees WHERE department_id = 100;
-- jerarquía de operadores
SELECT last_name, employee_id, salary, salary + 300 "increment", (salary + 300) * 12 "Anual Increment" FROM employees WHERE department_id = 100;
--DEFINICIÓN DE VALOR NULO  **Los constrain NOT NULL Y PRIMARY KEY no permiten valores nulos
SELECT last_name, job_id, commission_pct FROM employees;
--La función NVL te permite reemplazar los valores nulos por un número o cadena especificados en el segundo parámetro
SELECT last_name, job_id, NVL(commission_pct,0)commission_pct FROM employees;
--Cuando hay expresiones aritméticas que contienen valores nulos, ellas tambien se evaluan como nulas
SELECT last_name, 12*salary*commission_pct FROM employees;
--Uso de operador de concatenación ||, cadenas de caracteres literales, operador de comillas alternativo y DISTINCT
--Concatenación
SELECT last_name || '*********************' ||job_id AS "Employees" FROM employees;
SELECT last_name || ' $' || salary || ' -> ' || commission_pct FROM employees WHERE commission_pct BETWEEN 0.1 AND 0.5;
SELECT commission_pct FROM employees;
SELECT * FROM employees WHERE last_name = 'Cárdenas';
--Filas duplicadas
SELECT department_id FRoM employees;
-- Usando DISTINCT para eliminar las filas duplicadas
SELECT DISTINCT department_id, job_id FROM employees;

--PRUEBAS 1ER MODULO
--Show the structure of the DEPARTMENTS table and select all data the table
DESCRIBE departments;
SELECT * FROM departments;
SELECT DISTINCT COUNT(department_name) FROM departments;
-- Create a query to display unique job codes from EMPLOYEE table
SELECT DISTINCT job_id FROM employees;
--Select all data the EMPLOYEES table, with the columns heading EMP#, Employee, Job, and hireDate, respectuvely
DESCRIBE employees;
SELECT employee_id "EMP#", last_name || ', ' || first_name AS "Employee", hire_date "Hire Date", job_id "Job", salary, commission_pct, manager_id, department_id
FROM employees;
-- Display the last name concatenated with the job ID, separated by a comma and space, and name colum enmployee an Title
SELECT last_name || ', ' || job_id AS "Employee an Title" FROM employees;