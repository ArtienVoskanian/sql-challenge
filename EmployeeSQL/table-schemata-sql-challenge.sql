-- Create Tables for the csv files, making sure to include proper data types and establish primary/foreign keys.
CREATE TABLE Titles (
	title_id VARCHAR(30) PRIMARY KEY  NOT NULL,
	title VARCHAR(30) NOT NULL
);


CREATE TABLE Departments(
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);


-- Composite keys were created in Dept_emp and Dept_manager to uniquely 
--identify rows in Dept_emp and Dept_manager tables
CREATE TABLE Dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	foreign key (emp_no) references Employees (emp_no),
	foreign key (dept_no) references Departments (dept_no),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE Dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL,
	foreign key (emp_no) references Employees (emp_no),
	foreign key (dept_no) references Departments (dept_no),
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE Salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	foreign key (emp_no) references Employees (emp_no)
);
