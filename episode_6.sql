-- 예제 6.01 : Department 테이블의 모든 데이터를 출력하시오.
select
    dept_id,
    dept_name,
    dept_tel
from department;



-- 예제 6.02 : professor 테이블의 중복되지 않는 dept_id 칼럼의 값들을 출력하시오.

select distinct
    dept_id
from professor;

/*
    SELECT문의 주요사항
    ● SELECT절과 FROM절은 필수절 이고, 나머지는 선택절이다.
    ● 절의 기술 순서는 고정이다.
    ● HAVING절은 GROUP BY절이 기술될 때만 사용할 수 있다.
    ● SELECT문의 결과 행의 수는 0행, 한 행, 복수 행 모두 정상적으로 실행된다.
    ● SELECT문의 실행 결과는 화면에 출력된다.
*/

-- 예제 6.03 : Professor 테이블의 중복되지 않는 dept_id 칼럼의 값들을 출력하시오. 단 제목은 "소속학과"로 출력한다.
select unique
    dept_id "소속학과"
from professor;


-- 예제 6.04 : Course테이블에서 과목코드(Course_ID), 과목명(Title), 학점(C_Number)를 출력하시오.
select
    course_id "과목코드",
     title "과목명",
     c_number "학점"
from course;


/*
    ORDER BY 절에 출력순서 지정
    - 오름차순 정렬 : ASC
    - 내림차순 정렬 : DESC

    사용형식 :  ORDER BY 칼럼명1 [ASC | DESC], 컬럼명2 [ASC | DESC] ...
                        순서번호1 [ASC | DESC], 순서번호2 [ASC | DESC] ...
                        
    ★ 주의. order by 절에 사용되는 칼럼명은 alias로 사용될 수 없으며, 컬럼명을 사용해야 한다.
*/

-- 예제 6.05 : course테이블에서 과목코드(course_id), 과목명(title), 학점(c_number)를 과목명(title) 오름차순으로 출력하시오.
select
    course_id "과목코드",
    title "과목명",
    c_number "학점"
from course
order by title asc;


--예제 6.06 : course테이블에서 과목코드(course_id), 과목명(title), 학점(c_number), 과목별 수강료(학점 * 30000 + 추가수강료)를 출력하되,
--과목별 수강료를 내림차순, 과목코드는 오름차순으로 출력하시오.

select
    course_id "과목코드",
    title "과목명",
    c_number "학점",
    c_number * 30000 + nvl(course_fees, 0) "과목별 수강료"
from course
order by 4 desc, course_id asc;

/*
    ★★★ nvl(A, B) 함수는 A의 값이 null일 때 B를 반환하고, A값이 null값이 아닐 경우엔 A를 반환한다.
*/


/*
    -WHERE 절은 from절에 기술된 테이블에서 일부 데이터나 특정 데이터를 검색하기 위한 조건을 지정
    
    사용형식 : WHERE expr1 연산자 expr2
*/


--예제 6.07 : professor테이블로부터 '컴공'학과의 교수명을 출력하시오.
select
    professor_id,
    name,
    position,
    dept_id
from professor
where dept_id='컴공';


--예제 6.08 : Course테이블로부터 추가 수강료가 30000원 이상인 과목명을 출력하되, 추가 수강료를 내림차순으로 출력하시오.
select
    course_id,
    title,
    c_number,
    course_fees
from course
where course_fees >= 30000
order by course_fees desc;


--예제 6.09 Student 테입즐에서 '컴공'학과 2학년 학생의 학과, 학년, 성명을 출력하시오.
select * from student; 

select
    dept_id,
    year,
    name
from student
where dept_id = '컴공';


/*
    LIKE 연산자
    - LIKE연산자는 문자열의 문자패텬에 의해서 검색할 수 있는 SQL 연산자 이다.
    - expr은 컬럼명을 기술하고, '문자패턴'에는 검색할 키워드를 대체문자와 함께 기술한다.
    
    사용형식 : expr LIKE( NOT LIKE ) '문자패턴'
    
    ★ 검색할 '문자패턴'에 사용되는 대체문자는 2종류가 있다.
    ① % 기호는 모든 문자를 대체한다.
    ② _ 기호는 한 문자를 대체한다.
*/

