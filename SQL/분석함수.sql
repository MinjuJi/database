/*
분석함수
*/

-- 80번 부서에 소속된 직원들을 급여를 기준으로 랭킬을 부여해서 조회하기
SELECT RANK() OVER (ORDER BY salary DESC) RANKING, first_name, salary
FROM employees
WHERE department_id = 80;

-- 80번 부서에 소속된 직원들을 급여를 기준으로 랭킹을 부여해서 조회하기
-- 단, 직종별로 구분해서 순위를 부여한다.
SELECT RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) AS rankings
                            , first_name
                            , job_id
                            , salary
FROM employees
WHERE department_id = 80;

-- 80번 부서에 소속된 직원들의 급여를 기준으로 랭킹을 부여해서 조회하기
SELECT first_name
        , salary
        , RANK() OVER (ORDER BY salary desc) AS r1
        , DENSE_RANK() OVER (ORDER BY salary desc) AS r2
FROM employees
WHERE department_id = 80;

-- 80번 부서에 소속된 직원들의 급여를 기준으로 순번을 부여해서 조회하기
SELECT first_name
        , salary
        , ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
FROM employees
WHERE department_id = 80;

-- 80번 부서에 소속된 직원들을 급여를 기준으로 순번을 부여했을 때 1번 ~ 10번 범위내의 직원정보를 조회하기
SELECT rn
        , first_name
        , salary
FROM (SELECT ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
                   , first_name
                   , salary
        FROM employees)
WHERE rn >= 11 AND rn <= 20;

-- 
SELECT first_name
        , salary
        , department_id
        , SUM(salary) OVER (PARTITION BY department_id) AS dept_sum
FROM employees
ORDER BY employee_id;
        