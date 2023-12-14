/*
뷰(가상의 테이블)
*/

-- 부서에 대한 상세정보를 제공하는 뷰 생성하기
-- 부서아이디, 부서명, 관리자 아이디, 관리자 이름, 소재지 아이디, 소재지 도시, 우편번호, 주소, 국가코드, 국가명을 포함한다.
-- 소재지 아이디, 소재지 도시, 우편번호, 주소, 국가코드, 국가명을 포함한다.
CREATE OR REPLACE VIEW DEPT_DETAIL_VIEW
AS (SELECT D.DEPARTMENT_ID,
           D.DEPARTMENT_NAME,
           D.MANAGER_ID,
           M.FIRST_NAME,
           D.LOCATION_ID,
           L.CITY,
           L.POSTAL_CODE,
           L.STREET_ADDRESS,
           L.COUNTRY_ID,
           C.COUNTRY_NAME
    FROM DEPARTMENTS D, EMPLOYEES M, LOCATIONS L, COUNTRIES C
    WHERE D.MANAGER_ID = M.EMPLOYEE_ID(+)
    AND D.LOCATION_ID = L.LOCATION_ID
    AND L.COUNTRY_ID = C.COUNTRY_ID)
WITH READ ONLY;

SELECT *
FROM dept_detail_view
WHERE department_id = 60;

-- 부서아이디, 부서별 사원수, 부서명 조회하기
-- 부서별 사원수를 조회하는 SQL을 작성한다.
-- 해당 SQL의 실행결과를 가상의 테이블로 다룬다.
SELECT V. dept_id
        , V.cnt
        , D.department_name
FROM (SELECT department_id AS dept_id
                  , COUNT(*) AS cnt
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id) V, departments D
WHERE V.dept_id = D.department_id;

-- 부서별 최저급여를 받는 사원의 아이디, 이름, 부서아이디. 급여를 조회하기
-- 다중열 서브쿼리 사용
SELECT E.employee_id
        , E.first_name
        , E.salary
FROM employees E
WHERE(E.department_id, E.salary) IN (SELECT I.department_id, MIN(I.salary)
                                            FROM employees I
                                            GROUP BY I.department_id);
-- 인라인뷰 사용
SELECT E.employee_id
        , E.first_name
        , E.salary
        , E.department_id
FROM(SELECT department_id
                , MIN(salary) AS min_salary
        FROM employees
        GROUP BY department_id) X, employees E
WHERE X.department_id = E.department_id
AND X.min_salary = E.salary