--예제 6.12 : student 테이블로부터 '이'씨 성의 학생 명단을 출력하시오.
select 
    dept_id,
    year,
    student_id,
    name
from student
where name LIKE '이%';


--예제 6.13 student테이블로부터 성명 칼럼의 중간글자가'정' 자인 학생을 검색하여 출력하시오.
select
    dept_id,
    year,
    student_id,
    name
from student
where name LIKE '_정_';


--예제 6.14 : student 테이블로부터 '이'씨와 '김'씨 성을 제외한 학생 명단을 출력하시오.
select
    dept_id,
    year,
    student_id,
    name
from student
where name NOT LIKE '이%'
AND name NOT LIKE '정%';


/*
    IN 연산자
    -IN연산자는 가능한 값들을 목록과 비교하여, 가능한 값의 목록 중 하나일 때 '참'이 되고, 그렇지 앟으면 '거짓'이 된다.
    
    사용형식 : expr IN  (값1, 값2, ... )
*/

-- 예제 6.15 : professor 테이블에서 학과 코드(dept_id)가 '컴공', 정통' 학과에 재직중인 교수의 명단을 학과코드 순으로 출력하시오.
select
    dept_id,
    professor_id,
    name,
    position
from professor
where dept_id IN ('컴공', '정통');
/*
    ★ IN연산자는 dept_id = '컴공' OR dept_id = '정통' 과 같이 '=' 관계연산자와  'OR'연산자를 대체하는 SQL 연산자 이다.
*/



--예제 6.16 : professor 테이블에서 학과코드(dept_id)가 '컴공', '정통'학과가 아닌 교수의 명단을 학과코드순으로 출력하시오.
select
    dept_id,
    professor_id,
    name,
    position
from professor
where dept_id NOT IN ('컴공', '정통');



/*
    BETWEEN ~ AND 연산자
    - 최솟값부터 최댓값의 범위에 포함되는가를 검색하는 SQL 연산자이다.
    
    사용형식 : expr BETWEEN 최솟값 AND 최댓값
    ★ 숫자형데이터, 문자형데이터, 날짜형데이터를 기술할 수 있다.
*/

--예제 6.17 : sg-scores 테이블에서 성적(score)이 90점부터 94점까지의 성적을 성적 내림차순으로 출력하시오.
select
    student_id,
    course_id,
    score
from sg_scores
where score between 90 and 94
order by 3 desc;


--예제 6.18 : sg_scores테이블에서 성적이 60점부터 100점까지 제외한 성적을 성적순으로 출력하시오.
select
    student_id,
    course_id,
    score
from sg_scores
where score not between 60 and 100
order by 3 desc;


/*
    IS NULL 연산자
    - IS NULL 연산자는 expr값이 Null이면 참이 되고, 그렇지 않으면 거짓이 왼다.
    
    사용형식 : expr IS NULL
*/

--예제 6.19 : course 테이블로부터 추가수강료가 null인 행을 검색하여 과목순으로 출력하시오.
select
    *
from course
where course_fees IS NULL
order by title asc;


--예제 6.20 : course 테이블로부터 추가수강료가 null이 아닌 행을 검색하여 과목명순으로 출력하시오.
select
    *
from course
where course_fees IS NOT NULL
order by title asc;


/*
    ROWNUM 의사칼럼
    - ROWNUM 의사칼럼은 from절에 기술한 테이블이나 뷰, 서브쿼리의 행 번호를 반환하는 의사칼럼이다.
    - WHERE절에 ROWNUM의사칼럼을 이용하여 TOP-N 쿼리가 가능하다.
*/

--예제 6.21 : department 테이블 출력 시 행 번호를 추가하시오.
select
    rownum,
    dept_id,
    dept_name,
    dept_tel
from department;


--예제 6.22 : department테이블에서 상위 3행을 출력하시오.
select
    rownum,
    dept_id,
    dept_name,
    dept_tel
from department
where rownum <= 3;

    


