/*
with 절
*/

-- 부서별 평균급여를 계산했을 때 평균급여값이 가장 큰 부서의 아이디와 평균급여를 조회하기
-- 서브쿼리 이용
SELECT department_id , AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MAX(AVG(salary))
                              FROM employees
                              GROUP BY department_id);
                        
-- WITH절 이용
WITH dept_avg_salary AS
(SELECT department_id, AVG(salary) avg_salary
 FROM employees
 GROUP BY department_id)
SELECT *
FROM dept_avg_salary
WHERE avg_salary = (SELECT MAX(avg_salary)
                           FROM dept_avg_salary);
                           
                           