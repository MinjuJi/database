/*
<오라클 내장함수 - 날짜함수>
*/

-- SYSDATE : 시스템의 년월일시분초까지 표시 가능하고 DATE 타입으로 반환한다.
-- SYSTIMESTAMP : 시스템의 년월일시분초밀리세컨드까지 표시할 수 있고, TIMESTAMP 타입으로 반환한다.
-- * 데이터가 추가되거나 변경될 때 시스템의 현재 날짜와 시간정보를 저장하는 용도로 활용한다.           
-- * TO_CHAR(날짜, '형식') 함수를 사용해 날짜 및 시간을 지정된 형식으로 출력할 수 있음 
-- * SYSDATE가 날짜만 표시되더라도 내부적으로는 시간 데이터를 가지고 있으며, [환경설정 - 데이터베이스 - NLS - 날짜 형식]에서 형식 지정 가능
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') 
    , TO_CHAR(systimestamp, 'YYYY/MM/DD HH:MI:SSFF')
FROM dual;

-- 날짜에서 숫자만큼 개월수를 증감시킨 값을 반환한다.
SELECT SYSDATE,                     -- 오늘
    ADD_MONTHS(SYSDATE, 1),     -- 1달후
    ADD_MONTHS(SYSDATE, 2),     -- 2달후
    ADD_MONTHS(SYSDATE, 3)      -- 3달후
FROM dual;

-- 오늘이 12월 31일이라고 가정하고, 2달 후의 날짜를 조회하면 2월 28일 혹은 2월 29일이 반환된다.
SELECT ADD_MONTHS('2023-12-31', 2)
FROM dual;

-- 시스템의 현재 일자와 시간 정보에서 년, 월, 일, 시, 분, 초 추출하기(시간은 SYSTIMESTAMP에서 추출할 수 있음)
SELECT EXTRACT(YEAR FROM SYSDATE),
    EXTRACT(MONTH FROM SYSDATE),
    EXTRACT(DAY FROM SYSDATE),
    EXTRACT(HOUR FROM SYSTIMESTAMP),
    EXTRACT(MINUTE FROM SYSTIMESTAMP),
    EXTRACT(SECOND FROM SYSTIMESTAMP)
FROM dual;

-- 현재 일자가 속한 월의 마지막 일자 조회하기
SELECT LAST_DAY(SYSDATE)
FROM dual;

-- 현재 일자를 기준으로 다음 월요일을 조회하기
SELECT NEXT_DAY(SYSDATE, '월요일')
FROM dual;

-- 날짜 +- 숫자: 지정된 날짜에서 숫자만큼 증감된 날짜를 반환한다.
SELECT SYSDATE + 3  -- 3일 후
    , SYSDATE - 2      -- 2일 전
FROM dual;

-- TRUNC(날짜) : 시간 정보를 00:00:00으로 바꿈.
SELECT TRUNC(SYSDATE)
FROM dual;

-- ROUND(날짜) : 지정된 날짜의 시간 정보가 정오를 지나기 전이면 해당 날짜가 반환되고 정오를 지났으면 날짜가 하루 증가하고, 시간정보는 00:00:00으로 반환된다.
SELECT ROUND(SYSDATE)
FROM dual;

-- MONTHS_BETWEEN(큰날짜, 작은날짜) : 두 날짜 사이의 개월수를 반환한다
SELECT MONTHS_BETWEEN(SYSDATE, '2023/06/02')
FROM dual;

-- 날짜 - 날짜: 두 날짜 사이의 날짜 수를 반환한다.
-- * TO_DATE('문자열 타입의 날짜', '날짜 형식' ) : 문자열을 날짜로 변환
SELECT SYSDATE - TO_DATE('2023/11/7')
FROM dual;

-- 숫자 / 24 : 시간 증감
SELECT SYSDATE
    , SYSDATE - 1 / 24  -- 1시간 전
    , SYSDATE + 3 / 24  -- 3시간 후
FROM dual;
