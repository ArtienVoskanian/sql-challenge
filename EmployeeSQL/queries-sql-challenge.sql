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
--identify rows in these tables
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


--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
ORDER BY 1
;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY 3
;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT t.title,dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
FROM employees as e
JOIN dept_manager as dm
ON e.emp_no = dm.emp_no
JOIN departments as d
ON dm.dept_no = d.dept_no
JOIN titles as t
ON e.emp_title_id = t.title_id
;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY 1
;
--List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B.

SELECT first_name,last_name,sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;
--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
JOIN dept_emp de on e.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;
--List each employee in the Sales and Development departments, including their employee number, last name, first name,
--and department name.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
;

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

SELECT last_name,COUNT(last_name) AS "Last Names Frequency"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC
;