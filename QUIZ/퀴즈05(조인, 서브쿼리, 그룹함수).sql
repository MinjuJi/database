-- 모든 직원의 아이디, 이름, 부서번호, 부서명을 조회하기(등가조인)
SELECT E.employee_id, E.first_name, E.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_ID = D.department_id(+);

-- 커미션을 받는 직원의 아이디, 이름, 직종아이디, 급여, 커미션을 조회하기
SELECT employee_id, first_name, job_id, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- 커미션을 받는 직원의 아이디, 이름, 급여, 커미션, 급여등급을 조회하기(비등가조인)
SELECT E.employee_id, E.first_name, E.salary, E.commission_pct, G.grade
FROM employees E, salary_grades G
WHERE E.commission_pct IS NOT NULL
AND E.salary >= G.min_salary
AND E.salary <= G.max_salary;

-- 80번 부서에 소속된 직원들의 평균급여, 최저급여, 직종 최고급여를 조회하기(그룹함수)
SELECT TRUNC(AVG(salary)) AS avg_salary
        , MIN(salary) AS min_salary
        , MAX(salary) AS max_salary
FROM employees
WHERE department_id = 80;

-- 80번 부서에 소속된 직원들의 직원아이디, 이름, 직종제목, 급여, 직종 최고급여와 급여간의 차이를 조회하기(등가조인)
SELECT E.employee_id
        , E.first_name
        , J.job_title
        , E.salary
        , J.max_salary - E.salary AS salary_gap
FROM employees E, jobs J
WHERE E.department_id = 80 
AND E.job_id = J.job_id;

-- 각 부서별 최고급여, 최저급여, 최고급여와 최저급여의 차이를 조회하기(GROUP BY)
-- 1) v1 - GROUP BY
SELECT department_id 
        , MAX(salary)
        , MIN(salary)
        , MAX(salary) - MIN(salary)
FROM employees
WHERE department_id  IS NOT NULL
GROUP BY department_id;

-- 2) v2 - 서브쿼리
SELECT department_id
        , max_salary
        , min_salary
        , max_salary - min_salary
FROM(SELECT department_id 
                , MAX(salary) AS max_salary
                , MIN(salary) AS min_salary
                , MAX(salary) - MIN(salary)
        FROM employees
        WHERE department_id  IS NOT NULL
        GROUP BY department_id);

-- 'Executive' 부서의 모든 직원아이디, 이름, 직종아이디를 조회하기(서브쿼리 혹은 조인)
-- 1) v1 - 서브쿼리
SELECT employee_id, first_name, job_id
FROM employees
WHERE department_id IN(SELECT department_id
                                FROM departments
                                WHERE department_name = 'Executive')
                                ;
--2) v2 - 조인
SELECT E.employee_id
        , E.first_name
        , E.job_id
FROM employees E, departments D
WHERE D.department_name = 'Executive'
AND E.department_id = D.department_id;

-- 전체 직원의 평균급여보다 급여를 적게 받는 직원의 아이디, 이름, 급여를 조회하기(서브쿼리)
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary < (SELECT AVG(salary)
                      FROM employees);

-- 'Ismael'과 같은 해에 입사했고, 같은 부서에 근무하고 있는 직원의 아이디, 이름, 입사일을 조회하기(서브쿼리)
-- 1) v1 - 서브쿼리
SELECT employee_id
        , first_name
        , hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = (SELECT TO_CHAR(hire_date, 'YYYY')
                                                FROM employees
                                                WHERE first_name = 'Ismael')
AND department_id = (SELECT department_id
                            FROM employees
                            WHERE first_name = 'Ismael');

--2) v2 - 다중열 서브쿼리
SELECT employee_id, first_name, hire_date
FROM employees
WHERE (department_id, TO_CHAR(hire_date,'YYYY')) IN(SELECT department_id, TO_CHAR(hire_date,'YYYY')
                                                                FROM employees
                                                                WHERE first_name = 'Ismael');

-- 부서별 최고급여를 조회했을 때 최고급여가 15000을 넘는 부서의 아이디와 최고급여를 조회하기(GROUP BY, HAVING)
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 15000;

-- 'Neena'보다 급여을 많이 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기(서브쿼리)
SELECT employee_id
        , first_name
        , job_id, salary
FROM employees  
WHERE salary > (SELECT salary
                      FROM employees
                      WHERE first_name = 'Neena');

-- 급여등급별로 직원수를 조회하기(비등가조인, GROUP BY)
SELECT G.grade
        , COUNT(*)
FROM employees E, salary_grades G
WHERE E.salary >= G.min_salary
AND E.salary <= G.max_salary
GROUP BY G.grade;

-- 부서별 평균급여를 계산했을 그 부서의 평균급여보다 급여를 적게 받는 직원의 아이디, 이름, 급여, 부서명을 조회하기(인라인뷰, 조인)
SELECT B.employee_id
        , B.first_name
        , B.salary
        , C.department_name
FROM(SELECT department_id, AVG(salary) AS avg_salary
         FROM employees
         WHERE department_id IS NOT NULL
         GROUP BY department_id) A, employees B, departments C
WHERE A.department_id = B.department_id
AND A.avg_salary > B.salary
AND B.department_id = C.department_id;

-- 'Ismael' 직원이 근무하는 부서의 아이디와 이름을 조회하기(서브쿼리)
--1) v1 - 조인
SELECT B.department_id
        , B.department_name
FROM employees A, departments B
WHERE A.first_name = 'Ismael'
AND A.department_id = B.department_id;

--2) v2 - 서브쿼리
SELECT department_id
        , department_name
FROM departments
WHERE department_id IN (SELECT department_id
                                 FROM employees
                                 WHERE first_name = 'Ismael');
                                 
-- 'Neena'에게 보고하는 직원의 아이디와 이름을 조회하기(서브쿼리)
SELECT employee_id
        , first_name
FROM employees
WHERE manager_id = (SELECT employee_id
                             FROM employees
                             WHERE first_name = 'Neena');

-- 부서별 평균급여를 계산했을 때 'Ismael'이 근무하는 부서의 평균급여보다 급여를 
-- 많이 받는 부서의 부서아이디와 평균급여를 조회하기(GROUP BY, 인라인뷰, 서브쿼리)
SELECT department_id, AVG(salary) avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >  (SELECT AVG(salary)
                                 FROM employees
                                 WHERE department_id = (SELECT department_id
                                                                    FROM employees
                                                                    WHERE first_name = 'Ismael'));
