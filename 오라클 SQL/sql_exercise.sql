/**********************************************************
*	SQL Query & Function Example1
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

--�μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�

 SELECT employee_id,first_name, salary
  2  FROM Employees
  3  WHERE department_id=10;

EMPLOYEE_ID FIRST_NAME                                   SALARY
----------- ---------------------------------------- ----------
        200 Jennifer                                       4400

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ� ��ȣ�� ����϶�.

SELECT first_name,hire_date, department_id
  2  FROM Employees
  3  WHERE employee_id = 7369;

no rows selected
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�̸��� Ellen�� ����� ��� ������ ����϶�.

 SELECT *
  2  FROM Employees
  3  WHERE first_name='Ellen';

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�Ի����� 08/04/21�� ����� �̸�, �μ���ȣ, ������ ����϶�.
select ename �̸�, deptno �μ���ȣ, sal ����

SELECT first_name as ename, Department_id as deptno, salary as sal
  2  FROM Employees
  3  WHERE hire_date='08/04/21'

FIRST_NAME                               DEPARTMENT_ID     SALARY
---------------------------------------- ------------- ----------
Amit                                                80       6200
Sundita                                             80       6100

------------------------------------------------------------------------------
------------------------------------------------------------------------------


--������ SA_MAN �ƴ� ����� ��� ������ ����϶�.

 SELECT *
  2  FROM Employees
  3  WHERE job_id !='SA_MAN';

102 rows selected.

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�Ի����� 08/04/21 ���Ŀ� �Ի��� ����� ������ ����϶�.

SELECT employee_id
  2  FROM employees
  3  WHERE hire_date < '08/04/21';

105 rows seleted
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�μ���ȣ�� 20,30���� ������ ��� ����� �̸�, �����ȣ, �μ���ȣ�� ����϶�.

SELECT first_name,employee_id,department_id
  2  FROM employees
  3  WHERE department_id !=20 OR department_id!=30;

106 rows selected.
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT first_name,employee_id,department_id, hire_date
  2  FROM employees
  3  WHERE first_name LIKE 'S%';

FIRST_NAME                               EMPLOYEE_ID DEPARTMENT_ID HIRE_DAT
---------------------------------------- ----------- ------------- --------
Sundar                                           166            80 08/03/24
Shelli                                           116            30 05/12/24
Sarah                                            192            50 04/02/04
Shelley                                          205           110 02/06/07
Steven                                           100            90 03/06/17
Sundita                                          173            80 08/04/21
Steven                                           128            50 08/03/08
Susan                                            203            40 02/06/07
Samuel                                           194            50 06/07/01
Sarath                                           161            80 06/11/03
Stephen                                          138            50 05/10/26

FIRST_NAME                               EMPLOYEE_ID DEPARTMENT_ID HIRE_DAT
---------------------------------------- ----------- ------------- --------
Sigal                                            117            30 05/07/24
Shanta                                           123            50 05/10/10

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--�̸��� s�� �����ϰ� ������ ���ڰ� t�� ����� ������ ����϶�.

SELECT first_name
  2  FROM employees
  3  WHERE first_name LIKE 'S%h';

FIRST_NAME
----------------------------------------
Sarah
Sarath

------------------------------------------------------------------------------
------------------------------------------------------------------------------
/**
employees ���̺��� �̸�, �޿�, ��, �Ѿ��� ���Ͽ� �Ѿ� ���� ������ ����϶� �� �󿩱��� NULL�� ����� ����

SELECT first_name, salary, commission_pct, salary+commission_pct*salary as total
  2  FROM employees
  3  ORDER BY (total) DESC;

*/




/**
10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�.
SELECT salary , first_name, department_id, salary*0.13 as bonus
  2  FROM employees
  3  WHERE department_id=10;

    SALARY FIRST_NAME                               DEPARTMENT_ID      BONUS
---------- ---------------------------------------- ------------- ----------
      4400 Jennifer                                            10        572
**/



