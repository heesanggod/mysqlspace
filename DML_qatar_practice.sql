USE qatar_asian_cup;

-- 참가국에 데이터 삽입
-- 1. 대한민국, E, 위르겐 클리스만, 23
-- 2. 요르단, E, 후세인 아무타, 87

-- 경기장에 데이터 삽입
-- 1. 아흐메드 빈 알리, 45032, 카타르 알라이얀

-- 선수에 데이터 삽입
-- 1. 손흥민, 34, MF, 토트넘 홋스퍼, 7, 대한민국
-- 2. 올완, 24, FW, 알 샤말 SC, 9, 요르단

-- 게임에 데이터 삽입
-- 		schedule		 , country1, country2, stadium
-- 1. 2024-02-07 00:00:00, 요르단, 대한민국, 아흐메드 빈 알리

INSERT INTO country VALUE ('대한민국', 'E', '위르겐 클리스만', '23');
INSERT INTO country VALUE ('요르단', 'E', '후세인 아무타', '87');

SELECT * FROM country;

INSERT INTO stadium VALUE ('아흐메드 빈 알리', 45032, '카타르 알라이얀');

SELECT * FROM stadium;

INSERT INTO player VALUE ('손흥민', '34', 'MF', '토트넘 홋스퍼', '7', '대한민국');
INSERT INTO player VALUE ('올완', '24', 'FW', '알 샤말 SC', '9', '요르단');

SELECT * FROM player;

INSERT INTO game (schedule, country1, country2, stadium) VALUE ('2024-02-07 00:00:00', '요르단', '대한민국', '아흐메드 빈 알리');

SELECT * FROM game;




