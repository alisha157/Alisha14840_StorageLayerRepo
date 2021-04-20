use mysql;
create database training21;
use training21;

 create table dept(
	deptno int not null , 
	dname varchar(20) not null,
	loc varchar(30) not null);
    
 drop table dept;
	create table dept(
	deptno int not null primary key, 
	dname varchar(20) not null,
	loc varchar(30) not null);
    
drop table dept;

create table dept(
	deptno int not null , 
	dname varchar(20) not null,
	loc varchar(30) not null,
	primary key(deptno)
);

drop table dept;

alter table dept 
add constraint pk_deptno primary key (deptno);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

select * from dept;

 CREATE TABLE EMP
(
	EMPNO int NOT NULL ,
	ENAME VARCHAR(20),
	JOB VARCHAR(9),
	MGR int ,
    HIREDATE DATETIME,
    SAL NUmeric(7, 2),
    COMM Numeric(7, 2),
    DEPTNO int 
 );
 
 alter table emp 
add constraint pk_emp_empno primary key(empno);

alter table emp
add foreign key (deptno) references dept(deptno);

alter table emp
add foreign key (mgr) references emp(empno);

INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

select * from emp;

SELECT * FROM DEPT;

select * from emp where deptno=20;

-- Questions
-- 1. List all manager data
select * from emp where job = 'manager';

-- 2. List all employees who are working as manager or analyst or clerk 
select empno, ename, job from emp where job = 'clerk' or job = 'manager' or job = 'analyst';

-- 3. List emp who are earning sal between 3000 and 5000 (inclusive of limit)
select empno, ename, sal from emp where sal>=3000 and sal<=5000;

-- 4. List emp who are working as manager or analyst or clerk and earning between 3000 and 5000
select empno, ename, job, sal from emp where (job = 'clerk' or job = 'manager' or job = 'analyst') and sal between 3000 and 5000;

-- 5. List all emp who are earning comm
select * from emp where comm is null;

-- 6. List all emp whose comm is not null
select * from emp where comm is not null;

-- 7. List all employees whose name starts with S
select * from emp where ename like 'S%';

-- 8. List all employees whose name ends with R
select * from emp where ename like '%R';

-- 9. List all employees whose name contains A
select * from emp where ename like '%A%';

-- 10. List all employees whose name contains A as second letter
select * from emp where ename like '_A%';

-- 11. List all employees whose name starts with either M or S
select * from emp where ename like 'M%'or'S%';

-- 12. List all employees whose name starts between A to M
select * from emp where ename between 'A' and 'M';

-- 13. List all employees whose name contains _
select * from emp where ename regexp '_';

-- 14. List all employees who are working as manager in either dept 10 or 20 and all clerk for dept 30
select * from emp where job ='manager' and deptno in ('10','20') or job ='clerk' and deptno = 30;

-- 15. List ename, sal and bonus as 10% of salary
select ename, sal, (sal*10/100) as bonus from emp;

-- 16. List emp data as per the ascending order of name
select * from emp order by ename asc; 

-- 17. List all as per their salary highest to lowest
select * from emp order by sal;

-- 18. List emp as per their dept, with in dept highest to lowest sal
select * from emp group by DEPTNO order by SAL desc;

-- 19. List top 3 highest paid emp
select * from emp order by sal desc limit 3;

-- 20. Return rank based on specified criteria 
-- if two emp have same salary they both get same number and next number will be skipped
select empno, ename, deptno, sal,
rank() over(partition by deptno order by sal desc) as 'rank' from emp;

-- 21. Return consecutive ranking values based on specified criteria 
select empno, ename, deptno, sal,
dense_rank() over(partition by deptno order by sal desc) as 'rank' from emp;

-- 22. List the different job name
select job from emp group by job;

-- 23. List total organization salary
select sum(sal) as Total from emp;

-- 24. List dept wise total salary
select sum(sal), deptno from emp group by DEPTNO;

-- 25. List Jobwise emp count
select job, count(*)
from emp
group by job;

-- 26. List all emp who have joined in month of Feb
select * from emp
where month (HIREDATE) = '02';

-- 27. List emp count joined between 1981 and 1983
select * from emp
where HIREDATE between '1981-01-01' and '1983-12-31'

-- 28. List how many years of service completed by each employee arrange based on tenure highest to lowest
select ENAME, year(now())-year(hiredate) as 'Tenure' from emp order by tenure desc;










