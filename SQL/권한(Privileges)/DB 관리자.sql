/*
사용자와 권한 관리
*/

-- 사용자 생성하기
/*
    ORACLE 12C버전부터 사용자명에 c##을 붙이지 않으면 오류가 발생할 수 있다.
    _ORACLE_SCRIPT를  TRUE로 설정하면 c##을 붙이지 않고 사용자를 생성할 수 있다.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER HTA IDENTIFIED BY zxcv1234;

-- 사용자에게 시스템 권한 부여하기
-- 시스템 권한을 직접 HTA 사용자에게 부여하기
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE
TO HTA;

-- HTA 사용자에게 롤이 포함하고 있는 모든 시스템 권한을 부여한다.
GRANT CONNECT, RESOURCE 
TO HTA;

-- HTA 사용자에게 동의어 관련 생성, 삭제 시스템 권한을 부여한다.
GRANT CREATE SYNONYM, DROP ANY SYNONYM
TO HTA;
