-- Episode 5. 테이블 설계


-- 예제 5.01
create table Department (
    Dept_ID varchar2(10) not null,
    Dept_name varchar2(25) null,
    Dept_tel varchar2(12) null
    );

-- 예제 5.02
desc department;

--예제 5.03
select * from tab;
    -- ORA-00955 : 기존의 객체가 이름을 사용하고 있습니다.


-- 기본 키 정의 
-- Constraint 제약조건 명 primary key (칼럼명1, 칼럼명2, ... ... );

--예제 5.05
drop table department;
create table Department (
    Dept_ID varchar2(10) not null,
    Dept_name varchar2(25) null,
    Dept_tel varchar2(12) null,
    constraint department_pk primary key (dept_id)
    );
    


-- 예제 5.06
create table SG_Scores (
    Student_id varchar2(7) not null,
    Course_id varchar2(5) not null,
    Score number(3) null,
    Grade varchar2(2) null,
    Score_Assigned DATE,
    
    constraint SG_Scores_pk primary key (Student_id, Course_id)
);


-- 외부 키 정의 in Create Table Query
    -- Constraint 제약조건명 foreign key (컬럼명1, 컬럼명2, ... ... ) references 참조테이블명 (컬럼명1, 컬럼명2, ... ...);
    
    
    
-- 예제 5.07
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

--예제 5.08
create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department,
    telephone varchar(12)
);


desc professor;

-- 예제 5.09 (PK가 없을 경우 에러 발생)
alter table Professor drop primary key cascade;

create table Course (
    course_id varchar2(5) primary key,
    title varchar2(50),
    c_number number(1) not null,
    Professor_id varchar2(3) constraint student_fk references Professor
);


-- 예제 5.10
drop table professor;

create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12)
);


-- 예제 5.11
drop table professor;
create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null,
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12) CONSTRAINT professor_uk unique
);





-- 예제 5.12
drop table professor;

create table Professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null constraint professor_ck check (position in ('교수', '부교수', '조교수', '초빙교수') ), 
    dept_id constraint Professor_fk references department on delete cascade,
    telephone varchar(12) CONSTRAINT professor_uk unique
);


-- 예제 5.13
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


-- 예제 5.14 : 테이블에 컬럼 추가하기
alter table professor
add (
    Email varchar2(60),
    duty varchar2(10),
    mgr varchar2(3)
);

desc professor;



-- 예제 5.15 : 테이블 컬럼 수정하기 : 줄이기
-- 테이블의 값이 비어있을 때
-- 테이블의 값이 저장된 경우에는 모두 널 값이 저장된 컬럼
alter table department
modify (
    dept_name varchar2(15)
);


-- 예제 5.16 : 테이블 컬럼 수정하기 : 늘리기
-- 조건없이 늘릴 수 있다.
alter table department
modify(
    dept_name varchar2(30)
);


-- 예제 5.17 : null을 not null로 변경하기
-- 테이블의 값이 비어 있을 때
-- 테이블의 값이 저장된 경우에는 널 값이 없는 컬럼
alter table department
modify(
    dept_name varchar2(30) not null
);


desc department;



-- 예제 5.19 : 기본 키 삭제하기
-- 조건  :  외부 키로 관계가 정의되어 있지 않은 테이블의 기본 키
alter table sg_scores
drop primary key;

-- 예제 5.20 
-- professor 테이블의 dept_id 칼럼이 department 테이블의 기본 키와 외부 키로 참조되고 있는 department 테이블의 기본키를 삭제하시오.
alter table department
drop primary key;
-- 에러 발생 : 외부 키 참조 중

-- 예제 5.21
-- cascade절 : 외부키로 관계가 정의 된 테이블의 기본키를 강제로 삭제할 수 있다. 강제로 기본키를 삭제할 경우
-- 이 테이블을 참조하는 외부 키는 자동으로 삭제된다.

alter table department
drop primary key cascade;

