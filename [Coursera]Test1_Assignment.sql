--1. Retrieve all employees whose address is in Elgin,IL.
select F_NAME, L_NAME from dbo.Employees_updated where ADDRESS like '%Elgin,IL%';
--2. Retrieve all employees who were born during the 1970's.
select * from dbo.Employees_updated where year(B_DATE) between 1970 and 1979
select F_NAME, L_NAME from dbo.Employees_updated where B_DATE like '%197%';

--3. Retrieve a list of employees ordered by department ID.
select * from dbo.Employees_updated order by DEP_ID
--4. Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
select * from dbo.Employees_updated order by DEP_ID DESC, L_NAME DESC
--5. In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within 
-- each department ordered alphabetically in descending order by last name.
select F_NAME, L_NAME from dbo.Employees_updated EMP, dbo.Departments DPM where EMP.DEP_ID = DPM.DEPT_ID_DEP order by DEP_NAME DESC, L_NAME DESC
--6. For each department ID retrieve the number of employees in the department.
select DEP_ID, count(DEP_ID) as Total from dbo.Employees_updated GROUP BY(DEP_ID) 
--7. For each department retrieve the number of employees in the department, and the average employee salary in the department..
select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary from dbo.Employees_updated GROUP BY(DEP_ID) 
--8. In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..
select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary from dbo.Employees_updated GROUP BY(DEP_ID) order by avg(SALARY)
--9. In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.
select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary from dbo.Employees_updated GROUP BY(DEP_ID) having count(*) <4 order by avg(SALARY)
--10. Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
select * from dbo.Employees_updated where SALARY < (select AVG(SALARY) from Employees_updated)
--11. Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, (select MAX(SALARY) from Employees_updated) as MAX_SALARY from Employees_updated
--12. Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from Employees_updated) AS EMP4ALL;



