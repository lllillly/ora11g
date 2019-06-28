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


/*
    -WHERE ���� from���� ����� ���̺��� �Ϻ� �����ͳ� Ư�� �����͸� �˻��ϱ� ���� ������ ����
    
    ������� : WHERE expr1 ������ expr2
*/


--���� 6.07 : professor���̺�κ��� '�İ�'�а��� �������� ����Ͻÿ�.
select
    professor_id,
    name,
    position,
    dept_id
from professor
where dept_id='�İ�';


--���� 6.08 : Course���̺�κ��� �߰� �����ᰡ 30000�� �̻��� ������� ����ϵ�, �߰� �����Ḧ ������������ ����Ͻÿ�.
select
    course_id,
    title,
    c_number,
    course_fees
from course
where course_fees >= 30000
order by course_fees desc;


--���� 6.09 Student �����񿡼� '�İ�'�а� 2�г� �л��� �а�, �г�, ������ ����Ͻÿ�.
select * from student; 

select
    dept_id,
    year,
    name
from student
where dept_id = '�İ�';


/*
    LIKE ������
    - LIKE�����ڴ� ���ڿ��� �������࿡ ���ؼ� �˻��� �� �ִ� SQL ������ �̴�.
    - expr�� �÷����� ����ϰ�, '��������'���� �˻��� Ű���带 ��ü���ڿ� �Բ� ����Ѵ�.
    
    ������� : expr LIKE( NOT LIKE ) '��������'
    
    �� �˻��� '��������'�� ���Ǵ� ��ü���ڴ� 2������ �ִ�.
    �� % ��ȣ�� ��� ���ڸ� ��ü�Ѵ�.
    �� _ ��ȣ�� �� ���ڸ� ��ü�Ѵ�.
*/

--���� 6.12 : student ���̺�κ��� '��'�� ���� �л� ����� ����Ͻÿ�.
select 
    dept_id,
    year,
    student_id,
    name
from student
where name LIKE '��%';


--���� 6.13 student���̺�κ��� ���� Į���� �߰����ڰ�'��' ���� �л��� �˻��Ͽ� ����Ͻÿ�.
select
    dept_id,
    year,
    student_id,
    name
from student
where name LIKE '_��_';


--���� 6.14 : student ���̺�κ��� '��'���� '��'�� ���� ������ �л� ����� ����Ͻÿ�.
select
    dept_id,
    year,
    student_id,
    name
from student
where name NOT LIKE '��%'
AND name NOT LIKE '��%';


/*
    IN ������
    -IN�����ڴ� ������ ������ ��ϰ� ���Ͽ�, ������ ���� ��� �� �ϳ��� �� '��'�� �ǰ�, �׷��� ������ '����'�� �ȴ�.
    
    ������� : expr IN  (��1, ��2, ... )
*/

-- ���� 6.15 : professor ���̺��� �а� �ڵ�(dept_id)�� '�İ�', ����' �а��� �������� ������ ����� �а��ڵ� ������ ����Ͻÿ�.
select
    dept_id,
    professor_id,
    name,
    position
from professor
where dept_id IN ('�İ�', '����');
/*
    �� IN�����ڴ� dept_id = '�İ�' OR dept_id = '����' �� ���� '=' ���迬���ڿ�  'OR'�����ڸ� ��ü�ϴ� SQL ������ �̴�.
*/



--���� 6.16 : professor ���̺��� �а��ڵ�(dept_id)�� '�İ�', '����'�а��� �ƴ� ������ ����� �а��ڵ������ ����Ͻÿ�.
select
    dept_id,
    professor_id,
    name,
    position
from professor
where dept_id NOT IN ('�İ�', '����');



/*
    BETWEEN ~ AND ������
    - �ּڰ����� �ִ��� ������ ���ԵǴ°��� �˻��ϴ� SQL �������̴�.
    
    ������� : expr BETWEEN �ּڰ� AND �ִ�
    �� ������������, ������������, ��¥�������͸� ����� �� �ִ�.
*/

--���� 6.17 : sg-scores ���̺��� ����(score)�� 90������ 94�������� ������ ���� ������������ ����Ͻÿ�.
select
    student_id,
    course_id,
    score
from sg_scores
where score between 90 and 94
order by 3 desc;


--���� 6.18 : sg_scores���̺��� ������ 60������ 100������ ������ ������ ���������� ����Ͻÿ�.
select
    student_id,
    course_id,
    score
from sg_scores
where score not between 60 and 100
order by 3 desc;


/*
    IS NULL ������
    - IS NULL �����ڴ� expr���� Null�̸� ���� �ǰ�, �׷��� ������ ������ �޴�.
    
    ������� : expr IS NULL
*/

--���� 6.19 : course ���̺�κ��� �߰������ᰡ null�� ���� �˻��Ͽ� ��������� ����Ͻÿ�.
select
    *
from course
where course_fees IS NULL
order by title asc;


--���� 6.20 : course ���̺�κ��� �߰������ᰡ null�� �ƴ� ���� �˻��Ͽ� ���������� ����Ͻÿ�.
select
    *
from course
where course_fees IS NOT NULL
order by title asc;


/*
    ROWNUM �ǻ�Į��
    - ROWNUM �ǻ�Į���� from���� ����� ���̺��̳� ��, ���������� �� ��ȣ�� ��ȯ�ϴ� �ǻ�Į���̴�.
    - WHERE���� ROWNUM�ǻ�Į���� �̿��Ͽ� TOP-N ������ �����ϴ�.
*/

--���� 6.21 : department ���̺� ��� �� �� ��ȣ�� �߰��Ͻÿ�.
select
    rownum,
    dept_id,
    dept_name,
    dept_tel
from department;


--���� 6.22 : department���̺��� ���� 3���� ����Ͻÿ�.
select
    rownum,
    dept_id,
    dept_name,
    dept_tel
from department
where rownum <= 3;

    


