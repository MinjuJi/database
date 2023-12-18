/*
데이터 사전
    - 데이터 사전은 데이터베이스 전반에 대한 정보를 제공하는 읽기전용 테이블 및 뷰들의 집합이다.
    - 오라클은 데이터 사전을 읽어서 객체의 존재여부, 사용자에게 액세스 권한이 있는지 등을 확인한다.
    - 오라클은 데이터베이스 구조, 사용자권한 등의 변경이 있을 때마다 데이터 사전을 갱신한다.

데이터 사전이 포함하고 있는 정보
    - 사용자 정보
    - 권한과 롤 정보
    - 데이터베이스 스키마 객체(테이블, 뷰, 인덱스, 시노님, 시퀀스 등) 정보
    - 데이터베이스 구조 정보
    
데이터 사전의 분류
    1. ALL_XXX
         ALL_로 시작하는 데이터 사전으로 한 특정 사용자가 조회가능한 모든 데이터 사전을 의미한다.
    
    2. USER_XXX - 주로 사용
         USER_로 시작하는 데이터 사전으로 한 특정 사용자에게 종속되어 있고, 그 사용자가 조회가능한 데이터 사전 뷰, ALL_XXX 데이터 사전의 부분집핟이다.
        
    3. DBA_XXX
         DBA 권한을 가진 사용자만이 조회할 수 있는 데이터 사전으로 모든 오라클 데이터베이스 객체에 대한 정보를 제공
*/

-- 테이블 정보를 제공하는 데이터 사전이다.
SELECT *
FROM USER_TABLES;

-- 뷰 정보를 제공하는 데이터 사전이다.
SELECT *
FROM USER_VIEWS;

-- 시퀀스 정보를 제공하는 데이터 사전이다.
SELECT *
FROM user_sequences;

-- 인덱스 정보를 제공하는 데이터 사전이다.
SELECT *
FROM USER_INDEXES;

-- 제약조건 정보를 제공하는 데이터 사전이다.
SELECT *
FROM USER_CONSTRAINTS;