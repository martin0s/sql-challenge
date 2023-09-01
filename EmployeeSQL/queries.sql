-- Creating Empoyees Table

CREATE TABLE employees (
    emp_no VARCHAR   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex CHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);

Select * From employees


-- Creating Departments Table

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

Select * From departments


-- Creating Dept_Emp Table

CREATE TABLE dept_emp (
    emp_no VARCHAR   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

Select * From dept_emp


-- Creating Dept_Manager Table
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no VARCHAR NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

Select * From dept_manager


-- Creating Salaries Table

CREATE TABLE salaries (
  emp_no VARCHAR NOT NULL,
  salary INTEGER NOT NULL,
  PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

Select * From salaries


-- Creating Titles Table

CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR NOT NULL
);

Select * From titles



--Question 1--
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no;

--Question 2--
select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1986-01-01' AND '1986-12-31'
order by hire_date

--Question 3--
select dept_manager.emp_no, dept_manager.dept_no, last_name, first_name
from dept_manager
inner join employees
on dept_manager.emp_no = employees.emp_no;

--Question 4--
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name, dept_emp.dept_no
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no;

--Question 5--
SELECT first_name, last_name, sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%'

--Question 6--
SELECT emp.emp_no, emp.last_name, emp.first_name, dept_name
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept_name = 'Sales';

--Question 7--
SELECT emp.emp_no, emp.last_name, emp.first_name, dept_name
FROM employees AS emp
INNER JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--Question 8--
SELECT last_name, COUNT(last_name) as freq
FROM employees
GROUP BY last_name
ORDER BY freq desc