/*
<오라클 내장함수 - 문자함수>
*/

-- 60번 부서에 소속된 직원들의 이름을 소문자, 대문자로 조회하기
SELECT first_name
    , LOWER(first_name)
    , UPPER(first_name)
FROM employees
WHERE department_id = 60;

-- 60번 부서에 소속된 직원들의 first_name과 last_name를 연결해서 조회하기 (CONCAT 함수 사용)
SELECT CONCAT(first_name, last_name)
FROM employees
WHERE department_id = 60;

-- 60번 부서에 소속된 직원들의 first_name과 last_name를 연결해서 조회하기 (|| 사용)
SELECT first_name || ' ' || last_name
FROM employees
WHERE department_id = 60;

-- 60번 부서에 소속된 직원들의 이름과 이름의 길이를 조회하기
SELECT first_name
    , LENGTH(first_name)
FROM employees
WHERE department_id = 60;

-- 이름이 6글자 이상인 모든 직원들의 직원아이디와 이름을 조회하기
SELECT employee_id
    , first_name
FROM employees
WHERE LENGTH(first_name) >= 6;

-- sample_books에서 저자이름을 조회하고 이름의 첫번째 글자도 조회하기
SELECT book_writer
    , SUBSTR(book_writer, 1, 1)
FROM sample_books;

-- 전화번호에서 국번만 조회하기
-- dual은 오라클에서 제공하는 dummy(실험용) 테이블이다.
-- dual은 1행 1열짜리 테이블이다.
-- 실제 테이블 조회없이 간단한 연산을 수행할 때 사용한다.
SELECT '02)1234-5678'
    , SUBSTR('031)1234-5678', 1, INSTR('031)1234-5678', ')') -1)
FROM dual;

-- 문자열 앞뒤 공백 제거하기
SELECT TRIM('  Hello World!   ')
FROM dual;

-- 지정된 길이만큼 문자열의 왼쪽에 '0'을 채워서 조회하기
SELECT LPAD('100', 10, '0')
FROM dual;