/**
30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�. �� ������ �޿��� 150%�� ���ʽ��� �����Ѵ�.
   -- ���� = sal*12+(sal*1.5)
SELECT salary, first_name, department_id, salary*12+salary*1.5 as annual
  2  FROM employees
  3  WHERE department_id=30;

    SALARY FIRST_NAME                               DEPARTMENT_ID     ANNUAL
---------- ---------------------------------------- ------------- ----------
     11000 Den                                                 30     148500
      3100 Alexander                                           30      41850
      2900 Shelli                                              30      39150
      2800 Sigal                                               30      37800
      2600 Guy                                                 30      35100
      2500 Karen                                               30      33750
**/




/**
�μ���ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�. �� 1���� �ٹ��ϼ��� 12���̰� 1�� �ٹ��ð��� 5�ð��̴�.
��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)�� ����϶�.
   -- �ñ� = sal/�ϼ�/�ð�  -> sal/ 12/5 
   -- round(m, n) m�� �Ҽ��� n�ڸ����� �ݿø� 

SELECT first_name, salary, round(salary/12/15,1)
  2  FROM Employees
  3  WHERE department_id=20;

FIRST_NAME                                   SALARY ROUND(SALARY/12/15,1)
---------------------------------------- ---------- ---------------------
Michael                                       13000                  72.2
Pat                                            6000                  33.3

**/




/**
�޿��� 1500���� 3000������ ����� �޿��� 5%�� ȸ��� �����ϱ�� �Ͽ���. �̸� �̸�, �޿�, ȸ��(-2�ڸ����� �ݿø�)�� ����϶�.
	-- ȸ��  = sal * 0.05	
	-- -2�ڸ����� �ݿø� : ���� 2��° �ڸ����� �ݿø�.. 100������  
 SELECT first_name, salary, round(salary*0.05,2)
  2  FROM employees
  3  WHERE salary BETWEEN 1500 AND 3000;

FIRST_NAME                                   SALARY ROUND(SALARY*0.05,2)
---------------------------------------- ---------- --------------------
Shelli                                         2900                  145
Sigal                                          2800                  140
Guy                                            2600                  130
Karen                                          2500                  125
Irene                                          2700                  135
James                                          2400                  120
Steven                                         2200                  110
Mozhe                                          2800                  140
James                                          2500                  125
TJ                                             2100                  105
Michael                                        2900                  145

FIRST_NAME                                   SALARY ROUND(SALARY*0.05,2)
---------------------------------------- ---------- --------------------
Ki                                             2400                  120
Hazel                                          2200                  110
John                                           2700                  135
Joshua                                         2500                  125
Randall                                        2600                  130
Peter                                          2500                  125
Martha                                         2500                  125
Girard                                         2800                  140
Anthony                                        3000                  150
Timothy                                        2900                  145
Randall                                        2500                  125

FIRST_NAME                                   SALARY ROUND(SALARY*0.05,2)
---------------------------------------- ---------- --------------------
Vance                                          2800                  140
Kevin                                          3000                  150
Donald                                         2600                  130
Douglas                                        2600                  130

**/





/**
�Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�. �μ���ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ�����������), �ٹ����,
 �ٹ�����(30�� ����)�� ����϶�.
	-- ���� ��¥ : sysdate 
	-- �ٹ� �ϼ� : ���糯¥ - �Ի��� = sysdate - hire_date  -> ��¥ - ��¥ : �ϼ� ����
	-- �ٹ� ��� : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
	-- �ٹ� ���� : �ٹ��ϼ� / 1��(30��)

SELECT department_id,first_name,hire_date,sysdate, sysdate-hire_date as, to_char(sysdate,'YYYY')-to_char(hire_date,'YYYY'), (sysdate-hire_date)/30
  2  FROM employees
  3  WHERE first_name LIKE 'D%';

DEPARTMENT_ID FIRST_NAME                               HIRE_DAT SYSDATE
------------- ---------------------------------------- -------- --------
SYSDATE-HIRE_DATEAS TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(HIRE_DATE,'YYYY')
------------------- -------------------------------------------------
(SYSDATE-HIRE_DATE)/30
----------------------
           60 David                                    05/06/25 21/01/10
         5678.57226                                                16
            189.285742

           80 David                                    05/03/24 21/01/10
         5771.57226                                                16
            192.385742
**/







