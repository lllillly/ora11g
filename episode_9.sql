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
 
 
 
SELECT
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN DEPT_ID
                WHEN 1 THEN NULL
                WHEN 2 THEN ' 학년계'
                WHEN 3 THEN NULL
        END "학과",
        CASE 
            GROUPING_ID(DEPT_ID, YEAR)
                WHEN 0 THEN Year
                WHEN 1 THEN ' 소계'
                WHEN 2 THEN YEAR
                WHEN 3 THEN ' 전체합계'
        END "학년",
        COUNT(*) "인원",
        GROUPING_ID(DEPT_ID, YEAR) "비트백터"
  FROM  STUDENT
 GROUP  BY CUBE(DEPT_ID, YEAR)
 ORDER  BY DEPT_ID;
 
 
 
  
 
 

/*
    ★분석함수 (window함수)
    데이터를 분석하기 위한 함수이며, 쿼리 결과를 대상으로 전체그룹이 아닌 소그룹별로 각 행에 대한 계산 값을 반환할 수 있다.
    분석함수는 집계함수와 달리 분석함수용 그룹을 정의하여 계산을 수행한다.
    
    ▶ COUNT(*), COUNT(칼럼명)      : 전체 또는 칼럼의 행위 수 반환
    ▶ MAX(칼럼명)                  : 칼럼의 최댓값을 반환
    ▶ MIN(칼럼명)                  : 칼럼의 최솟값을 반환
    ▶ SUM(칼럼명)                  : 칼럼의 합계를 반환
    ▶ AVG(칼럼명)                  : 칼럼의 평균을 반환
    ▶ STDDEV(칼럼명)               : 칼럼의 표본표준편차를 반환
    ▶ VARIANCE(칼럼명)             : 칼럼의 분산을 반환
    ▶ RANK()                       : 각 그룹에서 값의 순위를 계산
    ▶ DENSE_RANK()                 : 칼럼이나 표현식에 대하여 순위 계산, 1씩 증가
    ▶ COME_DIST()                  : 값의 그룹에 있는 값의 누적 분포를 계산
    ▶ PERCENT_RANK()               : 그룹 수에 대한 값의 순위 퍼센트를 반환
    ▶ NTITLE(n)                    : 출력결과를 지정한 그룹 수로 n으로 나누어 출력
    ▶ ROW_NUMBER()                 : PARTITION BY 절의 정렬결과에 순위를 부여
    ▶ FIRST_VALUE()                : ORDER BY절의 정렬된 그룹에서 첫번째 값을 반환
    ▶ LAST_VALUE()                 : ORDER BY절의 정렬된 그룹에서 마지막 값을 반환
    ▶ LAG(컬럼명, n)               : 칼럼의 현재 행 기준으로 n 이전 행 값을 반환
    ▶ LEAD(칼럼명, n)              : 칼럼의 현재 행 기준으로 n 이후의 값을 반환
    
*/


/*
    ★ 분석함수 용도에 따른 분류
    [집계분석]  : COUNT(), MAX(), MIN(), SUM(), AVG()
    [순위계산]  : RANK(), DENSE_RANK(), ROW_NUMBER()
    [순서분석]  : FIRST_VALUE(), LAST_VALUE(), LAG(), LEAD()
    [통계분석]  :  STD_DEV(), VARIANCE()
    [그룹비율]  : COME_DIST(), PERCENTER_RANK(), NTITLE()
    
*/




 



