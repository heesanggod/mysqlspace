-- 학사관리 시스템

-- 회원가입 가능 - 아이디, 비밀번호 비밀번호 확인, 이름, 학과, 학번이메일, 전화번호, 주소 입력 받아야한다
-- 로그인 - 아이디, 비밀번호 입력 받아 로그인한다.
-- 회원 정보 보기 - 이름, 학과, 학번을 조회하 수 있어야한다.
-- 회원 정보 수정 - 학과, 학번, 이메일, 전화번호, 주소,  프로필 사진을 수정할 수 있어야한다.
-- Q&A 작성 - 카테고리, 제목 내용을 입력해야한다.
-- Q&A 보기 - 카테고리, 제목 내용, 작성일, 작성자 이름, 학과, 프로필 사진을 보여줘야한다.
-- Q&A 댓글 - 내용을 입력해야한다.
-- Q&A 댓글 보기 - 내용, 작성일, 작성자 이름, 학과, 프로필 사진을 보여줘야한다.


-- Entity : 회원, Q&A, Q&A 댓글




-- Attribute : 
-- 회원의 속성 : 아이디, 비밀번호, 이름, 학과, 학번, 이메일, 전화번호, 주소, 프로필사진
-- Q&A의 속성 : 카테고리, 제목, 내용, 작성일, 작성자 이름, 학과, 프로필 사진
-- Q&A 댓글의 속성 : 내용, 작성일, 작성자 이름, 학과, 프로필 사진




-- Relationship : 
-- 				 회원이 Q&A를 작성한다. 회원 1 : n Q&A /
--   								회원은 반드시 Q&A를 작성할 필요는 없다.
--  								Q&A는 반드시 회원에 의해 작성되어야한다.
--  			 회원이 Q&A 댓글을 작성한다. / 회원 1: n Q&A / 
-- 									   회원은 반드시 Q&A 댓글을 작성할 필요는 없다.
-- 									   Q&A 댓글은 반드시 회원에 의해 작성되어야한다.
--  			 Q&A는 Q&A 댓글을 포함된다. / Q&A 1 : n Q&A 댓글 / 
-- 		 								Q&A는 반드시 Q&A 댓글을 포함할 필요는 없다.
--  									Q&A 댓글은 반드시 Q&A에 포함되어야한다.

-- 회원이 Q&A에 댓글을 단다. / 회원 n : m Q&A / 
--  					  회원은 반드시 Q&A 댓글을 작성할 필요는 없다.
--  					  Q&A는 반드시 회원에의해 댓글이 작성될 필요는 없다.



-- 학생

-- 학과이름 학과전화번호 학번 학생이름
-- 경영학 051-200-1111 123456 홍길동   -  데이터가 삭제됬다 하더라도 경영학과는 남아있음  -- 삭제이상
-- 경영학 051-200-1111 123457 김철수
-- 빅데이터학 051-200-1111 




-- BCNF : 3정규형이 이루어진, 모든 함수 종족성이 후보키에 대해선 종속
-- 제4정규형 : BCNF를 만족하면서, 다치 종속을 제거
-- 제5정규형 : 모든 종속이 조인 종속에 기반하여야함


