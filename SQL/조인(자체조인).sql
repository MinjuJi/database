/*
<자체 조인(Self Join)>

    조인대상이 되는 테이블이 같은 테이블일 떄 발생하는 조인이다.
    같은 테이블끼리 조인하기 때문에, 서로 역할 나누어서 별칭을 정하고, 그 역할에 맞게 조인조건을 정의해야 한다.
*/

-- 직원테이블에서 직원아이디, 직원이름, 해당 직원의 상사아이디, 상사이름을 조회하기
SELECT EMP.employee_id AS EMP_ID
        , EMP.first_name AS EMP_NAME
        , MGR.employee_id AS MGR_ID
        , MGR.first_name AS MGE_NAME
FROM employees EMP, employees MGR
WHERE EMP.manager_id = MGR.employee_id;

-- 직원아이디, 직원이름, 직원의 소속부서명, 상사의 아이디, 상사의 이름, 상사의 소속부서명
SELECT E.employee_id              AS emp_id
        , E.first_name                 AS emp_name
        , ED.department_name     AS emp_dept_name
        , M.employee_id             AS mgr_id
        , M.first_name                AS mgr_name
        , MD.department_name     AS mgr_dept_name
FROM employees E                -- 직원
        , employees M              -- 관리자
        , departments ED           -- 직원 소속부서
        , departments MD          -- 관리자 소속부서
WHERE E.department_id = ED.department_id(+)     -- 직원과 직원의 소속부서 조인
AND E.manager_id = M.employee_id(+)               -- 직원과 매니저 조인
AND M.department_id = MD.department_id(+);      -- 매니저와 매니저의 소속부서 조인
