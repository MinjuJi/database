/*
내포된 SQL문의 구분
    
    1. 서브쿼리 : WHERE 절이나 HAVING 절에서 조건식에 사용되는 값을 제공하는 SQL문
    2. 인라인뷰 : FROM 절에서 가상의 테이블(가상의 테이블을 뷰라고 함)을 제공하는 SQL문
    3. 스칼라 서브쿼리 : SELECT 절에서 사용되는 서브쿼리다. 보통 값은 하나만 반환
    4. 상호연관 서브쿼리 : 내포된 SQL문에서 메인쿼리의 컬럼을 참조하는 서브쿼리다.

서브쿼리(Sub Query)
    
    - SELECT문 내부에 소괄호에 묶여 정의된 SELECT문을 서브쿼리라고 한다.
    - 서브쿼리는 WHERE 절의 조건식에서 사용되는 값을 제공한다.
    - 서브 쿼리의 실행결과가 메인 쿼리의 조건식에서 사용된다.
    - 메인 쿼리보다 먼저 실행된다. 
    
    형식
        SELECT 컬럼, 컬럼
        FROM 테이블명
        WHERE 조건식 연산자 (SELECT 컬럼
                                    FROM 테이블명
                                    WHERE 조건식)
*/

-- 전체 직원의 평균급여보다 급여를 많이 맏는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                      FROM employees);
                      
-- B등급의 최고급여보다 급여를 적게 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT employee_id
        , first_name
        , salary
FROM employees
WHERE salary < (SELECT max_salary
                      FROM salary_grades
                      WHERE grade = 'B');
                      
-- 60번 부서의 직원과 같은 해에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
SELECT employee_id
        , first_name
        , hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN (SELECT DISTINCT TO_CHAR(hire_date, 'YYYY')
                                                FROM employees
                                                WHERE department_id = 60);