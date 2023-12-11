/*
<오라클 내장함수 - 기타 함수>

1. NVL(null값이 예상되는 컬럼, 대체할 값)

    1)
        NVL(컬럼, 대체값)
    
        NVL함수는 NULL 값을 다른 값으로 변환한다.
        지저오딘 컬럼의 값이 NULL 아닌 경우에는 해당 컬럼의 값을 반환한다.
        해당 컬럼과 대체값은 데이터 타입이 동일한 타입이어야 한다.
    
    2)
        NVL(컬럼, 대체값1, 대체값2)
    
        지정된 컬럼의 값이 NULL이 아니면 대체값이 1이 반환되고, NULL이면 대체값 2가 반환된다.
        대체값1과 대체값2는 데이터 타입이 동일한 타입이어야 한다.
    

2. DECODE(컬럼, 비교값1, 값1,
                    비교값2, 값2,
                    비교값3, 값3,
                    기본값)
    AS 반환 값의 컬럼명
    
    지정된 컬럼의 값이 비교값1[2, 3]과 같으면 값1[2, 3]이 반환된다. 일치하는 값이 없으면 기본값이 반환된다.
    컬럼과 비교값 간의 equals 비교만 가능


3. CASE ~ WHEN 표현식

    1)    
        CASE
            WHEN 조건식1 THEN 값1
            WHEN 조건식2 THEN 값2
            WHEN 조건식3 THEN 값3
            ELSE 값4
        END AS 반환 값의 컬럼명
        
        java의 switch나 if ~ else if ~ else과 유사하다.
        조건식에서는 =, >, <> 등의 다양한 연산자를 사용해서 조건식을 작성할 수 있다.
        DECODE함수와 비교했을 때 더 다양한 조건을 적용(<>, =, <=)할 수 있다.
        END
    
    2)    
         CASE 컬럼
            WHEN 조건식1 THEN 값1
            WHEN 조건식2 THEN 값2
            WHEN 조건식3 THEN 값3
            ELSE 값4
        END AS 반환 값의 컬럼명
        
        DECODE와 동일한 기능 수행
*/

-- 모든 직원의 아이디, 이름, 급여, 커미션을 조회한다.
-- 커미션이 NULL이면 0을 반환한다. 
SELECT employee_id
    , first_name
    , salary
    , NVL(commission_pct, 0)
FROM employees;

-- 모든 직원의 아이디, 이름, 급여, 커미션, 커미션이 포함된 급여를 조회하기
-- 커미션이 포함된 급여 = 급여 + (급여 * 커미션)
SELECT employee_id
    , first_name
    , salary
    , commission_pct
    , salary + (salary * NVL(commission_pct, 0))
FROM employees;

-- 모든 부서의 부서아이디, 이름, 관리자 아이디 조회하기
-- 단, 관리자가 지정되지 않은 부서는 '관리자 없음'으로 조회하기
SELECT department_id
    , department_name
    , NVL(TO_CHAR(manager_id), '관리자 없음')
FROM departments;

-- 모든 직원테이블에서 급여가 5000 이하면 보너스 1000 지급하고, 급여가 10000원 이하면 보너스를 2000 지급하고, 그외는 3000을 지급한다.
-- 모든 직원에 대해서 직원 아이디, 이름, 급여, 보너스를 조회하기
SELECT employee_id
        , first_name
        , salary
        , CASE
                WHEN salary <= 5000 THEN 1000
                WHEN salary <= 10000 THEN 2000
                ELSE 3000
         END AS BONUS
FROM employees;

-- 모든 직원에 대해서 부서 아이디를 기준으로 팀을 지정하기
-- 10, 20, 30번 부서는 A팀 40, 50, 60번 부서는 B팀 그외는 C팀
-- 직원 아이디, 이름, 부서 아이디, 팀명을 조회하기
SELECT employee_id
        , first_name
        , department_id
        , CASE
            WHEN department_id IN(10, 20, 30) THEN 'A'
            WHEN department_id IN(40, 50, 60) THEN 'B'
            ELSE 'C'
        END AS TEAM
FROM employees;

-- 지역 테이블에서 지역 아이디별로 지역명을 조회하기
-- 1은 유럽, 2는 아메리카, 3은 아시아, 4는 아프리카 및 중동
-- 1) CASE ~ WHEN
SELECT region_id
        , CASE
            WHEN region_id = 1 THEN '유럽'
            WHEN region_id = 2 THEN '아메리카'
            WHEN region_id = 3 THEN '아시아'
            WHEN region_id = 4 THEN '아프리카 및 중동'
        END AS region_name
FROM regions;

-- 2) CASE 컬럼 ~ WHEN
SELECT region_id
        , CASE region_id
            WHEN  1 THEN '유럽'
            WHEN 2 THEN '아메리카'
            WHEN 3 THEN '아시아'
            WHEN 4 THEN '아프리카 및 중동'
        END AS region_name
FROM regions;

--  3) DECODE
SELECT region_id
        , DECODE(region_id, 1, '유럽',
                                2, '아메리카',
                                3, '아시아',
                                4, '아프리카 및 중동') 
AS region_name
FROM regions;

-- 부서 테이블에서 부서 아이디, 부서명, 관리자 이름을 조회하기
-- 관리자가 지정되어 있지 않으면 없음으로 조회한다.
SELECT department_id
        , department_name
        , CASE
                WHEN manager_id IS NOT NULL THEN ' '
                ELSE '없음'
            END AS manager_name
FROM departments;