/**
�Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ��� ����϶�.
--round(sysdate-hiredate,0) �ٹ��ϼ�

SELECT first_name, hire_date, round(sysdate-hire_date,0)
  2  FROM employees
  3  WHERE first_name LIKE 'D%';

FIRST_NAME                               HIRE_DAT ROUND(SYSDATE-HIRE_DATE,0)
---------------------------------------- -------- --------------------------
David                                    05/06/25                       5679
David                                    05/03/24                       5772
Daniel                                   02/08/16                       6723
Douglas                                  08/01/13                       4747
Danielle                                 07/03/19                       5047
David                                    08/02/23                       4706
Diana                                    07/02/07                       5087
Donald                                   07/06/21                       4953
Den                                      02/12/07                       6610

**/



/**
�Ի����� 2012�� 7�� 5���� ���·� �̸�, �Ի����� ����϶�.
	-- ��¥ ���� �տ� fm �� ���� '0'�� ǥ������ �ʴ´ٴ� G��.. 
	-- 'fmYYYY"��" MM"��" DD"��' 

SELECT to_char(hire_date,'fmYYYY-MM-DD'), first_name
  2  FROM employees
  3  WHERE first_name LIKE 'D%';

TO_CHAR(HIRE_DATE,'F FIRST_NAME
-------------------- ----------------------------------------
2005-6-25            David
2005-3-24            David
2002-8-16            Daniel
2008-1-13            Douglas
2007-3-19            Danielle
2008-2-23            David
2007-2-7             Diana
2007-6-21            Donald
2002-12-7            Den
**/




/**
�̸�(first_name)�� ���ڼ��� 6���̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
	-- substr(str, position, length) : str ���ڸ� positin ���� length���� ��ŭ ǥ��
	-- lower(str)  �ҹ��� ��ȯ
	-- length(str)  str�� ����

 SELECT lower(substr(first_name,0,3))
  2  FROM employees
  3  WHERE length(first_name) >5;

**/






/**
10�� �μ� ������ ��դ� �ְ�, ����, �ο����� ���Ͽ� ����϶�

SELECT AVG(salary), MAX(salary), MIN(salary),COUNT(*)
  2  FROM Employees
  3  WHERE department_id=80;

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
 8955.88235       14000        6100         34
**/





/**
�� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.

SELECT AVG(salary), MAX(salary), MIN(salary),COUNT(*)
  2  FROM Employees
  3  GROUP BY Department_id
  4  ;

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
 8601.33333       12008        6900          6
       4150       11000        2500          6
       7000        7000        7000          1
 19333.3333       24000       17000          3
       9500       13000        6000          2
      10000       10000       10000          1
      10154       12008        8300          2
 3475.55556        8200        2100         45
 8955.88235       14000        6100         34
       6500        6500        6500          1
       5760        9000        4200          5

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
       4400        4400        4400          1
**/






/**
�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.

SELECT department_id,job_id,COUNT(*)
  2  FROM employees as e, employees as d
  3  GROUP BY department_id
  4  HAVING e.job_id=d.job_id;
**/



/**
���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.

 SELECT job_id,COUNT(*)
  2  FROM employees
  3  GROUP BY job_id
  4  HAVING COUNT(*) >3;

JOB_ID                 COUNT(*)
-------------------- ----------
FI_ACCOUNT                    5
IT_PROG                       5
PU_CLERK                      5
SA_MAN                        5
SA_REP                       30
SH_CLERK                     20
ST_CLERK                     20
ST_MAN                        5
**/





/**
�� �μ��� ��տ���, ��ü����, �ְ����, ��������,�� ���Ͽ� ��տ����� ���������� ����϶�.

SELECT AVG(salary), SUM(salary), MAX(salary), MIN(salary)
  2  FROM employees
  3  GROUP BY department_id
  4  ORDER BY AVG(salary) DESC;

AVG(SALARY) SUM(SALARY) MAX(SALARY) MIN(SALARY)
----------- ----------- ----------- -----------
 19333.3333       58000       24000       17000
      10154       20308       12008        8300
      10000       10000       10000       10000
       9500       19000       13000        6000
 8955.88235      304500       14000        6100
 8601.33333       51608       12008        6900
       7000        7000        7000        7000
       6500        6500        6500        6500
       5760       28800        9000        4200
       4400        4400        4400        4400
       4150       24900       11000        2500

AVG(SALARY) SUM(SALARY) MAX(SALARY) MIN(SALARY)
----------- ----------- ----------- -----------
 3475.55556      156400        8200        2100

**/




