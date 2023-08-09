--Query employees table
--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT first_name, last_name, sex, salary
FROM employees
INNER JOIN salaries 
ON salaries.emp_no = employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
--Using EXTRACT (Postgres function) to get the YEAR(python function)

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Using BETWEEN & AND(sql query lang)

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--3.List the manager of each department along with their department number, department name, 
--employee number, last_name, and first_name.

SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE 
	first_name = 'Hercules' 
	AND last_name LIKE 'B%';
	
--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments d
ON d_e.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');  

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT e.last_name, COUNT(last_name) AS total 
FROM employees e
GROUP BY e.last_name  
ORDER BY total DESC

