--���� 9.06)  Professor ���̺��� �̿��Ͽ� �а��� ���� �ο����� ����Ͻÿ�.

--SELECT * FROM PROFESSOR;

SELECT
        DEPT_ID,
        COUNT(*)
  FROM  PROFESSOR
 GROUP  BY  DEPT_ID;
 
 
--���� 9.07) Professor ���̺��� �̿��Ͽ� �а��� ���� �ο����� �Ѹ��� �а��� ����Ͻÿ�
SELECT
        DEPT_ID,
        COUNT(*)
  FROM  PROFESSOR
 GROUP  BY DEPT_ID
HAVING  COUNT(*) = 1;


--����9.08) SG_SCores ���̺��� �й��� 8���� �̻� ����� �й��� ������� ����� �й������� ����Ͻÿ�
--SELECT * FROM SG_SCORES;
SELECT
        STUDENT_ID,
        COUNT(*),
        TO_CHAR(AVG(SCORE), '99,99')
  FROM  SG_SCORES
 GROUP  BY STUDENT_ID
HAVING  COUNT(*) >= 8;



--���� 9.09) Student ���̺�κ��� �а���/�г⺰ �ο����� ����Ͽ� �а���/�г⺰�� ����Ͻÿ�.
SELECT  *   FROM STUDENT;

SELECT
        DEPT_ID,
        YEAR,
        COUNT(*) AS "�ο�"
  FROM  STUDENT
 GROUP  BY  DEPT_ID, YEAR
 ORDER  BY  1, 2;
 
 
--���� 9.10) STUDENT���̺�κ��� �а���/�г⺰, �а���, ��ü �հ��� �ο����� ����Ͻÿ�.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY  ROLLUP(DEPT_ID, YEAR);
  
 
 
--���� 9.11) Student ���̺�κ��� �а���/�г⺰ �а���, �г⺰, ��ü�հ� �ο����� ����Ͻÿ�.s
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY CUBE(DEPT_ID,YEAR);
 
 
 
/*
    GROUPING SETS -> GROUP BY���� Ȯ��� ���·�, �ϳ��� GROUP BY���� ����� Į���� ���踦 ����Ѵ�.
    ��ȣ()���� �׷��� Į���� ����ϸ� ���ʿ��� ���踦 �����Ͽ� �� Į���� �׷쿡 ���� ���谡 ��µȴ�.
    
    ���� : GROUP BY GROUPING SETS (Į����1, Į����2, ... ..., )
*/

--���� 9.12) STUDENT���̺�κ��� �ϰ����ο����� �г⺰ �ο����� ����Ͽ� ����Ͻÿ�.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY GROUPING SETS (DEPT_ID, YEAR);
 
 
 
--���� 9.13) STUDENT ���̺�κ��� �а���/�г⺰, �а���, �г⺰ �ο����� GROUPING SETS�� �̿��Ͽ� ����Ͻÿ�.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY  GROUPING SETS((DEPT_ID,YEAR), DEPT_ID, YEAR);
 
 
 
/*
    �׷��� �Լ�
    - �׷��� �Լ��� GROUPING() �� GROUPING_ID(), GROUP_ID()�� �ִ�.
        �׷��� �Լ����� �������� ����, ���꿡 Į���� ���Ǹ� 0, ������ ������ 1�� ��ȯ�Ѵ�.
        
      �� GORUPING(expr) �Լ��� expr�� ROLLUP, CUBE, GROUPING SETS �Լ����� ������ ��� ���ο� ���� 0 �Ǵ� 1�� ��ȯ�Ѵ�.
      �� GROUPING_ID(expr, expr, ,,,) �Լ��� ROLLUP, CUBE, GROUPING SETS �Լ����� expr�� ������ ��� ������ ����
        �׷��� ��Ʈ ���ͷ� 0 �Ǵ� 1�� ��ȯ�Ѵ�. ���� expr�� 
        �� ���� Į��[a, b]�� ��쿣 
        [a���, b���]�̸�          -> [00]  -> 0
        [a���, b��� ����]�̸�     -> [01]  -> 1
        [a��� ����, b���]�̸�     -> [10)  -> 2
        [a, b��� ����] �̸�        -> [11]  -> 3
      �� GROUP_ID() �Լ��� ������ GROUP BY�� ����κ��� �ߺ��� �׷��� �����ϸ�, ���� ������� �ߺ��� �׷����� ���͸� �Ѵ�.
        ������ �ߺ� �׷��� �ĺ��ϱ� ���ؼ� ����Ŭ ���ڸ� ��ȯ�Ѵ�.
        n�� Ư�� �׷��ο��� �ߺ��� �����ϸ� GROUP_ID�� 0~n~-1 ������ ���� ��ȯ�Ѵ�. 
*/

