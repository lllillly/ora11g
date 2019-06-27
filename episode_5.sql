-- Episode 5. ���̺� ����


-- ���� 5.01
create table Department (
    Dept_ID varchar2(10) not null,
    Dept_name varchar2(25) null,
    Dept_tel varchar2(12) null
    );

-- ���� 5.02
desc department;

--���� 5.03
select * from tab;
    -- ORA-00955 : ������ ��ü�� �̸��� ����ϰ� �ֽ��ϴ�.


-- �⺻ Ű ���� 
-- Constraint �������� �� primary key (Į����1, Į����2, ... ... );

--���� 5.05
drop table department;
create table Department (
    Dept_ID varchar2(10) not null,
    Dept_name varchar2(25) null,
    Dept_tel varchar2(12) null,
    constraint department_pk primary key (dept_id)
    );
    


-- ���� 5.06
create table SG_Scores (
    Student_id varchar2(7) not null,
    Course_id varchar2(5) not null,
    Score number(3) null,
    Grade varchar2(2) null,
    Score_Assigned DATE,
    
    constraint SG_Scores_pk primary key (Student_id, Course_id)
);


-- �ܺ� Ű ���� in Create Table Query
    -- Constraint �������Ǹ� foreign key (�÷���1, �÷���2, ... ... ) references �������̺�� (�÷���1, �÷���2, ... ...);
    
    
    
-- ���� 5.07
create table student (
    dept_id varchar2(10),
    Year varchar2(1),
    student_id varchar(7),
    name varchar2(20) not null,
    id_number varchar2(14) not null,
    address varchar2(40),
    
    constraint student_pk primary key(student_id),
    CONSTRAINT student_deptID_fk foreign key (dept_id) references department(dept_id)
);

--���� 5.08
create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department,
    telephone varchar(12)
);


desc professor;

-- ���� 5.09 (PK�� ���� ��� ���� �߻�)
alter table Professor drop primary key cascade;

create table Course (
    course_id varchar2(5) primary key,
    title varchar2(50),
    c_number number(1) not null,
    Professor_id varchar2(3) constraint student_fk references Professor
);


-- ���� 5.10
drop table professor;

create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12)
);


-- ���� 5.11
drop table professor;
create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12) CONSTRAINT professor_uk unique
);





-- ���� 5.12
drop table professor;

create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null constraint professor_ck check (position in ('����', '�α���', '������', '�ʺ�����') ), 
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12) CONSTRAINT professor_uk unique
);


-- ���� 5.13
create table course(
    course_id varchar2(5) primary key,
    title varchar2(20) not null,
    c_number number(1) default 3,
    professor_id varchar2(3)
);

insert into course
(course_id, title, professor_id)
values
('L1031', 'SQL', 'P12');

select * from course;


-- ���� 5.14 : ���̺� �÷� �߰��ϱ�
alter table professor
add (
    Email varchar2(60),
    duty varchar2(10),
    mgr varchar2(3)
);

desc professor;



-- ���� 5.15 : ���̺� �÷� �����ϱ� : ���̱�
-- ���̺��� ���� ������� ��
-- ���̺��� ���� ����� ��쿡�� ��� �� ���� ����� �÷�
alter table department
modify (
    dept_name varchar2(15)
);


-- ���� 5.16 : ���̺� �÷� �����ϱ� : �ø���
-- ���Ǿ��� �ø� �� �ִ�.
alter table department
modify(
    dept_name varchar2(30)
);


-- ���� 5.17 : null�� not null�� �����ϱ�
-- ���̺��� ���� ��� ���� ��
-- ���̺��� ���� ����� ��쿡�� �� ���� ���� �÷�
alter table department
modify(
    dept_name varchar2(30) not null
);


desc department;



-- ���� 5.19 : �⺻ Ű �����ϱ�
-- ����  :  �ܺ� Ű�� ���谡 ���ǵǾ� ���� ���� ���̺��� �⺻ Ű
alter table sg_scores
drop primary key;

-- ���� 5.20 
-- professor ���̺��� dept_id Į���� department ���̺��� �⺻ Ű�� �ܺ� Ű�� �����ǰ� �ִ� department ���̺��� �⺻Ű�� �����Ͻÿ�.
alter table department
drop primary key;
-- ���� �߻� : �ܺ� Ű ���� ��

