-- 1. Display all the information of the EMP table
select * from emp;

-- 2. Display unique Jobs from EMP table
select DISTINCT JOB from emp;

-- 3. List the emps in the asc order of their Salaries
select ENAME,SAL from emp ORDER BY SAL;

-- 4. List the details of the emps in asc order of  the Dptnos and desc of Jobs
select * from emp
ORDER BY DEPTNO ASC,SAL DESC;

-- 5. Display all the unique job groups in the descending order
select DISTINCT JOB from emp ORDER BY JOB DESC;

-- 6. Display all the details of all ‘Mgrs’
select * from emp WHERE JOB= 'MANAGER';

-- 7. List the emps who joined before 1981
select ENAME,HIREDATE from emp
WHERE year(HIREDATE)<1981;

-- 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
select EMPNO, ENAME,SAL,COMM,(SAL+ifnull(comm,0)) AS TOTALSAL,((SAL+ifnull(comm,0))/30) AS DAILYSAL ,((SAL+ifnull(comm,0))*12) AS ANNSAL
from emp ORDER BY ANNSAL;

-- 9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select EMPNO,ENAME,JOB,HIREDATE, YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp
WHERE JOB='MANAGER';

-- 10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
select EMPNO,ENAME,SAL,YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp WHERE MGR='7369';
select EMPNO,ENAME,SAL,YEAR(NOW())-YEAR(HIREDATE)AS EXP from emp WHERE EMPNO IN(select EMPNO from emp WHERE MGR='7369');
select * from emp;

-- 11. Display all the details of the emps whose Comm  Is more than their Sal
select * from emp WHERE ifnull(COMM,0)>SAL;

-- 13. List the emps along with their Exp and Daily Sal is more than Rs 100
select EMPNO,ENAME,YEAR(NOW())-YEAR(HIREDATE) AS EXP,((SAL+ifnull(comm,0))/30) AS DAILYSAL from emp 
WHERE ((SAL+ifnull(comm,0))/30) >100;

-- 14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
select * from emp WHERE JOB IN('CLERK','ANALYST') ORDER BY JOB DESC;

-- 15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
select * from emp WHERE HIREDATE IN('1981-05-01','1981-12-03','1981-12-17','1980-01-19') ORDER BY HIREDATE;

-- 16. List the emp who are working for the Deptno 10 or 20
select * from emp WHERE DEPTNO IN ('10','20');

-- 17. List the emps who are joined in the year 81
select * from emp WHERE YEAR(HIREDATE)=1981;
-- select * from emp;

-- 19. List the emps Who Annual sal ranging from 22000 and 45000
 select ENAME, SAL*12 AS ANNSAL from emp WHERE SAL*12 BETWEEN 22000 AND 45000;
 select ENAME, ((SAL+ifnull(comm,0))*12) AS ANNSAL from emp WHERE ((SAL+ifnull(comm,0))*12) BETWEEN 22000 AND 45000;
 
 -- 20. List the Enames those are having five characters in their Names
 select ENAME from emp WHERE length(ENAME)=5;
 
 -- 21. List the Enames those are starting with ‘S’ and with five characters
 select ENAME from emp WHERE ENAME LIKE 'S%' AND length(ENAME)=5;
 
 -- 22. List the emps those are having four chars and third character must be ‘r’
 select ENAME from emp WHERE ENAME LIKE '__r_';
 select * from emp;
 
 -- 23. List the Five character names starting with ‘S’ and ending with ‘H’
 select ENAME from emp WHERE ENAME LIKE 'S%H' AND length(ENAME)=5;
 
 -- 24. List the emps who joined in January
 select ENAME,HIREDATE from emp WHERE MONTH(HIREDATE)=01;
 
 -- 27. List the emps whose names having a character set ‘ll’ together
 select ENAME from emp WHERE ENAME LIKE '%ll%';
 
 -- 29. List the emps who does not belong to Deptno 20
 select ENAME,DEPTNO from emp WHERE DEPTNO!=20;
 
 -- 30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
 select * from emp WHERE JOB NOT IN('PRESIDENT','MANAGER') ORDER BY SAL;
 
 -- 31. List the emps whose Empno not starting with digit 78
 select ENAME,EMPNO from emp WHERE EMPNO NOT LIKE '78%';
 
 -- 33. List the emps who are working under ‘MGR’
 select * from emp WHERE MGR IS NOT NULL;
 
 -- 34. List the emps who joined in any year but not belongs to the month of March
 select ENAME,HIREDATE from emp WHERE MONTH(HIREDATE)!=03;
 
 -- 35. List all the Clerks of Deptno 20
 select * from emp WHERE JOB='CLERK' AND DEPTNO=20;
 
 -- 36. List the emps of Deptno 30 or 10 joined in the year 1981
 select DEPTNO,ENAME from emp
WHERE DEPTNO IN(30,10) AND YEAR(HIREDATE)=1981;

-- 37. Display the details of SMITH
select * from emp WHERE ENAME= 'SMITH';

-- 38. Display the location of SMITH
select * from dept;
select * from emp;
select a.loc,b.ENAME from dept a,emp b
WHERE a.deptno=b.DEPTNO AND b.ENAME='SMITH';
-- MANAGER TABLE
create table MANAGER (
MGRID INT NOT NULL PRIMARY KEY,
)