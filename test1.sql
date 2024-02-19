CREATE TABLE 'user' (
'email'  VARCHAR(50) NOT NULL PRIMARY KEY,
'password'  VARCHAR(100) NOT NULL,
'nickname'  VARCHAR(20) NOT NULL UNIQUE,1
'tel_number' VARCHAR(15) NOT NULL UNIQUE,
'address' TEXT NOT NULL,
'address_detail' TEXT,
'profile_image' TEXT,1
'agreed_personal' BOOLEAN

);
CREATE TABLE 'board' (
'board_number' INT PRIMARY KEY AUTO_INCREMENT,1
'title' VARCHAR(255) NOT NULL,1
'contents' TEXT NOT NULL,1
'write_ datetime' DATETIME NOT NULL DEFAULT now(),1
'favorite_count' INT NOT NULL  DEFAULT 0,
'comment_count' INT NOT NULL   DEFAULT 0,1
'view_count' INT NOT NULL  DEFAULT 0,1
'writer_email' VARCHAR(50) NOT NULL,1
CONSTRAINT `writer`
FOREIGN KEY ('writer_email')
REFERENCES 'board' . 'user' ('email')
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
);


CREATE TABLE 'comment' (
'comment_number' INT PRIMARY KEY,
'contents' TEXT NOT NULL,
'write_datetime' DATETIME NOT NULL  DEFAULT now(),
'user_email' VARCHAR(50) NOT NULL,
'borad_number' INT NOT NULL,
CONSTRAINT `writer`
FOREIGN KEY ('user_email')
REFERENCES 'board' . 'user' ('email'),
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
CONSTRAINT `board_comment`
FOREIGN KEY ('board_number')
REFERENCES 'board' . 'board' ('board_number')
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
);



CREATE TABLE 'favorite' (
'user_email' VARCHAR(50) NOT NULL PRIMARY KEY,
'board_board_number' INT NOT NULL PRIMARY KEY,
CONSTRAINT `user_favorite`
FOREIGN KEY ('user_email')
REFERENCES 'board' . 'user' ('email')
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
CONSTRAINT `board_favorite`
FOREIGN KEY ('board_board_number')
REFERENCES 'board' . 'board' ('board_number')
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
);

CREATE TABLE 'board_image' (
'sequence'  INT PRIMARY KEY AUTO_INCREMENT, 
'board_number' INT NOT NULL,
'image_url' TEXT,
CONSTRAINT `board_image`
FOREIGN KEY ('board_number')
REFERENCES 'board' . 'board' ('board_number')
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
);

CREATE TABLE 'search_log' (
'sequence' INT NOT NULL PRIMARY KEY,
'search_word' TEXT NOT NULL,
'relation_word' TEXT,
'relation' BOOLEAN NOT NULL
);
