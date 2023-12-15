/*
TOP-N
*/

-- 직원들을 급여순으로 정렬했을 때 급여를 가장 많이 받는 직원 5명(1등 ~ 5등)의 아이디, 이름, 급여 ,직종 조회하기
 SELECT ROWNUM
         , employee_id
         , first_name
         , salary
         , job_id
FROM (SELECT employee_id
                  , first_name
                  , salary
                 , job_id
          FROM employees
          ORDER BY salary DESC)
WHERE ROWNUM <= 5;

-- 아래코드는 TOP-N 분석은 아니다
-- 직원들을 급여순으로 정렬했을 때 급여를 가장 많이 받는 지원 5명(6~ 10등)의 직원 아이디, 이름, 급여, 직종 조회하기
SELECT rn, employee_id, first_name, salary, job_id
FROM (SELECT ROWNUM AS rn, employee_id, first_name, salary, job_id
          FROM (SELECT employee_id, first_name, salary, job_id
                    FROM employees
                    ORDER BY salary DESC))
WHERE rn >= 6 AND rn <= 10;

