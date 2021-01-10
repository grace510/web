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

--부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라

 SELECT employee_id,first_name, salary
  2  FROM Employees
  3  WHERE department_id=10;

EMPLOYEE_ID FIRST_NAME                                   SALARY
----------- ---------------------------------------- ----------
        200 Jennifer                                       4400

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--사원번호가 7369인 사람 중 이름, 입사일, 부서 번호를 출력하라.

SELECT first_name,hire_date, department_id
  2  FROM Employees
  3  WHERE employee_id = 7369;

no rows selected
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--이름이 Ellen인 사람의 모든 정보를 출력하라.

 SELECT *
  2  FROM Employees
  3  WHERE first_name='Ellen';

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--입사일이 08/04/21인 사원의 이름, 부서번호, 월급을 출력하라.
select ename 이름, deptno 부서번호, sal 월급

SELECT first_name as ename, Department_id as deptno, salary as sal
  2  FROM Employees
  3  WHERE hire_date='08/04/21'

FIRST_NAME                               DEPARTMENT_ID     SALARY
---------------------------------------- ------------- ----------
Amit                                                80       6200
Sundita                                             80       6100

------------------------------------------------------------------------------
------------------------------------------------------------------------------


--직무가 SA_MAN 아닌 사람의 모든 정보를 출력하라.

 SELECT *
  2  FROM Employees
  3  WHERE job_id !='SA_MAN';

102 rows selected.

------------------------------------------------------------------------------
------------------------------------------------------------------------------

--입사일이 08/04/21 이후에 입사한 사원의 정보를 출력하라.

SELECT employee_id
  2  FROM employees
  3  WHERE hire_date < '08/04/21';

105 rows seleted
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--부서번호와 20,30번을 제외한 모든 사람의 이름, 사원번호, 부서번호를 출력하라.

SELECT first_name,employee_id,department_id
  2  FROM employees
  3  WHERE department_id !=20 OR department_id!=30;

106 rows selected.
------------------------------------------------------------------------------
------------------------------------------------------------------------------

--이름이 S로 시작하는 사원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
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

--이름이 s로 시작하고 마지막 글자가 t인 사람이 정보를 출력하라.

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
employees 테이블에서 이름, 급여, 상여, 총액을 구하여 총액 많은 순서로 출력하라 단 상여금이 NULL인 사람은 제외

SELECT first_name, salary, commission_pct, salary+commission_pct*salary as total
  2  FROM employees
  3  ORDER BY (total) DESC;

*/




/**
10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라.
SELECT salary , first_name, department_id, salary*0.13 as bonus
  2  FROM employees
  3  WHERE department_id=10;

    SALARY FIRST_NAME                               DEPARTMENT_ID      BONUS
---------- ---------------------------------------- ------------- ----------
      4400 Jennifer                                            10        572
**/



/**
30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하라. 단 연말에 급여의 150%를 보너스로 지급한다.
   -- 연봉 = sal*12+(sal*1.5)
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
부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라. 단 1달의 근무일수는 12일이고 1일 근무시간은 5시간이다.
출력양식은 이름, 급여, 시간당 임금(소수이하 1번째 자리에서 반올림)을 출력하라.
   -- 시급 = sal/일수/시간  -> sal/ 12/5 
   -- round(m, n) m을 소수점 n자리에서 반올림 

SELECT first_name, salary, round(salary/12/15,1)
  2  FROM Employees
  3  WHERE department_id=20;

FIRST_NAME                                   SALARY ROUND(SALARY/12/15,1)
---------------------------------------- ---------- ---------------------
Michael                                       13000                  72.2
Pat                                            6000                  33.3

**/




/**
급여가 1500부터 3000사이의 사람은 급여의 5%를 회비로 지불하기로 하였다. 이를 이름, 급여, 회비(-2자리에서 반올림)를 출력하라.
	-- 회비  = sal * 0.05	
	-- -2자리에서 반올림 : 정수 2번째 자리에서 반올림.. 100단위로  
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
입사일부터 지금까지의 날짜수를 출력하라. 부서번호, 이름, 입사일, 현재일, 근무일수(소수점이하절삭), 근무년수,
 근무월수(30일 기준)를 출력하라.
	-- 지금 날짜 : sysdate 
	-- 근무 일수 : 현재날짜 - 입사일 = sysdate - hire_date  -> 날짜 - 날짜 : 일수 나옴
	-- 근무 년수 : to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')
	-- 근무 월수 : 근무일수 / 1달(30일)

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
입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 출력하라.
--round(sysdate-hiredate,0) 근무일수

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
입사일을 2012년 7월 5일의 형태로 이름, 입사일을 출력하라.
	-- 날짜 형시 앞에 fm 은 선행 '0'을 표현하지 않는다는 G뜻.. 
	-- 'fmYYYY"년" MM"월" DD"일' 

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
이름(first_name)의 글자수가 6자이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 이름만을 출력하라.
	-- substr(str, position, length) : str 문자를 positin 부터 length길이 만큼 표현
	-- lower(str)  소문자 변환
	-- length(str)  str의 길이

 SELECT lower(substr(first_name,0,3))
  2  FROM employees
  3  WHERE length(first_name) >5;

**/






/**
10번 부서 월급의 평균ㅡ 최고, 최저, 인원수를 구하여 출력하라

SELECT AVG(salary), MAX(salary), MIN(salary),COUNT(*)
  2  FROM Employees
  3  WHERE department_id=80;

AVG(SALARY) MAX(SALARY) MIN(SALARY)   COUNT(*)
----------- ----------- ----------- ----------
 8955.88235       14000        6100         34
**/





/**
각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.

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
각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.

SELECT department_id,job_id,COUNT(*)
  2  FROM employees as e, employees as d
  3  GROUP BY department_id
  4  HAVING e.job_id=d.job_id;
**/



/**
같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.

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
각 부서별 평균월급, 전체월급, 최고월급, 최저월급,을 구하여 평균월급이 많은순으로 출력하라.

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




