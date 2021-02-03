SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no AS "Employee Number", 
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	emp.sex AS "Gender",
	sal.salary  AS "Salary"
FROM employees AS emp
JOIN salaries AS sal
ON sal.emp_no = emp.emp_no
ORDER BY "Employee Number" ASC;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

SELECT dm.dept_no AS "Department Number", 
	dp.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name"
FROM dept_manager AS dm
INNER JOIN departments AS dp ON (dp.dept_no = dm.dept_no)
INNER JOIN employees AS emp ON (emp.emp_no = dm.emp_no);

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

SELECT emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	dp.dept_name AS "Department Name"
FROM employees AS emp
JOIN dept_emp AS demp ON (demp.emp_no = emp.emp_no)
JOIN departments AS dp ON (dp.dept_no = demp.dept_no)
ORDER BY "Employee Number" ASC;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Gender"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name

SELECT * FROM departments;

SELECT emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	dp.dept_name AS "Department Name"
FROM employees AS emp
INNER JOIN dept_emp AS demp ON (demp.emp_no = emp.emp_no)
INNER JOIN departments AS dp ON (dp.dept_no = demp.dept_no) WHERE dp.dept_name = 'Sales'
ORDER BY "Employee Number" ASC;

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT emp.emp_no AS "Employee Number",
	emp.last_name AS "Last Name",
	emp.first_name AS "First Name",
	dp.dept_name AS "Department Name"
FROM employees AS emp
INNER JOIN dept_emp AS demp ON (demp.emp_no = emp.emp_no)
INNER JOIN departments AS dp ON (dp.dept_no = demp.dept_no)
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development'
ORDER BY "Employee Number" ASC;

-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT last_name AS "Last Name",
	COUNT(last_name) AS "Number of employees"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-------------------------------------------------------------------------
--CHECKING CODE

SELECT * FROM departments;
-- Sales = d007, development = d005

SELECT dept_no, COUNT(dept_no)
FROM dept_emp
GROUP BY dept_no;

-- d007 = 52245, d005 = 85707, total = 137952

SELECT COUNT(emp.emp_no)
FROM employees AS emp
INNER JOIN dept_emp AS demp ON (demp.emp_no = emp.emp_no)
INNER JOIN departments AS dp ON (dp.dept_no = demp.dept_no)
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development';

-- Total = 137952
-------------------------------------------------------------------------------




