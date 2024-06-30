--List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, 
    emp.sex, sal.salary
FROM employees as emp
LEFT JOIN salaries as sal
ON emp.emp_no = sal.emp_no ORDER BY emp.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986/01/01' and '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dem.dept_no, dep.dept_name, dem.emp_no,
	emp.last_name, emp.first_name
FROM dept_manager AS dem
INNER JOIN departments as dep on (dem.dept_no = dep.dept_no)
INNER JOIN employees as emp on (dem.emp_no = emp.emp_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d
FROM employees as emp
INNER JOIN dep_emp as de on e.dept_no = de.dept_no
INNER JOIN departments as d on de.dept_no = d.dept_no
ORDER by e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
from employees
WHERE first_name = 'Hercules' And last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
Select e.emp_no, e.last_name, e.first_name
from employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
Select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
INNER JOIN dept_emp as de ON e.emp_no = de.emp_no
INNER JOIN departments as d on de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

--list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) as name_total
FROM employees GROUP BY last_name
ORDER By name_total DESC;
