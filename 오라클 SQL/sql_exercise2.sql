/**********************************************************
*	SQL Query & Function Example2
**********************************************************/
/**
-- Employees Table Columns
-- EMPLOYEE_ID
-- FIRST_NAME
-- LAST_NAME
-- EMAIL
-- PHONE_NUMBER
-- HIRE_DATE
-- JOB_ID
-- SALARY
-- COMMISSION_PCT
-- MANAGER_ID
-- DEPARTMENT_ID
**/

/**
--Departments Table Columns
--DEPARTMENT_ID
--DEPARTMENT_NAME
--MANAGER_ID
--LOCATION_ID
**/

/**
50번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라

SELECT AVG(salary),MAX(salary),MIN(salary),COUNT(*)
  2  FROM employees
  3  WHERE department_id=50;

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
 3475.55556        8200        2100         45
**/





/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.


**/






/**
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.
**/





/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.
**/





/**
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.
**/


/**
 부서번호, 부서명, 이름, 급여를 출력하라.

SELECT employees.department_id,departments.department_name,employees.first_name,employees.salary
  2  FROM employees,departments
  3  WHERE employees.department_id=departments.department_id;

DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------------------------------------
FIRST_NAME                                   SALARY
---------------------------------------- ----------
           10 Administration
Jennifer                                       4400

           20 Marketing
Michael                                       13000

           20 Marketing
Pat                                            6000


DEPARTMENT_ID DEPARTMENT_NAME
------------- ------------------------------------------------------------
FIRST_NAME                                   SALARY
---------------------------------------- ----------
           30 Purchasing
Den                                           11000

           30 Purchasing
Alexander                                      3100

           30 Purchasing
Shelli                                         2900
**/


/**
이름이 adam인 사원의 부서명을 출력하라.

SELECT departments.department_name
  2  FROM departments, employees
  3  WHERE employees.department_id = departments.department_id AND employees.first_name='Adam';

DEPARTMENT_NAME
------------------------------------------------------------
Shipping
**/


/**
employees테이블에 있는 employee_id와 manager_id를 이용하여 서로의 관계를 다음과 같이 출력하라
'smith'의 매니저는 'ford'이다.


**/



/**
adam의 직무와 같은 직무를 갖는 사람의 이름, 부서명, 급여, 직무를 출력하라.

SELECT employees.first_name,departments.department_name,employees.salary,employees.job_id
  2  FROM departments, employees
  3  WHERE employees.job_id IN (SELECT employees.job_id FROM employees WHERE first_name='Adam');

FIRST_NAME
----------------------------------------
DEPARTMENT_NAME                                                  SALARY
------------------------------------------------------------ ----------
JOB_ID
--------------------
Matthew
Payroll                                                            8000
ST_MAN

Matthew
Recruiting                                                         8000
ST_MAN

FIRST_NAME
----------------------------------------
DEPARTMENT_NAME                                                  SALARY
------------------------------------------------------------ ----------
JOB_ID
--------------------

Matthew
Retail Sales                                                       8000
ST_MAN

Matthew
Government Sales                                                   8000
**/


/**
전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
SELECT employees.employee_id, employees.first_name,departments.department_name,employees.hire_date,departments.location_id,employees.salary
FROM departments, employees
WHERE employees.salary > (SELECT AVG(employees.salary) FROM employees);

1377 rows selected.
**/


/**
50번 부서사람들 중에서 30번 부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일을 출력하라.

SELECT employees.job_id,employees.first_name,departments.department_name,employees.hire_date
  2  FROM departments, employees
  3  WHERE employees.department_id = 50 AND employees.job_id IN (SELECT job_id FROM employees WHERE department_id = 30);

no rows selected
**/



/**
급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
SELECT employee_id,first_name,salary
  2  FROM employees
  3  WHERE salary > ANY (SELECT salary FROM employees WHERE department_id=30);

**/