--����9.14) ���� 9.11�� ó���Ͻÿ�.
--          ��, GROUPING_ID() �Լ��� DEPT_ID, YEAR �÷� ��� ������ ���� '�Ұ�', '�г��', '��ü�հ�'�� �߰��Ͽ� ����Ͻÿ�.
SELECT
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Dept_ID          -- ���, ���
                WHEN 1 THEN NULL             -- ���, ������
                WHEN 2 THEN ' �г��'        -- ������, ���
                WHEN 3 THEN NULL             -- ������, ������
        END "�а��ڵ�",
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Year                    -- ���, ���
                WHEN 1 THEN ' �Ұ�'                 -- ���, ������
                WHEN 2 THEN YEAR                    -- ������, ���
                WHEN 3 THEN ' ��ü�հ�'             -- ������, ������
        END "�г�",
        COUNT(*) "�ο���",
        GROUPING_ID(DEPT_ID, YEAR) "��Ʈ����"
  FROM  STUDENT
 GROUP  BY  CUBE(DEPT_ID, YEAR)
 ORDER  BY DEPT_ID;
 
 
 
SELECT
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN DEPT_ID
                WHEN 1 THEN NULL
                WHEN 2 THEN ' �г��'
                WHEN 3 THEN NULL
        END "�а�",
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Year
                WHEN 1 THEN ' �Ұ�'
                WHEN 2 THEN YEAR
                WHEN 3 THEN ' ��ü�հ�'
        END "�г�",
        COUNT(*) "�ο�",
        GROUPING_ID(DEPT_ID, YEAR) "��Ʈ����"
  FROM  STUDENT
 GROUP  BY CUBE(DEPT_ID, YEAR)
 ORDER  BY DEPT_ID;
 
 
 
  
 
 

/*
    �ںм��Լ� (window�Լ�)
    �����͸� �м��ϱ� ���� �Լ��̸�, ���� ����� ������� ��ü�׷��� �ƴ� �ұ׷캰�� �� �࿡ ���� ��� ���� ��ȯ�� �� �ִ�.
    �м��Լ��� �����Լ��� �޸� �м��Լ��� �׷��� �����Ͽ� ����� �����Ѵ�.
    
    �� COUNT(*), COUNT(Į����)      : ��ü �Ǵ� Į���� ���� �� ��ȯ
    �� MAX(Į����)                  : Į���� �ִ��� ��ȯ
    �� MIN(Į����)                  : Į���� �ּڰ��� ��ȯ
    �� SUM(Į����)                  : Į���� �հ踦 ��ȯ
    �� AVG(Į����)                  : Į���� ����� ��ȯ
    �� STDDEV(Į����)               : Į���� ǥ��ǥ�������� ��ȯ
    �� VARIANCE(Į����)             : Į���� �л��� ��ȯ
    �� RANK()                       : �� �׷쿡�� ���� ������ ���
    �� DENSE_RANK()                 : Į���̳� ǥ���Ŀ� ���Ͽ� ���� ���, 1�� ����
    �� COME_DIST()                  : ���� �׷쿡 �ִ� ���� ���� ������ ���
    �� PERCENT_RANK()               : �׷� ���� ���� ���� ���� �ۼ�Ʈ�� ��ȯ
    �� NTITLE(n)                    : ��°���� ������ �׷� ���� n���� ������ ���
    �� ROW_NUMBER()                 : PARTITION BY ���� ���İ���� ������ �ο�
    �� FIRST_VALUE()                : ORDER BY���� ���ĵ� �׷쿡�� ù��° ���� ��ȯ
    �� LAST_VALUE()                 : ORDER BY���� ���ĵ� �׷쿡�� ������ ���� ��ȯ
    �� LAG(�÷���, n)               : Į���� ���� �� �������� n ���� �� ���� ��ȯ
    �� LEAD(Į����, n)              : Į���� ���� �� �������� n ������ ���� ��ȯ
    
*/


/*
    �� �м��Լ� �뵵�� ���� �з�
    [����м�]  : COUNT(), MAX(), MIN(), SUM(), AVG()
    [�������]  : RANK(), DENSE_RANK(), ROW_NUMBER()
    [�����м�]  : FIRST_VALUE(), LAST_VALUE(), LAG(), LEAD()
    [���м�]  :  STD_DEV(), VARIANCE()
    [�׷����]  : COME_DIST(), PERCENTER_RANK(), NTITLE()
    
*/


