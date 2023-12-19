-- HTA 사용자에게 employees 테이블 객체에 대해 조회 권한 부여하기
GRANT SELECT
ON employees
TO HTA;

-- HTA 사용자에게 부여된 employees 테이블 객체에 대해 조회 권한 회수하기
REVOKE SELECT
ON employees
FROM HTA;

-- HTA 사용자에게 employees 테이블 객체에 대해 조회, 추가, 변경, 삭제 권한을 부여하기
GRANT SELECT, INSERT, UPDATE, DELETE
ON employees
TO HTA;

-- HTA 사용자에게 employees 객체에 대한 모든 객체 권한을 부여하기
GRANT ALL PRIVILEGES
ON employees
TO HTA;

-- 모든 사용자에게 employees 객체에 대한 객체권한을 부여하기
GRANT SELECT
ON employees
TO PUBLIC;

-- WITH GRANT OPTION을 사용하면 SELECT 권한을 부여받은 HTA가 다른 사용자에게 SELECT 권한을 부여할 수 있다.
GRANT SELECT  
ON employees
TO HTA
WITH GRANT OPTION
