DROP TABLE IF EXISTS titles, 
DROP TABLE IF EXISTS employees, 
DROP TABLE IF EXISTS departments, 
DROP TABLE IF EXISTS dept_emp, 
DROP TABLE IF EXISTS dept_manager, 
DROP TABLE IF EXISTS salaries;

CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(50),
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);
--composite key consisting of emp_no and dept_no, referencing respective tables
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no) 
);

--checking imports work correctly
Select * from titles;

Select * from employees;

Select * from departments;

Select * from dept_emp;

Select * from dept_manager;

Select * from salaries;
