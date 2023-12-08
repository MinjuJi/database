/*
<오라클 내장함수 - 숫자함수>
*/

-- 숫자를 지정된 자릿수로 반올림한다.
SELECT ROUND (1234.5678)
    , ROUND (1234.5678, 3)
    , ROUND (1234.5678, 2)
    , ROUND (1234.5678, 1)
    , ROUND (1234.5678, 0)
    , ROUND (1234.5678, -1)
    , ROUND (1234.5678, -2)
    , ROUND (1234.5678, -3)
FROM dual;

-- 숫자를 지정된 자릿수만큼 남기고 버린다. 버릴 때 반올림 X
SELECT TRUNC (1234.5678)
    , TRUNC (1234.5678, 3)
    , TRUNC (1234.5678, 2)
    , TRUNC (1234.5678, 1)
    , TRUNC (1234.5678, 0)
    , TRUNC (1234.5678, -1)
    , TRUNC (1234.5678, -2)
    , TRUNC (1234.5678, -3)
FROM dual;

-- 나머지 구하기
SELECT MOD(10, 4)
FROM dual;

-- 절대값 구하기
SELECT ABS(-10)
FROM dual;

-- 숫자보다 크거가 같은 정수중에서 가장 작은 정수를 반환한다. = 소수점이 있으면 올림(음수면 버림)
SELECT CEIL(1)
    , CEIL(1.1)
    , CEIL(1.5)
    , CEIL(1.3)
    , CEIL(2)
FROM dual;

-- 숫자보다 작거나 같은 정수중에서 가장 큰 정수를 반환한다. = 소수점이 있으면 버림(음수면 올림)
SELECT FLOOR(1)
    , FLOOR(1.1)
    , FLOOR(1.5)
    , FLOOR(1.9)
    , FLOOR(2)
FROM dual;