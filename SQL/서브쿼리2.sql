-- <단일 행 서브쿼리>
-- 101번 사원에게 보고 받는 상사와 같은 상사에게 보고하는 직원의 아이디, 이름을 조회하기
SELECT employee_id
        , first_name
FROM employees
WHERE manager_id = (SELECT manager_id
                            FROM employees
                            WHERE employee_id  = 101);

-- 101번 사원보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary > (SELECT salary
                      FROM employees
                      WHERE employee_id  = 101);


-- <다중 행 서브쿼리>
-- 'Steven'과 같은 해에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT employee_id
        , first_name
        , hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT TO_CHAR(hire_date, 'YYYY')
                                                FROM employees
                                                WHERE first_name = 'Steven');

-- 60번 부서에 소속된 직원들의 급여보다 급여를 많이 받는 직원들의 아이디, 이름, 급여를 조회하기
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary > ALL (SELECT salary
                           FROM employees
                           WHERE department_id = 60);
                           
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary > ANY (SELECT salary
                           FROM employees
                           WHERE department_id = 60);


-- <다중 열 서브쿼리>
-- 각 부서별 최저급여를 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id
                                                    , MIN(salary)
                                            FROM employees
                                            WHERE department_id IS NOT NULL
                                            GROUP BY department_id);

-- <상호연관 서브쿼리>
-- 직원들 중에서 자신이 소속된 부서의 평균급여보다 급여를 많이 받는 사원의 아이디, 이름, 급여를 조회하기
 SELECT X.employee_id
        , X.first_name
        , X.salary
FROM employees X
WHERE X.salary > (SELECT AVG(Y.salary)
                        FROM employees Y
                        WHERE Y.department_id = X.department_id);

-- 부서 아이디, 부서 이름, 해당 부서에 소속된 직원수를 조회하기
SELECT department_id
        , department_name
        , (SELECT COUNT(*)
          FROM employees Y
          WHERE Y.department_id = X.department_id) AS CNT
FROM departments X;

-- 직원아이디, 직원이름, 상사의 아이디, 상사의 이름을 조회하기
SELECT X.employee_id AS emp_id
        , X.first_name AS emp_name
        , X.manager_id AS mgr_id
        , (SELECT Y.first_name
          FROM employees Y
          WHERE y.employee_id = x.manager_id) AS mgr_name
FROM employees X;

