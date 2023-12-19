-- employees 테이블에서 사원들의 모든 업무아이디를 조회하기
SELECT  DISTINCT JOB_ID
FROM EMPLOYEES;

-- 급여를 12,000달러 이상 받는 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;

-- 사원번호가 176번 사원의 아이디와 이름 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- 급여를 12,000달러 이상 15,000달러 이하 받는 사원들의 사원 아이디와 이름과 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000 AND SALARY <= 15000;

-- 2005년 1월 1일부터 2005년 6월 30일 사이에 입사한 사원의 아이디, 이름, 업무아이디, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2005/07/01';

-- 급여가 5,000달러와 12,000달러 사이이고, 부서번호가 20 또는 50인 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000
AND DEPARTMENT_ID IN (20, 30);

-- 관리자가 없는 사원의 이름과 업무아이디를 조회하기
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 커미션을 받는 모든 사원의 이름과 급여, 커미션을 급여 및 커미션의 내림차순으로 정렬해서 조회하기
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- 이름의 2번째 글자가 e인 모든 사원의 이름을 조회하기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 2, 1) = 'e';

-- 업무아이디가 ST_CLERK 또는 SA_REP이고 급여를 2,500달러, 3,500달러, 7,000달러 받는 모든 사원의 이름과 업무아이디, 급여를 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES 
WHERE JOB_ID IN ('ST_CLEKR', 'SA_REP')
AND SALARY IN (2500, 3500, 7000);

-- 모든 사원의 이름과 입사일, 근무 개월 수를 계산하여 조회하기, 근무개월 수는 정수로 반올림하고, 근무개월수를 기준으로 오름차순으로 정렬하기
SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
ORDER BY MONTHS ASC;

-- 사원의 이름과 커미션을 조회하기, 커미션을 받지 않는 사원은 '없음'으로 표시하기
SELECT FIRST_NAME, NVL(TO_CHAR(COMMISSION_PCT), '없음') COMM
FROM EMPLOYEES;

-- 모든 사원의 이름, 부서번호, 부서이름을 조회하기
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- 80번부서에 소속된 사원의 이름과 업무아이디, 업무제목, 부서이름을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 커미션을 받는 모든 사원의 이름과 업무아이디, 업무제목, 부서이름, 부서소재지 도시명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L
WHERE COMMISSION_PCT IS NOT NULL
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);

-- 'Europe'에 소재지를 두고 있는 모든 부서아이디와 부서이름을 조회하기
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE R.REGION_NAME = 'Europe'
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID;

-- 사원의 이름과 소속부서명, 급여, 급여 등급을 조회하기
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, E.SALARY, G.GRADE
FROM EMPLOYEES E, DEPARTMENTS D, SALARY_GRADES G
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- 사원의 이름과 소속부서명, 소속부서의 관리자명을 조회하기, 
-- 소속부서가 없는 사원은 소속부서명 '없음, 관리자명 '없음'으로 표시하기
SELECT E.FIRST_NAME, 
       NVL(D.DEPARTMENT_NAME, '없음'), 
       NVL(M.FIRST_NAME, '없음')
FROM EMPLOYEES E, DEPARTMENTS D, EMPLOYEES M
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.MANAGER_ID = M.EMPLOYEE_ID(+); 

-- 모든 사원의 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- 업무별 급여 최고액, 급여 최저액, 급여 총액, 급여 평균액을 조회하기
SELECT JOB_ID, MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 각 업무별 사원수를 조회해서 가장 사원수가 많은 업무 3개를 조회하기, 업무아이디와 사원수 표시하기
WITH TEMP1 
AS (SELECT JOB_ID, COUNT(*) CNT
    FROM EMPLOYEES
    GROUP BY JOB_ID)
SELECT ROWNUM, JOB_ID, CNT
FROM (SELECT JOB_ID, CNT
      FROM TEMP1
      ORDER BY CNT DESC)
WHERE ROWNUM <= 3;

-- 관리자별 사원수를 조회하기, 관리자 이름과 그 관리자가 관리하는 사원수 표시하기
SELECT B.FIRST_NAME, A.CNT
FROM (SELECT MANAGER_ID, COUNT(*) CNT
      FROM EMPLOYEES
      WHERE MANAGER_ID IS NOT NULL
      GROUP BY MANAGER_ID) A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID;

-- 각 부서에 대해 부서이름, 관리자 이름, 소속사원 수, 소속사원들의 평균 급여를 조회하기
SELECT D.DEPARTMENT_NAME,
       (SELECT E.FIRST_NAME
        FROM EMPLOYEES E
        WHERE E.EMPLOYEE_ID = D.MANAGER_ID) MANAGER_NAME,
       (SELECT COUNT(*)
        FROM EMPLOYEES E
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) CNT,
       (SELECT TRUNC(AVG(E.SALARY)) AVG_SALARY
        FROM EMPLOYEES E
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) AVG_SALARY
FROM DEPARTMENTS D;

-- Steven King과 같은 부서에 속한 사원의 이름과 입사일을 조회하기
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King');

-- 소속 부서의 평균급여보다 많은 급여를 받는 사원의 아이디와 사원이름, 급여, 그 부서의 평균 급여를 조회하기
SELECT E.EMPLOYEE_ID, E.SALARY, A.AVG_SALARY
FROM (SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY)) AVG_SALARY
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID IS NOT NULL
      GROUP BY DEPARTMENT_ID) A, EMPLOYEES E
WHERE A.DEPARTMENT_ID = E.DEPARTMENT_ID
AND A.AVG_SALARY > E.SALARY;

-- Neena 동일한 급여를 받는 모든 사원의 이름과 입사일 급여를 조회하기, 결과에 Kochhar은 포함시키지 않기
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena')
AND FIRST_NAME != 'Neena';

-- 관리자 아이디, 관리자명, 그 관리자가 관리하는 사원수, 그 관리자가 소속된 부서를 조회하기
SELECT employee_id
        , first_name
        , C.cnt
        , D.department_name
FROM employees M, 
        (SELECT manager_id
                 , COUNT(*) cnt
        FROM employees
        WHERE manager_id IS NOT NULL
        GROUP BY manager_id) C,
        departments D
WHERE M.employee_id IN(SELECT DISTINCT manager_id
                                 FROM employees
                                 WHERE manager_id IS NOT NULL)
AND M.employee_id = C.manager_id
AND M.department_id = D.department_id;