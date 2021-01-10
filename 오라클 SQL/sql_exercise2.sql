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
50�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�

SELECT AVG(salary),MAX(salary),MIN(salary),COUNT(*)
  2  FROM employees
  3  WHERE department_id=50;

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
 3475.55556        8200        2100         45
**/





/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.


**/






/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.
**/





/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.
**/





/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.
**/


/**
 �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.

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
�̸��� adam�� ����� �μ����� ����϶�.

SELECT departments.department_name
  2  FROM departments, employees
  3  WHERE employees.department_id = departments.department_id AND employees.first_name='Adam';

DEPARTMENT_NAME
------------------------------------------------------------
Shipping
**/


/**
employees���̺� �ִ� employee_id�� manager_id�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�
'smith'�� �Ŵ����� 'ford'�̴�.


**/



/**
adam�� ������ ���� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.

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
��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.
SELECT employees.employee_id, employees.first_name,departments.department_name,employees.hire_date,departments.location_id,employees.salary
FROM departments, employees
WHERE employees.salary > (SELECT AVG(employees.salary) FROM employees);

1377 rows selected.
**/


/**
50�� �μ������ �߿��� 30�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի����� ����϶�.

SELECT employees.job_id,employees.first_name,departments.department_name,employees.hire_date
  2  FROM departments, employees
  3  WHERE employees.department_id = 50 AND employees.job_id IN (SELECT job_id FROM employees WHERE department_id = 30);

no rows selected
**/



/**
�޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
SELECT employee_id,first_name,salary
  2  FROM employees
  3  WHERE salary > ANY (SELECT salary FROM employees WHERE department_id=30);

**/