/*
    1. ���̺��� ������ ��ȸ
        SELECT �÷���, �÷���, ... FROM ���̺��; // �κ���ȸ
        SELECT * FROM ���̺��; // ��ü ��ȸ
    
    2. select������ ��Ģ���� ����
        select �÷���*����, �÷���*�÷��� from ���̺��;
        * ��Ģ���꿡 ���Ǵ� �÷��� �ش� �÷��� ���� ���ڰ��̾�� �Ѵ�.
    
    3. ���� ��Ī �ο��ϱ�
        1) select �÷��� as ��Ī, �÷��� as ��Ī, ... form ���̺��;
        2) slect �÷��� ��Ī, �÷��� ��Ī, ... from ���̺��;
        
    4. ������ ���͸� �ϱ�
        1) where���� ���ǽ��� �ۼ��ؼ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
            select �÷���, �÷���, �÷���, ... from ���̺�� where ���ǽ�;
        
        2) where������ 2�� �̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�.
            - 2�� �̻��� ���ǽ��� �ۼ��� ���� and, or, not �� �����ڸ� ����Ѵ�.
                * select �÷���, �÷���, ... form ���̺�� where ���ǽ�1 and ���ǽ�2;
                * select �÷���, �÷���, ... form ���̺�� where ���ǽ�1 or ���ǽ�2;
                * select �÷���, �÷���, ... form ���̺�� where ���ǽ�1 and (���ǽ�2 or ���ǽ�3);
                 
*/

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT* FROM regions;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT* FROM countries;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT* FROM jobs;

-- �μ� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT * FROM departments;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT * FROM EMPLOYEES;

-- ���� ���̺��� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY FROM JOBs;

-- ���� ���̺��� ���� ���̵�, ���� �̸�(first name), �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM employees;

-- ������ ���̺��� ������ ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
-- ��ҹ��� ����X
SeleCT LOcatION_ID, strEET_ADDRess FrOM LocaTIONs;

-- ���� ���̺��� ���� ���̵�, ���� �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
select employee_id, first_name, salary, salary*12 from employees;

-- ���� ���̺��� ���� ���̵�, ���� �̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
-- ������ ��Ī�� ANNUAL_SALARY
select employee_id, first_name, salary, salary*12 ANNUAL_SALARY from employees;

-- ���� ���̺��� ���� ���̵�, �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�
-- �ְ�޿��� �����޿��� ���̴� SALARY_GAP ��Ī�� �ο��Ѵ�.
select job_id, max_salary, min_salary, max_salary - min_salary SALARY_GAP from jobs;

-- ���� ���̺��� �ҼӺμ� ���̵� 60���� ������ ���̵�, �̸�, ���� ���̵� ��ȸ�ϱ�
select employee_id, first_name, job_id from employees where department_id = 60;

-- ���� ���̺��� �޿��� 10,000 �޷� �̻� �޴� ������ ���̵�, �̸�, ���� ���̵�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, job_id, salary from employees where salary >= 10000;

-- ���� ���̺��� ���� ���̵� 'SA_MAN'�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
select employee_id, first_name, salary, department_id from employees where job_id = 'SA_MAN';

-- ���� ���̺��� �޿��� 5,000 ~ 10,000 ������ ���ϴ� ���� ���̵�, �̸�, ���� ���̵�, �޿��� ��ȸ�Ѵ�.
-- �޿��� 5,000 �̻�, 10,000 ���Ϸ� �޴� ������ ��ȸ�ϱ�
select employee_id, first_name, job_id, salary from employees where salary >= 5000 and salary <= 10000;

-- ���� ���̺��� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
select employee_id, first_name, department_id from employees where department_id = 10 or department_id = 30;