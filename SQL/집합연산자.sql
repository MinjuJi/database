/*
집합 연산자
*/

SELECT 컬럼1, 컬럼2, 컬럼3
FROM 테이블1
[WHERE ...]

집합연산자

SELECT 컬럼1, 컬럼2, 컬럼3
FROM 테이블2
[WHERE ...]
[ORDER BY ...]

/* UNION과 UNION ALL*/
-- 커미션을 받는 직원과 커미션을 받지 않는 직원을 모두 조회하기
SELECT employee_id AS emp_id
        , first_name AS emp_name
        , commission_pct AS emp_comm
FROM employees
WHERE commission_pct IS NOT NULL
UNION
SELECT employee_id 
        , first_name
        , NULL
FROM employees
WHERE commission_pct IS NULL;

-- 직종이 변경된 적이 있는 직원과 변경된 적이 없는 직원을 모두 조회하기
-- * 직종이 변경된 적이 없는 직원 정보는 employees 테이블을 전체 조회하는 것으로 대신한다.
SELECT employee_id
        , job_id
        , department_id
        , 'P' AS job_status
FROM job_history
UNION
SELECT employee_id
        , job_id
        , department_id
        , 'C'
FROM employees
ORDER BY employee_id ASC;

/*INTERSECT*/
-- 급여를 5000달러 이하를 받은 직원들 집합과 직종이 변경된 적이 있는 직원들 집합의 교집합 조회하기
-- INTERSECT
SELECT employee_id
FROM employees
WHERE salary <= 5000
INTERSECT
SELECT employee_id
FROM job_history;

-- IN(서브쿼리) 대체
SELECT employee_id
FROM employees
WHERE salary <= 5000
AND employee_id IN(SELECT employee_id
                           FROM job_history);

-- EXISTS(서브쿼리) 대체
SELECT employee_id
        , first_name
        , E.department_id
FROM employees E
WHERE E.salary <= 5000
AND EXISTS (SELECT 1
                 FROM job_history H
                 WHERE H.employee_id = E.employee_id);
                 
/*MINUS*/
-- 직종이 한 번도 변경된 적이 없는 직원정보 조회하기
SELECT employee_id
FROM employees
MINUS
SELECT employee_id
FROM job_history
ORDER BY employee_id;