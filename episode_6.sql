-- ���� 6.01 : Department ���̺��� ��� �����͸� ����Ͻÿ�.
select
    dept_id,
    dept_name,
    dept_tel
from department;



-- ���� 6.02 : professor ���̺��� �ߺ����� �ʴ� dept_id Į���� ������ ����Ͻÿ�.

select distinct
    dept_id
from professor;

/*
    SELECT���� �ֿ����
    �� SELECT���� FROM���� �ʼ��� �̰�, �������� �������̴�.
    �� ���� ��� ������ �����̴�.
    �� HAVING���� GROUP BY���� ����� ���� ����� �� �ִ�.
    �� SELECT���� ��� ���� ���� 0��, �� ��, ���� �� ��� ���������� ����ȴ�.
    �� SELECT���� ���� ����� ȭ�鿡 ��µȴ�.
*/

-- ���� 6.03 : Professor ���̺��� �ߺ����� �ʴ� dept_id Į���� ������ ����Ͻÿ�. �� ������ "�Ҽ��а�"�� ����Ѵ�.
select unique
    dept_id "�Ҽ��а�"
from professor;


-- ���� 6.04 : Course���̺��� �����ڵ�(Course_ID), �����(Title), ����(C_Number)�� ����Ͻÿ�.
select
    course_id "�����ڵ�",
     title "�����",
     c_number "����"
from course;


/*
    ORDER BY ���� ��¼��� ����
    - �������� ���� : ASC
    - �������� ���� : DESC

    ������� :  ORDER BY Į����1 [ASC | DESC], �÷���2 [ASC | DESC] ...
                        ������ȣ1 [ASC | DESC], ������ȣ2 [ASC | DESC] ...
                        
    �� ����. order by ���� ���Ǵ� Į������ alias�� ���� �� ������, �÷����� ����ؾ� �Ѵ�.
*/

-- ���� 6.05 : course���̺��� �����ڵ�(course_id), �����(title), ����(c_number)�� �����(title) ������������ ����Ͻÿ�.
select
    course_id "�����ڵ�",
    title "�����",
    c_number "����"
from course
order by title asc;


--���� 6.06 : course���̺��� �����ڵ�(course_id), �����(title), ����(c_number), ���� ������(���� * 30000 + �߰�������)�� ����ϵ�,
--���� �����Ḧ ��������, �����ڵ�� ������������ ����Ͻÿ�.

select
    course_id "�����ڵ�",
    title "�����",
    c_number "����",
    c_number * 30000 + nvl(course_fees, 0) "���� ������"
from course
order by 4 desc, course_id asc;

/*
    �ڡڡ� nvl(A, B) �Լ��� A�� ���� null�� �� B�� ��ȯ�ϰ�, A���� null���� �ƴ� ��쿣 A�� ��ȯ�Ѵ�.
*/

