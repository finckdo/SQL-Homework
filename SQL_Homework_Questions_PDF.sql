-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

Select
	em.employeeno as EmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	em.gender as Gender,
	cast(s.salary as money) as Salary
	--*
From employee em
	inner join salaries s on
		em.employeeno=s.employeeno
Order By
	s.salary desc
--limit 10

-- 2. List employees who were hired in 1986.

Select
	em.employeeno as EmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	em.gender as Gender,
	em.hiredate as HireDate,
	date_part('year', em.hiredate) as HireYear
	--*
From employee em
Where
	date_part('year', em.hiredate)=1986
--limit 10

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

Select
	d.departmentno as DepartmentNo,
	d.departmentname as DepartmentName,
	em.employeeno as ManagerEmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	dm.fromdate as StartDate,
	dm.todate as EndDate
	-- *
From employee em
	inner join department_manager dm on
		em.employeeno=dm.employeeno
	inner join department d on
		dm.departmentno=d.departmentno
--limit 10


--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

Select
	em.employeeno as EmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	d.departmentname as DepartmentName
From employee em
	inner join department_employee de on
		em.employeeno=de.employeeno
	inner join department d on
		de.departmentno=d.departmentno
--limit 10


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

Select
	*
From employee em
Where
	em.firstname = 'Hercules'
	and em.lastname like 'B%'
--limit 10
	
--6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

Select
	em.employeeno as EmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	d.departmentname as DepartmentName
	--*
From employee em
	inner join department_employee de on
		em.employeeno=de.employeeno
	inner join department d on
		de.departmentno=d.departmentno
Where
	d.departmentname = 'Sales'
--limit 10

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.

Select
	em.employeeno as EmployeeNo,
	em.lastname as LastName,
	em.firstname as FirstName,
	d.departmentname as DepartmentName
	--*
From employee em
	inner join department_employee de on
		em.employeeno=de.employeeno
	inner join department d on
		de.departmentno=d.departmentno
Where
	d.departmentname in ('Sales', 'Development')
--limit 10


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share 
--each last name.

Select
	em.lastname as LastName,
	count(em.lastname) as LastNameCnt
	--*
From employee em
Group By
	em.lastname
Order By
	2 desc
--limit 10

	