/*

    �����Լ��� �м��Լ��� ����
    
    �� �����Լ� ����
    ||  �����Լ���(expr, ...) WITHIN GROUP (
                    ORDER BY <�� ǥ��> [ASC | DESC], ...
                    [NULLS FIRST | NULLS LAST] [, ...] )
                    
    
    �� �м��Լ� ����
    ||  �м��Լ���() OVER ( <PARTITIOM BY ǥ����1>
                            <ORDER BY ǥ����2 [ASC | DESC]>
                            <window��> )
                            
                            
                           
*/


--����) 9.15 STUDENT ���̺��� �̿��Ͽ�, �а���, �г⺰ �ο����� ����Ͽ� ����Ͻÿ�.
SELECT 
        DEPT_ID,
        YEAR,
        COUNT(*) OVER(PARTITION BY DEPT_ID, YEAR) "�ο���"
  FROM  STUDENT
 GROUP  BY  DEPT_ID, YEAR
 ORDER  BY 1, 2;



--����) SG_SCores ���̺��� �̿��Ͽ� ���� ������� �л����� ���� ��������� ����Ͽ� ����Ͻÿ�.
SELECT  * FROM SG_SCores;

SELECT UNIQUE
        COURSE_ID,
        COUNT(*) OVER(PARTITION BY COURSE_ID) "�л� ��",
        AVG(SCORE) OVER(PARTITION BY COURSE_ID) "���� ���"
  FROM  SG_SCORES
 ORDER  BY  1;
 
       
        
/*
    ������ ���� RANK() / DENSE_RANK()
    
    �� �����Լ� ����
    ||  �����Լ���(expr, ...) WITHIN GROUP (
                    ORDER BY <�� ǥ��> [ASC | DESC], ...
                    [NULLS FIRST | NULLS LAST] [, ...] )
                    
    
    �� �м��Լ� ����
    ||  �м��Լ���() OVER ( <PARTITIOM BY ǥ����1>
                            <ORDER BY ǥ����2 [ASC | DESC]>
                            <window��> )
                            
*/


--���� 9.17) SG_SCORES ���̺��� 'C1701' �й��� ���� ������ ���Ͽ�
--          ������ 86���� ���� ������ ���� ������ ����Ͻÿ�
SELECT
        COURSE_ID,
        STUDENT_ID,
        SCORE,
        RANK()       OVER(ORDER BY SCORE DESC) "����",
        DENSE_RANK() OVER(ORDER BY SCORE DESC) "����",
        ROW_NUMBER() OVER(ORDER BY SCORE DESC) "����"
  FROM  SG_SCORES
 WHERE  STUDENT_ID = 'C1701';
 
 
--����9.19) SG_SCORES ���̺��� �й��� ������ �̿��Ͽ� ������ ���ϰ�,
--          [�й�, ����, ���, ����]�� ���������� ����Ͻÿ�.
SELECT * FROM SG_SCORES;

SELECT
        STUDENT_ID,
        SUM(SCORE) "����",
        FLOOR(AVG(SCORE)) "���",
        RANK() OVER(ORDER BY SUM(SCORE) DESC) "����"
  FROM  SG_SCORES
 WHERE  SCORE IS NOT NULL
 GROUP  BY STUDENT_ID
 ORDER  BY 4;
 
 
SELECT UNIQUE
        STUDENT_ID,
        COUNT(*) OVER(PARTITION BY STUDENT_ID) "���� ��"
  FROM  SG_SCORES;
  
  

--����9.21) SG_SCORES ���̺��� ������ �̿��Ͽ� ��ü������ ���� ������ �����ڵ庰 ���������� ����Ͻÿ�.
SELECT * FROM SG_SCORES;

SELECT
        STUDENT_ID,
        COURSE_ID,
        SCORE,
        RANK()      OVER(ORDER BY SCORE DESC) "��ü����",
        RANK()      OVER(PARTITION BY COURSE_ID ORDER BY SCORE DESC)"���� ����"
  FROM  SG_SCORES
 WHERE  SCORE IS NOT NULL
 ORDER  BY  2, 5;
        
 

--����9.22) SG_SCORES ���̺��� 'C1601', 'C1602' �й��� ���� ������ ���� ���������� ����Ͻÿ�.
SELECT
        STUDENT_ID,
        SCORE,
        SUM(SCORE)      OVER(PARTITION BY STUDENT_ID ORDER BY COURSE_ID) "���� ����"
  FROM  SG_SCORES
 WHERE  STUDENT_ID IN ('C1601', 'C1602');
 
 
