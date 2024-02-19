USE practice_sql;

-- Transaction : SQL로 작업하는 작업 단위

-- Transaction의 4가지 특성
-- Atomicity (원장성) : 트랜잭션은 모두 성공하거나 모두 실패해야 한다.
-- Consistency (일관성) : 트랜잭션의 작업 결과는 항상 일관성이 있어야 한다.
-- Isolation (독립성) : 트랜잭션은 모두 독립적이어야 한다.
-- Durability (영구성) : 트랜잭션이 성공적으로 완료되면 영구히 반영되어야 한다.

-- 회원가입 : USER - email_authentication
-- 사용자는 아이디를 입력하고 중복 확인을 함
-- 만약 입력한 아이디가 중복된 아이디가 아니라면
-- 비밀번호, 비밀번호 확인, 이메일을 입력하고
-- 이메일로 인증 번호를 전송
-- 사용자는 이메일에 전송된 인증 번호를 확인 후 입력하여
-- 이메일 인증을 진행함
-- 이메일 인증을 완료한 후에 회원가입 버튼을 눌러서 회원가입을 마무리함

CREATE TABLE user (
	id VARCHAR(100) PRIMARY KEY,
	password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE email_authentication (
	email VARCHAR(255) PRIMARY KEY,
    authentication_code VARCHAR(4) NOT NULL
);

-- 1. 아이디 중복확인
SELECT * FROM user WHERE id = 'idddd';

-- 사용자가 비밀번호를 'p!as', 비밀번호 확인을 'p!as',
-- 이메일을 'email@email.com', 서버가 생성한 코드는 'OCMD'이다.

-- 2. 이메일 인증
INSERT email_authentication VALUES ('email@email.com', 'OCMD');

-- 서버가 지정한 이메일로 인증코드를 전송하고 사용자는 그 코드를 확인한 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증 확인
SELECT * FROM email_authentication 
WHERE email = 'email@email.com' AND authentication_code = 'OCMD';

-- 4. 회원가입 처리
INSERT user VALUES ('idddd', 'p!as', 'email@email.com');

SHOW variables like '%commit%';
SET AUTOCOMMIT = 0;

-- 트랜잭션 시작
START TRANSACTION;

-- 사용자가 아이드를 iddddd로 입력했다.

-- 1. 아이디 중복확인
SELECT * FROM user WHERE id = 'idddd3';

-- 사용자가 비밀번호를 'p!as', 비밀번호 확인을 'p!as',
-- 이메일을 'email@email.com', 서버가 생성한 코드는 'OCMD'이다.

-- 2. 이메일 인증
INSERT email_authentication VALUES ('email3@email.com', 'OCMD');

-- 트랜잭션 초기상태로 변경 (트랜잭션 취소)
ROLLBACK;

-- 트랜잭션 롤백 위치 지정
SAVEPOINT A;

-- 서버가 지정한 이메일로 인증코드를 전송하고 사용자는 그 코드를 확인한 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증 확인
SELECT * FROM email_authentication 
WHERE email = 'email3@email.com' AND authentication_code = 'OCMD';

-- 4. 회원가입 처리
INSERT user VALUES ('idddd3', 'p!as', 'email3@email.com');

-- 특정 세이브 포인트로 롤백
ROLLBACK TO SAVEPOINT A;

-- 트랜잭션 성공 처리 (영구히 적용)
COMMIT;

SELECT * FROM user;
SELECT * FROM email_authentication;

-- LIMIT 개수 : 결과 테이블에서 지정한 개수만큼의 상위 데이터만 보여줌
SELECT * FROM jeju LIMIT 10;
-- LIMIT 제외 레코드 개수, 개수 : 제외 레코드 개수만큼 제외 후 개수만큼의 데이터만 보여줌
SELECT * FROM jeju LIMIT 10, 3;

--  ------------------------------------

-- 1. 아이디 중복확인
SELECT user_id FROM user WHERE user_id = 'userID';

-- 2. 이메일 인증 전송
INSERT INTO email_authentication VALUES ('email@email.com', 'QWER');

-- 3. 이메일 인증 확인
SELECT * FROM email_authentication 
WHERE email = 'email@email.com' AND authentication_code = 'QWER';

-- 4. 회원가입 처리
INSERT INTO user (user_id, password, email)
VALUES ('userID', 'p!as', 'email@eamil.com');

-- 5. 로그인 처리
SELECT user_id FROM user
WHERE user_id = 'userID' AND password = 'p!as';

-- 6. 게시물 작성
INSERT INTO qna (title, contents, writer_id)
VALUES ('질문있습니다.', '데이터는 언제 데이터인가요?', 'userID');

-- 7. 게시물 목록
-- 접수번호, 완료 상태, 제목, 작성자 아이디, 작성일, 조회수
SELECT 
	reception_number,
	reply_status,
    title,
    wirter_id,
    writer_datetime,
    view_count
FROM qna
ORDER BY reception_number DESC; 

-- 8. 관리자로 미완료 게시물 보기
SELECT 
	reception_number,
	reply_status,
    title,
    wirter_id,
    writer_datetime,
    view_count
FROM qna
WHERE reply_status IS FALSE
ORDER BY reception_number DESC;

-- 9. 검색 게시물 목록 보기
SELECT 
	reception_number,
	reply_status,
    title,
    wirter_id,
    writer_datetime,
    view_count
FROM qna
WHERE title LIKE '%질문%'
ORDER BY reception_number DESC; 

-- 10. 특정 게시물 보기
-- 제목, 작성자 아이디, 작성일, 조회수, 내용, 답변 내용
SELECT title, writer_id, write_datetime, view_count, contents, reply
FROM qna
WHERE reception_number = 1;

-- 11. 관린자로 답변 작성
UPDATE qna SET reply = '2023년 데이터입니다.', replyer_id = 'userID'
WHERE reception_number = 1;


