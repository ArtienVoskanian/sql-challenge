SQL Project

We are tasked with analyzing a sizable amount of employee data from the fictional company Pewlett Hackard. This data is stored within 6 csv files, and it is required to model, engineer, and analyze this data. Therefore, our first task involved creating an ERD between the files to better understand how their data may be related to one another.

![ERD](https://github.com/ArtienVoskanian/sql-challenge/blob/main/EmployeeSQL/ERD-sql-challenge.png) 

This ERD clearly shows how employee number (emp_no) is not only a primary key in many of the tables, but also a foreign key in one other. This column will play a pivotal role in allowing us to join, and therefore analyze, many of the tables together. In addition, department number (dept_no) is also as primary key that is found in multiple tables. It can also be found as a foreign key under the Dept_emp table. The only other primary key is title_id, which can be found as a foreign key in the Employees table. 

	The next goal is to create the table schemata with Postgres SQL and pgadmin 4, taking extra care to ensure that the data types, primary keys, and foreign keys are correct. Composite keys for two tables, Dept_emp and Dept_manager, are created to allow their row's to be uniquely identified.  

	Finally, with the schematas created and the data imported, we can begin organizing our extracting out data through queries. Within this script, queries were written in order to complete the following objectives.:

1) List the employee number, last name, first name, sex, and salary of each employee.

2) List the first name, last name, and hire date for the employees who were hired in 1986.

3) List the manager of each department along with their department number, department name, employee number, last name, and first name.

4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6) List each employee in the Sales department, including their employee number, last name, and first name.

7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
