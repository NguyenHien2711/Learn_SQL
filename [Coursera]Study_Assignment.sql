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

select F_NAME, L_NAME from dbo.Employees_updated EMP, dbo.Departments DPM 
where EMP.DEP_ID = DPM.DEPT_ID_DEP order by DEP_NAME DESC, L_NAME DESC

--6. For each department ID retrieve the number of employees in the department.

select DEP_ID, count(DEP_ID) as Total from dbo.Employees_updated GROUP BY(DEP_ID) 

--7. For each department retrieve the number of employees in the department, and the average employee salary in the department..

select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary 
from dbo.Employees_updated 
GROUP BY(DEP_ID) 

--8. In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..

select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary 
from dbo.Employees_updated 
GROUP BY(DEP_ID) order by avg(SALARY)

--9. In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

select DEP_ID, count(*) as Total, round(avg(SALARY),2) as Avg_Salary 
from dbo.Employees_updated 
GROUP BY(DEP_ID) 
having count(*) <4 
order by avg(SALARY)

--10. Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.

select * from dbo.Employees_updated where SALARY < (select AVG(SALARY) from Employees_updated)

--11. Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

select EMP_ID, SALARY, (select MAX(SALARY) from Employees_updated) as MAX_SALARY from Employees_updated

--12. Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from Employees_updated) AS EMP4ALL;

--JOIN EXERCISES

--13 Select the names and job start dates of all employees who work for the department number 5.

SELECT E.F_NAME, E.L_NAME, J.START_DATE 
FROM Employees_updated E
INNER JOIN JobsHistory J
ON E.EMP_ID = J.EMPL_ID
WHERE E.DEP_ID = '5'

--14. Select the names, job start dates, and job titles of all employees who work for the department number 5.

SELECT E.F_NAME, E.L_NAME, J.START_DATE, Jo.JOB_TITLE
FROM Employees_updated E
INNER JOIN JobsHistory J
ON E.EMP_ID = J.EMPL_ID
INNER JOIN Jobs Jo
ON E.JOB_ID = Jo.JOB_IDENT
WHERE E.DEP_ID = '5'

--15. Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM Employees_updated E
LEFT JOIN Departments D 
ON E.DEP_ID = D.DEPT_ID_DEP

--16. Re-write the previous query but limit the result set to include only the rows for employees born before 1980.

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, YEAR(E.B_DATE) as DOB, D.DEP_NAME
FROM Employees_updated E
LEFT JOIN Departments D 
ON E.DEP_ID = D.DEPT_ID_DEP
WHERE YEAR(E.B_DATE) <1980

--17. Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM Employees_updated E
FULL JOIN Departments D 
ON E.DEP_ID = D.DEPT_ID_DEP

--18. Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.

SELECT E.F_NAME, E.L_NAME, E.SEX, D.DEP_NAME
FROM Employees_updated E
FULL JOIN Departments D 
ON E.DEP_ID = D.DEPT_ID_DEP
AND E.SEX = 'M'