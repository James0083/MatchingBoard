DROP TABLE ShopGame CASCADE CONSTRAINTS;
DROP TABLE Shop CASCADE CONSTRAINTS;
DROP TABLE Game CASCADE CONSTRAINTS;
DROP TABLE Schedule CASCADE CONSTRAINTS;
DROP TABLE LikeRoom CASCADE CONSTRAINTS;
DROP TABLE Roompeople CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;

CREATE TABLE Member (
    userid VARCHAR2(40) NOT NULL,
    profile_img VARCHAR2(500),
    nickname VARCHAR2(30) NOT NULL,
    area NUMBER(10),
    grade NUMBER(3) DEFAULT 0 NOT NULL,
    exp NUMBER(5) DEFAULT 0 NOT NULL,
    manner NUMBER(3,1) DEFAULT 30 NOT NULL,
    fgenre1 VARCHAR2(15),
    fgenre2 VARCHAR2(15),
    fgenre3 VARCHAR2(15),
    fgame1 VARCHAR2(60),
    fgame2 VARCHAR2(60),
    fgame3 VARCHAR2(60),
    attend NUMBER(3) DEFAULT 0 NOT NULL,
    late NUMBER(3) DEFAULT 0 NOT NULL,
    absent NUMBER(3) DEFAULT 0 NOT NULL,
    PRIMARY KEY (userid)
);

CREATE TABLE Room (
    roomid VARCHAR2(40) NOT NULL,
    rname VARCHAR2(60) NOT NULL,
    rplace VARCHAR2(60) NOT NULL,
    shopid VARCHAR2(40),
    rmaxpeople NUMBER(2) NOT NULL,
    rgenre VARCHAR2(15) NOT NULL,
    rgame VARCHAR2(60),
    rstr VARCHAR2(3000),
    rdatetime varchar2(20) DEFAULT to_char(SYSDATE, 'YYYY-MM-DD HH24:MI') NOT NULL,
    PRIMARY KEY (roomid),
    FOREIGN KEY (shopid) REFERENCES Shop(shopid)
);

CREATE TABLE Roompeople (
    roomuserid VARCHAR2(40) NOT NULL,
    userid VARCHAR2(40) NOT NULL,
    roomid VARCHAR2(40) NOT NULL,
    PRIMARY KEY (roomuserid),
    FOREIGN KEY (userid) REFERENCES Member(userid),
    FOREIGN KEY (roomid) REFERENCES Room(roomid)
);

CREATE TABLE LikeRoom (
    likeid VARCHAR2(40) NOT NULL,
    userid VARCHAR2(40) NOT NULL,
    roomid VARCHAR2(40) NOT NULL,
    PRIMARY KEY (likeid),
    FOREIGN KEY (userid) REFERENCES Member(userid),
    FOREIGN KEY (roomid) REFERENCES Room(roomid)
);

CREATE TABLE Game (
    name VARCHAR2(60) NOT NULL,
    explane VARCHAR2(2000) NOT NULL,
    minpeople NUMBER(1) NOT NULL,
    maxpeople NUMBER(2) NOT NULL,
    playtime NUMBER(3) NOT NULL,
    genre VARCHAR2(15) NOT NULL,
    dlevel NUMBER(1) NOT NULL,
    pubYear NUMBER(4) NOT NULL,
    age NUMBER(2) NOT NULL,
    youtube_link VARCHAR2(1000),
    namu_link VARCHAR2(1000),
    shop_link VARCHAR2(1000),
    gimage VARCHAR2(500),
    PRIMARY KEY (name)
);

CREATE TABLE Shop (
    shopid VARCHAR2(40) NOT NULL,
    sname VARCHAR2(60) NOT NULL,
    saddr VARCHAR2(150) NOT NULL,
    smenu_img VARCHAR2(500),
    price_img VARCHAR2(500),
    hour_price NUMBER(4),
    unlim_price NUMBER(4),
    stars NUMBER(3,1) NOT NULL,
    PRIMARY KEY (saddr)
);

CREATE TABLE ShopGame (
    name VARCHAR2(60),
    saddr VARCHAR2(150),
    FOREIGN KEY (name) REFERENCES Game(name),
    FOREIGN KEY (saddr) REFERENCES Shop(saddr)
);
