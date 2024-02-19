1.   INSERT INTO user (email, password, nickname, tel_number, address, address_detail, agreed_personal) VALUES ('email@email.com', 'P!ssw0rd', 'rose', '010-1234-5678', '부산광역시 사하구', '낙동대로', true);


2.   UPDATE user SET email = 'email@email.com'
WHERE profile_image =  'https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg';


3.   INSERT INTO board (title, contents, writer_email)
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다,' 'email2@email.com');

writer_email 의 정보가 등록되지 않은 email2@email.com 이라서 작성되지 않음


4.   INSERT INTO board (title, contents, writer_email)
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다,' 'email@email.com');


5.   


6.   



7.    SELECT board_number, title, contents, view_count, comment_count, write_datetime, writer_email, writer_profile_image, writer_nickname, favorite_count
FROM user
FULL OTHER JOIN board
ON // ON 뒤에 조건을 모르겠어요..ㅠ




8.     CREATE VIEW board_view (
AS SELECT board_number, title, contents, view_count, comment_count, write_datetime, writer_email, writer_profile_image, writer_nickname, favorite_count
FROM board_view);




9.    SELECT * FROM board_view
WHERE title AND contents LIKE '%반갑%';


   10.    CREATE INDEX board_idx01 ON dbo.board (title)