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