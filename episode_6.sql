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