-- ���� 5.21
-- cascade�� : �ܺ�Ű�� ���谡 ���� �� ���̺��� �⺻Ű�� ������ ������ �� �ִ�. ������ �⺻Ű�� ������ ���
-- �� ���̺��� �����ϴ� �ܺ� Ű�� �ڵ����� �����ȴ�.

alter table department
drop primary key cascade;

-- ���� 5.22 : �⺻ Ű�߰��ϱ�
-- ���̺��� ���� ������� ��
-- ���̺��� Į���� �� �� �Ǵ� �ߺ��� �����Ͱ� ���� ��

alter table department
add primary key (dept_id);

-- ���� 5.23 : �ܺ� Ű �߰��ϱ�
-- ���̺��� ���� ��� ���� ��
-- ���̺��� ���� ����Ǿ� ���� ���� �ܺ� Ű Į���� �� ���̰ų� �����ϴ� ���̺��� �⺻ Ű ���� ������ ��

select course_id, title, c_number, professor_id from course;

select professor_id, name, position from professor;
-- ���� ����

alter table course
add constraint course_fk foreign key (professor_id) references professor;
-- professor�� �θ�Ű�� ���ٴ� ������ Ȯ�� 


-- ���� 5.24 : professor ���̺��� dept_id Į���� department ���̺��� �����Ͽ� �ܺ�Ű�� ����
select
    professor_id,
    name,
    position,
    dept_id
from professor;

select * from department;

alter table professor
add CONSTRAINT professor_fk foreign key (dept_id) references department;
-- department�� pk�� professor�� dept_id���� �ܷ�Ű�� ����


-- ���� 5.25 : professor ���̺� ������ �ܺ� Ű�� �����Ͻÿ�. 
alter table professor
drop constraint professor_fk;

-- ���� 5.26 : professor ���̺��� position Į���� check ���������� �����Ͻÿ�.
alter table professor
drop constraint professor_ck;

-- ���� 5.27 : professor ���̺���  Email Į���� �����Ͻÿ�.
alter table professor
drop column email;

desc professor;

-- ���� 5.28 : professor ���̺��� telephone �÷��� tel_no�� �÷����� �����Ͻÿ�.
alter table professor
rename column telephone to tel_no;

desc professor;


-- ���� 5.29 : student ���̺��� �����Ͻÿ�
drop table student;

    /*
    ���̺� ������ �Ұ����� ���
        �� �ٸ� ���̺��� �ܺ� Ű�� ���ؼ� �����ǰ� ���� �� ���� �Ұ�
    */
    


--���� 5.30 : professor ���̺��� dept_id Į���� department ���̺�� �ܺ�Ű�� ������ department���̺��� �����Ͻÿ�.
alter table professor
add constraint professor_fk foreign key (dept_id) references department;

drop table department; -- �ܷ� Ű�� ���� �����ǰ� �ִ� ����/�⺻ Ű�� ���̺� �ֱ� ������ ���� �Ұ� ����

drop table department cascade CONSTRAINTS; -- cascade�� ����Ͽ� ��������



/*
    �� RECYCLEBIN �ӽ����̺�
        = drop�� ���Ͽ� ���̺��� ������ ��� ���� ������ �ӽ� ���̺��� �����뿡 �����ȴ�.
        = �ӽ����̺��� ��ȸ, �����ϰų� ������ �� �ִ�.
        
        alter system set recyclebin = on / off �� ���Ͽ� �ӽ����̺��� ����/�̻����� ������ �� �ִ�.
*/




-- ���� 5.31 ������ ���̺� ���� �������� �ӽ����̺��� ��ȸ�Ͻÿ�.
show recyclebin;

-- ���� 5.32 : ���� 5.29���� ������ student ���̺��� �����Ͻÿ�
flashback table student to before drop;

-- ���� 5.33 : �������� �ӽ����̺��� ��� �����Ͻÿ�
purge recyclebin;


-- ���� 5.34 : course ���̺��� t_course ���̺������ �����Ͻÿ�
rename course to t_course;



-- ���� 5.35 : ����ڰ� ������ ��ü���� ��� ����Ͻÿ�.
select * from user_catalog;

-- ���� 5.36 : professor ���̺��� �����ϰ�,  professor ���̺��� �������ǵ��� ��� ����Ͻÿ�.
drop table professor purge;

create table professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null constraint professor_ck CHECK (position in ('����','�α���','������','�ʺ�����')),
    telephone varchar2(12) constraint professor_uk unique
);

select constraint_name, constraint_type, search_condition from user_constraints where table_name='professor';



