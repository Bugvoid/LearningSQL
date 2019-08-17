--1
SELECT * FROM EMPLOYEES where SALARY BETWEEN 1000 AND 2000;



--2
SELECT DEPARTMENT_ID,DEPARTMENT_NAME FROM DEPARTMENTS ORDER by DEPARTMENT_NAME;



--3
SELECT JOB_TITLE FROM JOBS;



--4
SELECT * FROM EMPLOYEES where DEPARTMENT_ID BETWEEN 10 and 20 ORDER BY FIRST_NAME;



--5
SELECT FIRST_NAME,LAST_NAME,JOB_ID,DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 and JOB_ID like '%CLERK';



--6
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES where FIRST_NAME like '%th' or FIRST_NAME like '%ll';



--7
SELECT FIRST_NAME,LAST_NAME,SALARY,JOB_ID FROM EMPLOYEES  WHERE MANAGER_ID in ( SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE JOB_ID like '%MGR');


