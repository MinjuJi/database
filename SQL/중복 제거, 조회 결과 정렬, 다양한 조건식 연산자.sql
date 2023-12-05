/*

1. 중복된 행을 제거하고 조회하기

    SELECT 
        DISTINCT 
              컬럼명
            , 컬럼명
            , ...
    FROM 테이블명
    
    * 지정된 컬럼들이 서로 같은 값을 가지는 행이 한 번만 조회된다.
    
2. 조회결과를 정렬하기

    SELECT 컬럼명
        , 컬럼명
        , ...
    FROM 테이블명
    [WHERE 조건식]
    ORDER BY 컬럼명 or 표현식 [ASC|DESC]
        ,  컬럼명 or 표현식 [ASC|DESC]
        
    * ORDER BY절을 사용하면 조회결과를 오름차순 혹은 내림차순으로 정렬할 수 있다,
    * ORDER BY절에 컬럼명이 오면 해당 컬럼의 값을 기준으로 행들을 오름차순 혹은 내림차순으로 정렬한다.
    * 기본 ASC 정렬
    * 여러 컬럼의 값을 기준으로 정렬할 수 있다. 먼저 작성된 코드를 기준으로 정렬
    
3. WHERE 조건식에서 다양한 연산자 사용하기

    1) 비교연산자
            =, !=, >, <, >=, <=
            * [ != ] = [ <> ]
            
    2) 논리연산자
            AND, OR, NOT
            
    3) 기타 연산자
         3-1) WHERE 컬럼명 BETWEEN 값1 AND 값2
             * 컬럼의 값이 값1 이상, 값2 이하인 행을 조회한다.
             
         3-2) WHERE 컬럼명 IN(값1, 값2, 값3)
             * 컬럼의 값이 값1 or 값2 or 값3인 행을 조회한다.
             
         3-3) WHERE 컬럼명 IS (NOT) NULL
             * 컬럼의 값이 NULL인 행을 조회한다.
    
    4) LIKE '패턴'
            패턴문자
            % : 0개 이상의 임의의 문자를 나타낸다.
            _ : 임의의 문자 하나를 나타낸다.
            
            제목이 '자바'로 시작하는 도서 조회
            WHERE BOOK LIKE '자바%'
            * 패턴문자가 문자열 맨 앞에 위치하면 쿼리 성능을 떨어뜨림. 따라서 패턴문자는 문자열 뒷부분에서 사용한다.
            
            성씨가 '김'씨인 고객을 조회
            WHERRE name LIKE '김_%'
*/

-- 직원 테이블에서 직원들이 종사하는 직종 아이디를 조회하기
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 직종변경이력 테이블에서 직종을 한 번이라도 변경한 적이 있는 직원의 아이디를 조회하기
SELECT DISTINCT employee_id
FROM job_history;

-- 직원 테이블에서 직원 아이디, 이름, 급여를 조회하고, 급여순으로 내림차순 정렬해서 조회하기
SELECT employee_id
    , first_name
    , salary
FROM employees
ORDER BY salary;

-- 직원 테이블에서 60번 부서에 소속된 직원들의 아이디, 이름, 급여를 조회하고, 급여순으로 오름차순 정렬해서 조회하기
SELECT employee_id
    , first_name
    , salary
FROM employees
WHERE department_id = 60
ORDER BY salary;

-- 직원 테이블에서 50번 부서에 소속된 직원들의 직원아이디, 이름, 입사일, 급여를 조회하고, 입사일을 기준으로 오름차순 정렬해서 조회하기
SELECT employee_id
    , first_name
    , hire_date
    , salary
FROM employees
WHERE department_id = 50
ORDER BY hire_date ASC;

-- 직원 테이블에서 직원아이디, 이름, 급여, 부서아이디를 조회하고, 부서아이디를 기준으로 오름차순 정렬하고, 
-- 부서아이디가 동일한 직원들은 급여를 기준으로 내림차순 정렬해서 조회하기
SELECT employee_id
    , first_name
    , salary
    , department_id
FROM employees
ORDER BY department_id ASC
    , salary DESC;
    
-- 직원테이블에서 급여가 3000 이상 5000 이하인 직원의 아이디, 이름, 직종아이디, 급여를 조회하고, 급여순으로 오름차순 정렬하기
SELECT employee_id
    , first_name
    , job_id
    , salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000
ORDER BY salary ASC;

-- 직원테이블에서 2005년도에 입사한 직원의 아이디, 이름, 입사일을 조회하고, 입사일순으로 오름차순 정렬하기
SELECT employee_id
    , first_name
    , hire_date
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2005-12-31'
ORDER BY hire_date ASC;

-- 직원테이블에서 소속부서가 10번이거나 20번이거나 30번이고, 급여를 3000 이하로 받는 직원의 아이디, 이름, 급여, 소속부서 아이디를 조회하기
SELECT employee_id
    , first_name
    , salary
    , department_id
FROM employees
WHERE department_id IN(10, 20, 30)
AND salary <= 3000;

-- 부서테이블에서 관리자가 지정되어있지 않는 부서아이디와 부서이름을 조회하기
SELECT department_id
    , department_name
FROM departments
WHERE manager_id IS NULL;

-- 부서테이블에서 관리자가 지정된 부서의 아이디, 부서 이름, 관리자 아이디를 조회하기
SELECT department_id
    , department_name
    , manager_id
FROM departments
WHERE manager_id IS NOT NULL;

-- 직원테이블에서 소속부서가 결정되지 않은 직원의 아이디, 이름, 직종을 조회하기
SELECT employee_id
    , first_name
    , job_id
FROM employees
WHERE department_id IS NULL;

-- 직원테이블에서 직종아이디가 'SA'로 시작하는 직원의 아이디, 이름 직종아이디를 조회하기
SELECT employee_id
    , first_name
    , job_id
FROM employees
WHERE job_id LIKE 'SA%';