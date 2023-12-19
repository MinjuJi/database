-- HTA에게 객체 권한이 부여된 HR의 employees 테이블 조회하기
SELECT *
FROM HR.employees;

-- HR.employees 테이블을 참조하는 동의어(시노님) 생성
CREATE SYNONYM emp
FOR HR.employees;

-- 동의어를 사용하여 employees 테이블 조회하기
SELECT *
FROM emp;
