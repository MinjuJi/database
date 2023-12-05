/*
    1. 테이블의 데이터 조회
        SELECT 컬럼명, 컬럼명, ... FROM 테이블명; // 부분조회
        SELECT * FROM 테이블명; // 전체 조회
    
    2. select절에서 사칙연산 수행
        select 컬럼명*숫자, 컬럼명*컬럼명 from 테이블명;
        * 사칙연산에 사용되는 컬럼은 해당 컬럼의 값이 숫자값이어야 한다.
    
    3. 열에 별칭 부여하기
        1) select 컬럼명 as 별칭, 컬럼명 as 별칭, ... form 테이블명;
        2) slect 컬럼명 별칭, 컬럼명 별칭, ... from 테이블명;
        
    4. 데이터 필터링 하기
        1) where절에 조건식을 작성해서 해당 조건식을 만족시키는 행만 조회하기
            select 컬럼명, 컬럼명, 컬럼명, ... from 테이블명 where 조건식;
        
        2) where절에서 2개 이상의 조건식으로 데이터를 필터링할 수 있다.
            - 2개 이상의 조건식을 작성할 때는 and, or, not 논리 연산자를 사용한다.
                * select 컬럼명, 컬럼명, ... form 테이블명 where 조건식1 and 조건식2;
                * select 컬럼명, 컬럼명, ... form 테이블명 where 조건식1 or 조건식2;
                * select 컬럼명, 컬럼명, ... form 테이블명 where 조건식1 and (조건식2 or 조건식3);
                 
*/

-- 지역 테이블의 모든 행, 모든 열 조회하기
SELECT* FROM regions;

-- 국가 테이블의 모든 행, 모든 열 조회하기
SELECT* FROM countries;

-- 직종 테이블의 모든 행, 모든 열 조회하기
SELECT* FROM jobs;

-- 부서 테이블의 모든 행, 모든 열 조회하기
SELECT * FROM departments;

-- 직원 테이블의 모든 행, 모든 열 조회하기
SELECT * FROM EMPLOYEES;

-- 직종 테이블에서 직종 아이디, 최소급여, 최대급여 조회하기
SELECT JOB_ID, MIN_SALARY, MAX_SALARY FROM JOBs;

-- 직원 테이블에서 직원 아이디, 직원 이름(first name), 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM employees;

-- 소재지 테이블에서 소재지 아이디, 주소, 도시명을 조회하기
-- 대소문자 구분X
SeleCT LOcatION_ID, strEET_ADDRess FrOM LocaTIONs;

-- 직원 테이블에서 직원 아이디, 직원 이름, 급여, 연봉을 조회하기
-- 연봉은 급여*12로 계산한다.
select employee_id, first_name, salary, salary*12 from employees;

-- 직원 테이블에서 직원 아이디, 직원 이름, 급여, 연봉을 조회하기
-- 연봉은 급여*12로 계산한다.
-- 연봉의 별칭은 ANNUAL_SALARY
select employee_id, first_name, salary, salary*12 ANNUAL_SALARY from employees;

-- 직종 테이블에서 직종 아이디, 최고급여, 최저급여, 최고급여와 최저급여의 차이를 조회하기
-- 최고급여와 최저급여의 차이는 SALARY_GAP 별칭을 부여한다.
select job_id, max_salary, min_salary, max_salary - min_salary SALARY_GAP from jobs;

-- 직원 테이블에서 소속부서 아이디가 60번이 직원의 아이디, 이름, 직종 아이디를 조회하기
select employee_id, first_name, job_id from employees where department_id = 60;

-- 직원 테이블에서 급여를 10,000 달러 이상 받는 직원의 아이디, 이름, 직종 아이디, 급여를 조회하기
select employee_id, first_name, job_id, salary from employees where salary >= 10000;

-- 직원 테이블에서 직종 아이디가 'SA_MAN'인 직원의 아이디, 이름, 급여, 소속부서 아이디를 조회하기
select employee_id, first_name, salary, department_id from employees where job_id = 'SA_MAN';

-- 직원 테이블에서 급여가 5,000 ~ 10,000 범위에 속하는 직원 아이디, 이름, 직종 아이디, 급여를 조회한다.
-- 급여가 5,000 이상, 10,000 이하로 받는 직원을 조회하기
select employee_id, first_name, job_id, salary from employees where salary >= 5000 and salary <= 10000;

-- 직원 테이블에서 10번 부서, 20번 부서, 30번 부서에서 근무하는 직원 아이디, 이름, 부서아이디를 조회하기
select employee_id, first_name, department_id from employees where department_id = 10 or department_id = 30;