-- �μ����̺��� ��� �μ� ������ ��ȸ�ϱ�
SELECT department_id, department_name, manager_id, location_id
FROM departments;

-- �μ����̺��� ���������̵� 1700���� �μ� ���� ��ȸ�ϱ�
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE location_id = 1700;

-- 100�� ������ �����ϴ� �μ����� ��ȸ�ϱ�
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE manager_id = 100;

-- �μ����� 'IT'�� �μ��� ���� ��ȸ�ϱ�
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE department_name = 'IT';
    
-- ���������̵� 1700���� ������ �ּ�, �����ȣ, ���ø�, �����ڵ带 ��ȸ�ϱ�
SELECT street_address
    , postal_code
    , city
    , locations.country_id
FROM locations
WHERE location_id = 1700;
    
-- �ּұ޿��� 2000�̻� 5000������ ������ �������̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id
    , job_title
    , min_salary
    , max_salary
FROM jobs
WHERE min_salary >= 2000 AND min_salary <=5000;

-- �ִ�޿��� 20000���� �ʰ��ϴ� ������ ���̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT job_id
    , job_title
    , min_salary
    , max_salary
FROM jobs
WHERE max_salary >= 20000;
    
-- 100�� �������� �����ϴ� ������ ���̵�, �̸�, �μ����̵��� ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , department_id
FROM employees
WHERE employee_id = 100;
    
-- 80�� �μ����� �ٹ��ϰ� �޿��� 8000�� �̻� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , salary
    , commission_pct
FROM employees
WHERE department_id = 80 AND salary >= 8000;
    
-- �������̵� SA_REP�̰�, Ŀ�̼�����Ʈ�� 0.25�̻��� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , salary
    , commission_pct
FROM employees
WHERE job_id = 'SA_REP' 
AND commission_pct >= 0.25;
    
-- 80�� �μ��� �ٹ��ϰ�, �޿��� 10000�� �̻��� ������ ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
-- ���� = (�޿� + �޿�xĿ�̼�)x12��
SELECT employee_id
    , first_name
    , salary
    , (salary + ( salary*commission_pct))*12
FROM employees
WHERE department_id = 80 
AND salary >= 10000;
    
-- 80�� �μ��� �ٹ��ϰ�, 147�� �������� �����ϴ� ��� �߿��� Ŀ�̼��� 0.1�� ������ ���̵�, �̸�, ����, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT employee_id
    , first_name
    , job_id
    , salary
    , commission_pct
FROM employees
WHERE department_id = 80 
AND manager_id = 147 
AND commission_pct =0.1;