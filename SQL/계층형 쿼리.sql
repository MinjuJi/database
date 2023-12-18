/*
계층형 쿼리
*/

SELECT [LEVEL], 컬럼명1, 컬럼명2
FROM 테이블명
[WHERE ....]
START WITH 조건식
CONNECT BY PRIOR 조건식;

/*순방향 검색*/
-- 101번 직원의 하위 직원을 검색하기
SELECT LEVEL, employee_id, first_name, manager_id
FROM employees
START WITH employee_id = 101 -- 101번 직원이 시작지점이다.
CONNECT BY PRIOR employee_id = manager_id;

-- 시각적 표현 추가
SELECT LEVEL
        , LPAD(' ', 4*(LEVEL - 1), ' ') || employee_id
        , first_name
        , manager_id    
FROM employees
START WITH employee_id = 101 -- 101번 직원이 시작지점이다.
CONNECT BY PRIOR employee_id = manager_id;


/*역방향 검색*/
-- 206번 직원의 상위 직원 조회하기
SELECT LEVEL
        , employee_id
        , first_name
        , manager_id
FROM employees
START WITH employee_id = 206
CONNECT BY PRIOR manager_id = employee_id;


/* CONNECT BY LEVEL 연속된 숫자 조회 - 계층과 관계 없음*/
-- 연속된 숫자 만들기
SELECT LEVEL
FROM DUAL
CONNECT BY LEVEL <= 10;

-- 01월 ~ 12월까지 연속된 숫자 만들기
SELECT LPAD(LEVEL, 2, '0') MONTH
FROM DUAL
CONNECT BY LEVEL <= 12;

-- 특정 기간 사이의 날짜 생성하기
SELECT TO_DATE('2023-12-01') + LEVEL - 1
FROM DUAL
CONNECT BY LEVEL <= TO_DATE('2023-12-31') - TO_DATE('2023-11-30');

-- 2003년에 입사한 직원들의 월별 입사자 숫자를 조회하기
SELECT A.month, NVL(B.cnt, 0) cnt
FROM (SELECT LPAD(LEVEL, 2, '0') month
         FROM DUAL
         CONNECT BY LEVEL <= 12) A, 
         (SELECT TO_CHAR(hire_date, 'MM') month, COUNT(*) cnt
         FROM employees
         WHERE TO_CHAR(hire_date, 'YYYY') = '2023' 
         GROUP BY TO_CHAR(hire_date, 'MM')) B
WHERE A.MONTH = B.MONTH(+)
ORDER BY A.MONTH;

