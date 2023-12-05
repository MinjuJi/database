-- 부서테이블의 모든 부서 정보를 조회하기
SELECT department_id, department_name, manager_id, location_id
FROM departments;

-- 부서테이블에서 소재지아이디가 1700번인 부서 정보 조회하기
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE location_id = 1700;

-- 100번 직원이 관리하는 부서정보 조회하기
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE manager_id = 100;

-- 부서명이 'IT'인 부서의 정보 조회하기
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE department_name = 'IT';
    
-- 소재지아이디가 1700번인 지역의 주소, 우편번호, 도시명, 국가코드를 조회하기
SELECT street_address
    , postal_code
    , city
    , locations.country_id
FROM locations
WHERE location_id = 1700;
    
-- 최소급여가 2000이상 5000이하인 직종의 직종아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT job_id
    , job_title
    , min_salary
    , max_salary
FROM jobs
WHERE min_salary >= 2000 AND min_salary <=5000;

-- 최대급여가 20000불을 초과하는 직종의 아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT job_id
    , job_title
    , min_salary
    , max_salary
FROM jobs
WHERE max_salary >= 20000;
    
-- 100번 직원에게 보고하는 직원의 아이디, 이름, 부서아이디을 조회하기
SELECT employee_id
    , first_name
    , department_id
FROM employees
WHERE employee_id = 100;
    
-- 80번 부서에서 근무하고 급여를 8000불 이상 받는 직원의 아이디, 이름, 급여, 커미션포인트 조회하기
SELECT employee_id
    , first_name
    , salary
    , commission_pct
FROM employees
WHERE department_id = 80 AND salary >= 8000;
    
-- 직종아이디가 SA_REP이고, 커미션포인트가 0.25이상인 직원의 아이디, 이름, 급여, 커미션포인트를 조회하기
SELECT employee_id
    , first_name
    , salary
    , commission_pct
FROM employees
WHERE job_id = 'SA_REP' 
AND commission_pct >= 0.25;
    
-- 80번 부서에 근무하고, 급여가 10000불 이상인 직원의 아이디, 이름, 급여, 연봉을 조회하기
-- 연봉 = (급여 + 급여x커미션)x12다
SELECT employee_id
    , first_name
    , salary
    , (salary + ( salary*commission_pct))*12
FROM employees
WHERE department_id = 80 
AND salary >= 10000;
    
-- 80번 부서에 근무하고, 147번 직원에게 보고하는 사원 중에서 커미션이 0.1인 직원의 아이디, 이름, 직종, 급여, 커미션포인트를 조회하기
SELECT employee_id
    , first_name
    , job_id
    , salary
    , commission_pct
FROM employees
WHERE department_id = 80 
AND manager_id = 147 
AND commission_pct =0.1;