-- 예제 5.22 : 기본 키추가하기
-- 테이블의 값이 비어있을 때
-- 테이블의 칼럼에 널 값 또는 중복된 데이터가 없을 때

alter table department
add primary key (dept_id);

-- 예제 5.23 : 외부 키 추가하기
-- 테이블의 값이 비어 있을 때
-- 테이블의 값이 저장되어 있을 때는 외부 키 칼럼이 널 값이거나 참조하는 테이블의 기본 키 값을 만족할 때

select course_id, title, c_number, professor_id from course;

select professor_id, name, position from professor;
-- 값이 없음

alter table course
add constraint course_fk foreign key (professor_id) references professor;
-- professor의 부모키가 없다는 에러를 확인 


-- 예제 5.24 : professor 테이블의 dept_id 칼럼을 department 테이블을 참조하여 외부키로 지정
select
    professor_id,
    name,
    position,
    dept_id
from professor;

select * from department;

alter table professor
add CONSTRAINT professor_fk foreign key (dept_id) references department;
-- department의 pk를 professor의 dept_id에게 외래키로 지정


-- 예제 5.25 : professor 테이블에 지정된 외부 키를 삭제하시오. 
alter table professor
drop constraint professor_fk;

-- 예제 5.26 : professor 테이블의 position 칼럼에 check 제약조건을 삭제하시오.
alter table professor
drop constraint professor_ck;

-- 예제 5.27 : professor 테이블에서  Email 칼럼을 삭제하시오.
alter table professor
drop column email;

desc professor;

-- 예제 5.28 : professor 테이블에서 telephone 컬럼을 tel_no로 컬럼명을 변경하시오.
alter table professor
rename column telephone to tel_no;

desc professor;


-- 예제 5.29 : student 테이블을 삭제하시오
drop table student;

    /*
    테이블 삭제가 불가능한 경우
        ◎ 다른 테이블의 외부 키에 의해서 참조되고 있을 때 삭제 불가
    */
    


--예제 5.30 : professor 테이블의 dept_id 칼럼이 department 테이블과 외부키로 지정한 department테이블을 삭제하시오.
alter table professor
add constraint professor_fk foreign key (dept_id) references department;

drop table department; -- 외래 키에 의해 참조되고 있는 고유/기본 키가 테이블에 있기 때문에 삭제 불가 에러

drop table department cascade CONSTRAINTS; -- cascade를 사용하여 강제삭제



/*
    § RECYCLEBIN 임시테이블
        = drop을 통하여 테이블을 삭제한 경우 복구 가능한 임시 테이블이 휴지통에 생성된다.
        = 임시테이블을 조회, 삭제하거나 복구할 수 있다.
        
        alter system set recyclebin = on / off 를 통하여 임시테이블의 생성/미생성을 설정할 수 있다.
*/




-- 예제 5.31 삭제된 테이블에 대한 휴지통의 임시테이블을 조회하시오.
show recyclebin;

-- 예제 5.32 : 예제 5.29에서 삭제한 student 테이블을 복구하시오
flashback table student to before drop;

-- 예제 5.33 : 휴지통의 임시테이블을 모두 삭제하시오
purge recyclebin;


-- 예제 5.34 : course 테이블을 t_course 테이블명으로 변경하시오
rename course to t_course;



-- 예제 5.35 : 사용자가 생성한 객체명을 모두 출력하시오.
select * from user_catalog;

-- 예제 5.36 : professor 테이블을 생성하고,  professor 테이블의 제약조건들을 모두 출력하시오.
drop table professor purge;

create table professor (
    professor_id varchar2(3) primary key,
    name varchar2(20) not null,
    position varchar2(10) not null constraint professor_ck CHECK (position in ('교수','부교수','조교수','초빙교수')),
    telephone varchar2(12) constraint professor_uk unique
);

select constraint_name, constraint_type, search_condition from user_constraints where table_name='professor';



