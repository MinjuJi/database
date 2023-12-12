/*
<다중행 함수(그룹 함수)>

주의사항
    1. 다중행 함수는 WHERE 절에 사용할 수 없다.
    2. 다중행 함수와 일반 컬럼명을 SELECT 절에 같이 적을 수 없다.
        단, GROUP BY 절에 사용한 컬럼명은 SELECT 절에 적을 수 있다.
        조회되는 행들의 개수가 다르면 오류 발생
    3.  다중행 함수 중첩 사용은 한 번만 허용된다.
    
그룹함수 실행결과 필터링
    HAVING : 그룹함수적용결과를 필터링하는 조건식. GROUP BY 절 다음에 작성
*/

-- 직원 테이블에서 부서아이디가 같은 것끼리 그룹화 시켰다.
SELECT department_id,
COUNT(*) AS 부서개수
FROM employees
GROUP BY department_id;

-- 커미션을 받는 직원의 수를 조회하기
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

-- 60번 부서의 평균 급여를 조회하기
SELECT AVG(salary)
FROM employees
WHERE department_id = 60;

-- 80번 부서에 소속된 직원의 급여 총합계, 평균급여, 최소급여, 최대급여를 조회하기
SELECT SUM(salary)
    , TRUNC(AVG(salary))
    , MIN(salary)
    , MAX(salary)
FROM employees
WHERE department_id = 80;

-- 직원들이 종사하고 있는 직종아이디를 중복을 제외한 행의 개수를 조회하기
SELECT COUNT(DISTINCT job_id)
FROM employees;

-- 직종별 사원수를 조회하기
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- 부서별 사원수를 조회하기
SELECT D.department_name
        , COUNT(*)
FROM employees E, departments D
GROUP BY D.department_name;

-- 근무지별 사원수 조회하기
SELECT L.city
        , COUNT(*)
FROM employees E, departments D, locations L
WHERE E.department_id = D.department_id
AND D.location_id = L.location_id
GROUP BY l.city;

-- 입사년도별 사원수를 조회하기
SELECT TO_CHAR(hire_date, 'YYYY')
        , COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

-- 부서별, 입사년도별 사원수를 조회하기
SELECT department_id,
        TO_CHAR(hire_date, 'YYYY'),
        COUNT(*)
FROM employees
GROUP BY department_id,
            TO_CHAR(hire_date, 'YYYY')
ORDER BY 1 ASC, 2 ASC;

-- 부서별 직원수를 조회했을 때 직원수가 10명 이상인 부서의 아이디와 직원수를 조회하기
SELECT department_id
        , COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 10;

-- 2005년 이전에 입사한 직원들을 부서별로 직원수를 조회했을 때 직원수가 5명 이상인 부서아이디와 직원수를 조회하기
SELECT department_id,
        COUNT(*)
FROM employees
WHERE hire_date < '2005-01-01'
GROUP BY department_id
HAVING COUNT(*) >= 5;

