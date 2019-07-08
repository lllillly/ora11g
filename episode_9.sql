--예제 9.06)  Professor 테이블을 이용하여 학과별 교수 인원수를 출력하시오.

--SELECT * FROM PROFESSOR;

SELECT
        DEPT_ID,
        COUNT(*)
  FROM  PROFESSOR
 GROUP  BY  DEPT_ID;
 
 
--예제 9.07) Professor 테이블을 이용하여 학과별 교수 인원수가 한명인 학과를 출력하시오
SELECT
        DEPT_ID,
        COUNT(*)
  FROM  PROFESSOR
 GROUP  BY DEPT_ID
HAVING  COUNT(*) = 1;


--예제9.08) SG_SCores 테이블에서 학번별 8과목 이상 취득한 학번의 과목수와 평균을 학번순으로 출력하시오
--SELECT * FROM SG_SCORES;
SELECT
        STUDENT_ID,
        COUNT(*),
        TO_CHAR(AVG(SCORE), '99,99')
  FROM  SG_SCORES
 GROUP  BY STUDENT_ID
HAVING  COUNT(*) >= 8;



--예제 9.09) Student 테이블로부터 학과별/학년별 인원수를 계싼하여 학과별/학년별로 출력하시오.
SELECT  *   FROM STUDENT;

SELECT
        DEPT_ID,
        YEAR,
        COUNT(*) AS "인원"
  FROM  STUDENT
 GROUP  BY  DEPT_ID, YEAR
 ORDER  BY  1, 2;
 
 
--예제 9.10) STUDENT테이블로부터 학과별/학년별, 학과별, 전체 합계의 인원수를 계싼하시오.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY  ROLLUP(DEPT_ID, YEAR);
  
 
 
--예제 9.11) Student 테이블로부터 학과별/학년별 학과별, 학년별, 전체합계 인원수를 계산하시오.s
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY CUBE(DEPT_ID,YEAR);
 
 
 
/*
    GROUPING SETS -> GROUP BY절의 확장된 형태로, 하나의 GROUP BY절에 기술한 칼럼의 집계를 출력한다.
    괄호()내에 그룹핑 칼럼을 기술하면 불필요한 집계를 제거하여 각 칼럼의 그룹에 대한 집계가 출력된다.
    
    문법 : GROUP BY GROUPING SETS (칼럼명1, 칼럼명2, ... ..., )
*/

--예제 9.12) STUDENT테이블로부터 하고가별인원수와 학년별 인원수를 계산하여 출력하시오.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY GROUPING SETS (DEPT_ID, YEAR);
 
 
 
--예제 9.13) STUDENT 테이블로부터 학과별/학년별, 학과별, 학년별 인원수를 GROUPING SETS을 이용하여 출력하시오.
SELECT
        DEPT_ID,
        YEAR,
        COUNT(*)
  FROM  STUDENT
 GROUP  BY  GROUPING SETS((DEPT_ID,YEAR), DEPT_ID, YEAR);
 
 
 
/*
    그룹핑 함수
    - 그룹핑 함수는 GROUPING() 과 GROUPING_ID(), GROUP_ID()가 있다.
        그룹핑 함수들은 연산기능은 없고, 연산에 칼럼이 사용되면 0, 사용되지 않으면 1을 반환한다.
        
      ● GORUPING(expr) 함수는 expr이 ROLLUP, CUBE, GROUPING SETS 함수에서 연산의 사용 여부에 따라 0 또는 1일 반환한다.
      ● GROUPING_ID(expr, expr, ,,,) 함수는 ROLLUP, CUBE, GROUPING SETS 함수에서 expr이 연산의 사용 유무에 따라
        그룹핑 비트 백터로 0 또는 1일 반환한다. 만약 expr이 
        두 개의 칼럼[a, b]일 경우엔 
        [a사용, b사용]이면          -> [00]  -> 0
        [a사용, b사용 안함]이면     -> [01]  -> 1
        [a사용 안함, b사용]이면     -> [10)  -> 2
        [a, b사용 안함] 이면        -> [11]  -> 3
      ● GROUP_ID() 함수는 지정된 GROUP BY절 결과로부터 중복된 그룹을 구별하며, 질의 결과에서 중복된 그룹핑을 필터링 한다.
        유일한 중복 그룹을 식별하기 위해서 오라클 숫자를 반환한다.
        n이 특정 그룹핑에서 중복이 존재하면 GROUP_ID는 0~n~-1 범위의 수를 반환한다. 
*/

--예제9.14) 예제 9.11을 처리하시오.
--          단, GROUPING_ID() 함수로 DEPT_ID, YEAR 컬럼 사용 유무에 따라 '소계', '학년계', '전체합계'를 추가하여 출력하시오.
SELECT
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Dept_ID          -- 사용, 사용
                WHEN 1 THEN NULL             -- 사용, 사용안함
                WHEN 2 THEN ' 학년계'        -- 사용안함, 사용
                WHEN 3 THEN NULL             -- 사용안함, 사용안함
        END "학과코드",
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Year                    -- 사용, 사용
                WHEN 1 THEN ' 소계'                 -- 사용, 사용안함
                WHEN 2 THEN YEAR                    -- 사용안함, 사용
                WHEN 3 THEN ' 전체합계'             -- 사용안함, 사용안함
        END "학년",
        COUNT(*) "인원수",
        GROUPING_ID(DEPT_ID, YEAR) "비트백터"
  FROM  STUDENT
 GROUP  BY  CUBE(DEPT_ID, YEAR)
 ORDER  BY DEPT_ID;

