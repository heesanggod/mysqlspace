-- 주석 (-- 띄워쓰기 해야함)
#주석
#sql의 명령어는 대소문자 구분이 없지만, 나중에 필드명과의 구분을 위해 명령어는 대문자로 고정하면 편함

-- DDL (데이터 정의어)
-- 데이터베이스, 테이블, 인덱스, 사용자를 정의하는데 사용되는 언어

-- CREATE: 구조를 생성하는 명령어
-- CREATE 생성할구조 구조이름 [ ... 구조 정의];

-- 데이터베이스 생성
CREATE DATABASE practice_sql;
-- 특정 데이터베이스 사용
USE practice_sql;

-- 테이블 생성
CREATE TABLE example_table(
	-- VARCHAR(문자열길이): 가변길이 문자열 / 인덱스 사용 가능
	string_column VARCHAR(100),
    -- TEXT: 장문의 문자열 / 인덱스 사용 불가능
    text_column TEXT,
    -- INT: 정수
    int_column INT,
    -- DOUBLE: 실수
    double_column DOUBLE,
    -- FLOAT: 실수
    float_column FLOAT,
    -- BOOLEAN:
    boolean_column BOOLEAN,  -- boolean_column tinyint(1) 정수 형태로 저장됨
    -- DATE: 날짜
    date_column DATE,
    -- DATETIME: 날짜 및 시간
    datetime_column DATETIME
);

-- 사용자 생성
-- CREATE USER '사용자명'@'접속IP' IDENTIFIED BY '비밀번호';
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'root!';

-- 생성된 사용자 보기
USE mysql;
SELECT user, host FROM user;
-- SELECT * FROM user; 전체 다보여줌

-- DROP: 데이터 구조를 삭제하는 명령어

-- 테이블 삭제
DROP TABLE example_table;

-- 데이터베이스 삭제
DROP DATABASE practice_sql;

-- ALTER: 데이터 구조를 변경하는 명령어

-- 테이블 컬럼 추가
ALTER TABLE example_table
 ADD added_column INT;

-- 테이블 컬럼 삭제
ALTER TABLE example_table
DROP COLUMN added_column;

-- 테이블 컬럼 타입 수정
ALTER TABLE example_table
MODIFY COLUMN string_column VARCHAR(200);

-- 테이블 컬럼 이름 수정
ALTER TABLE example_table
CHANGE string_column varchar_column VARCHAR(200);






