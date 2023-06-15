-- 유저정보
DROP TABLE "User";

-- 모임방 인원
DROP TABLE "RoomPeople";

-- 일정
DROP TABLE "Schedule";

-- 모임방
DROP TABLE "Room";

-- 게임정보
DROP TABLE "Game";

-- 매장 보유게임
DROP TABLE "ShopGame";

-- 매장정보
DROP TABLE "Shop";

-- 유저정보
CREATE TABLE "User" (
	"userid"      VARCHAR2(100) NOT NULL, -- 유저 ID
	"profile_img" VARCHAR2(500) NULL,     -- 프로필 이미지
	"nickname"    VARCHAR2(30)  NOT NULL, -- 닉네임
	"area"        NUMBER(10)    NULL,     -- 활동지역
	"grade"       NUMBER(3)     NOT NULL DEFAULT 0, -- 등급
	"exp"         NUMBER(5)     NOT NULL DEFAULT 0, -- 경험치
	"manner"      NUMBER(3,1)   NOT NULL DEFAULT 30, -- 매너점수
	"fgenre1"     VARCHAR2(15)  NULL,     -- 선호장르1
	"fgenre2"     VARCHAR2(15)  NULL,     -- 선호장르2
	"fgenre3"     VARCHAR2(15)  NULL,     -- 선호장르3
	"fgame1"      VARCHAR2(60)  NULL,     -- 선호게임1
	"fgame2"      VARCHAR2(60)  NULL,     -- 선호게임2
	"fgame3"      VARCHAR2(60)  NULL,     -- 선호게임3
	"attend"      NUMBER(3)     NOT NULL DEFAULT 0, -- 출석
	"late"        NUMBER(3)     NOT NULL DEFAULT 0, -- 지각
	"absent"      NUMBER(3)     NOT NULL DEFAULT 0 -- 결석
);

-- 유저정보 기본키
CREATE UNIQUE INDEX "PK_User"
	ON "User" ( -- 유저정보
		"userid" ASC -- 유저 ID
	);

-- 유저정보
ALTER TABLE "User"
	ADD
		CONSTRAINT "PK_User" -- 유저정보 기본키
		PRIMARY KEY (
			"userid" -- 유저 ID
		);

-- 유저정보
COMMENT ON TABLE "User" IS '유저정보';

-- 유저 ID
COMMENT ON COLUMN "User"."userid" IS '유저 ID';

-- 프로필 이미지
COMMENT ON COLUMN "User"."profile_img" IS '프로필 이미지';

-- 닉네임
COMMENT ON COLUMN "User"."nickname" IS '닉네임';

-- 활동지역
COMMENT ON COLUMN "User"."area" IS '활동지역';

-- 등급
COMMENT ON COLUMN "User"."grade" IS '등급';

-- 경험치
COMMENT ON COLUMN "User"."exp" IS '경험치';

-- 매너점수
COMMENT ON COLUMN "User"."manner" IS '매너점수';

-- 선호장르1
COMMENT ON COLUMN "User"."fgenre1" IS '선호장르1';

-- 선호장르2
COMMENT ON COLUMN "User"."fgenre2" IS '선호장르2';

-- 선호장르3
COMMENT ON COLUMN "User"."fgenre3" IS '선호장르3';

-- 선호게임1
COMMENT ON COLUMN "User"."fgame1" IS '선호게임1';

-- 선호게임2
COMMENT ON COLUMN "User"."fgame2" IS '선호게임2';

-- 선호게임3
COMMENT ON COLUMN "User"."fgame3" IS '선호게임3';

-- 출석
COMMENT ON COLUMN "User"."attend" IS '출석';

-- 지각
COMMENT ON COLUMN "User"."late" IS '지각';

-- 결석
COMMENT ON COLUMN "User"."absent" IS '결석';

-- 유저정보 기본키
COMMENT ON INDEX "PK_User" IS '유저정보 기본키';

-- 유저정보 기본키
COMMENT ON CONSTRAINT "User"."PK_User" IS '유저정보 기본키';

-- 모임방 인원
CREATE TABLE "RoomPeople" (
	"roomid" VARCHAR2(30)  NOT NULL, -- 모임방 id
	"userid" VARCHAR2(100) NOT NULL  -- 유저 ID
);

-- 모임방 인원
COMMENT ON TABLE "RoomPeople" IS '모임방 인원';

-- 모임방 id
COMMENT ON COLUMN "RoomPeople"."roomid" IS '모임방 id';

-- 유저 ID
COMMENT ON COLUMN "RoomPeople"."userid" IS '유저 ID';

-- 일정
CREATE TABLE "Schedule" (
	"userid" VARCHAR2(100) NOT NULL, -- 유저 ID
	"roomid" VARCHAR2(30)  NOT NULL  -- 모임방 id
);

-- 일정
COMMENT ON TABLE "Schedule" IS '일정';

-- 유저 ID
COMMENT ON COLUMN "Schedule"."userid" IS '유저 ID';

-- 모임방 id
COMMENT ON COLUMN "Schedule"."roomid" IS '모임방 id';

-- 모임방
CREATE TABLE "Room" (
	"roomid"     VARCHAR2(30)         NOT NULL, -- 모임방 id
	"rname"      VARCHAR2(60)         NOT NULL, -- 모임방 이름
	"rplace"     VARCHAR2(60)         NOT NULL, -- 장소
	"rmaxpeople" NUMBER(2)            NOT NULL, -- 인원
	"rgenre"     VARCHAR2(15)         NOT NULL, -- 장르
	"rgame"      VARCHAR2(60)         NULL,     -- 게임
	"rstr"       VARCHAR2(3000)       NULL,     -- 모임 설명
	"rdatetime"  DATA DEFAULT SYSDATE NOT NULL  -- 모임일시
);

-- 모임방 기본키
CREATE UNIQUE INDEX "PK_Room"
	ON "Room" ( -- 모임방
		"roomid" ASC -- 모임방 id
	);

-- 모임방
ALTER TABLE "Room"
	ADD
		CONSTRAINT "PK_Room" -- 모임방 기본키
		PRIMARY KEY (
			"roomid" -- 모임방 id
		);

-- 모임방
COMMENT ON TABLE "Room" IS '모임방';

-- 모임방 id
COMMENT ON COLUMN "Room"."roomid" IS '모임방 id';

-- 모임방 이름
COMMENT ON COLUMN "Room"."rname" IS '모임방 이름';

-- 장소
COMMENT ON COLUMN "Room"."rplace" IS '장소';

-- 인원
COMMENT ON COLUMN "Room"."rmaxpeople" IS '인원';

-- 장르
COMMENT ON COLUMN "Room"."rgenre" IS '장르';

-- 게임
COMMENT ON COLUMN "Room"."rgame" IS '게임';

-- 모임 설명
COMMENT ON COLUMN "Room"."rstr" IS '모임 설명';

-- 모임일시
COMMENT ON COLUMN "Room"."rdatetime" IS '모임일시';

-- 모임방 기본키
COMMENT ON INDEX "PK_Room" IS '모임방 기본키';

-- 모임방 기본키
COMMENT ON CONSTRAINT "Room"."PK_Room" IS '모임방 기본키';

-- 게임정보
CREATE TABLE "Game" (
	"name"         VARCHAR2(60)   NOT NULL, -- 게임이름
	"explane"      VARCHAR2(2000) NOT NULL, -- 게임 소개
	"minpeople"    NUMBER(1)      NOT NULL, -- 최소인원
	"maxpeople"    NUMBER(2)      NOT NULL, -- 최대인원
	"playtime"     NUMBER(2)      NOT NULL, -- 플레이시간
	"genre"        VARCHAR2(15)   NOT NULL, -- 장르
	"dlevel"       NUMBER(1)      NOT NULL, -- 난이도
	"pubYear"      NUMBER(4)      NOT NULL, -- 출시년도
	"age"          NUMBER(2)      NOT NULL, -- 연령
	"youtube_link" VARCHAR2(1000) NULL,     -- 설명 링크
	"namu_link"    VARCHAR2(1000) NULL,     -- 나무위키링크
	"shop_link"    VARCHAR2(1000) NULL,     -- 구매 링크
	"gimage"       VARCHAR2(500)  NULL      -- 이미지
);

-- 게임정보 기본키
CREATE UNIQUE INDEX "PK_Game"
	ON "Game" ( -- 게임정보
		"name" ASC -- 게임이름
	);

-- 게임정보
ALTER TABLE "Game"
	ADD
		CONSTRAINT "PK_Game" -- 게임정보 기본키
		PRIMARY KEY (
			"name" -- 게임이름
		);

-- 게임정보
COMMENT ON TABLE "Game" IS '게임정보';

-- 게임이름
COMMENT ON COLUMN "Game"."name" IS '게임이름';

-- 게임 소개
COMMENT ON COLUMN "Game"."explane" IS '게임 소개';

-- 최소인원
COMMENT ON COLUMN "Game"."minpeople" IS '최소인원';

-- 최대인원
COMMENT ON COLUMN "Game"."maxpeople" IS '최대인원';

-- 플레이시간
COMMENT ON COLUMN "Game"."playtime" IS '플레이시간';

-- 장르
COMMENT ON COLUMN "Game"."genre" IS '장르';

-- 난이도
COMMENT ON COLUMN "Game"."dlevel" IS '난이도';

-- 출시년도
COMMENT ON COLUMN "Game"."pubYear" IS '출시년도';

-- 연령
COMMENT ON COLUMN "Game"."age" IS '연령';

-- 설명 링크
COMMENT ON COLUMN "Game"."youtube_link" IS '설명 링크';

-- 나무위키링크
COMMENT ON COLUMN "Game"."namu_link" IS '나무위키링크';

-- 구매 링크
COMMENT ON COLUMN "Game"."shop_link" IS '구매 링크';

-- 이미지
COMMENT ON COLUMN "Game"."gimage" IS '이미지';

-- 게임정보 기본키
COMMENT ON INDEX "PK_Game" IS '게임정보 기본키';

-- 게임정보 기본키
COMMENT ON CONSTRAINT "Game"."PK_Game" IS '게임정보 기본키';

-- 매장 보유게임
CREATE TABLE "ShopGame" (
	"name"  VARCHAR2(60)  NOT NULL, -- 게임이름
	"saddr" VARCHAR2(150) NOT NULL  -- 매장 주소
);

-- 매장 보유게임
COMMENT ON TABLE "ShopGame" IS '매장 보유게임';

-- 게임이름
COMMENT ON COLUMN "ShopGame"."name" IS '게임이름';

-- 매장 주소
COMMENT ON COLUMN "ShopGame"."saddr" IS '매장 주소';

-- 매장정보
CREATE TABLE "Shop" (
	"sname"       VARCHAR2(60)  NOT NULL, -- 매장이름
	"saddr"       VARCHAR2(150) NOT NULL, -- 매장 주소
	"smenu_img"   VARCHAR2(500) NULL,     -- 메뉴 이미지
	"price_img"   VARCHAR2(500) NULL,     -- 요금 이미지
	"hour_price"  NUMBER(4)     NULL,     -- 시간당요금
	"unlim_price" NUMBER(4)     NULL,     -- 무제한요금
	"stars"       NUMBER(3,1)   NOT NULL DEFAULT 0.0 -- 별점
);

-- 매장정보 기본키
CREATE UNIQUE INDEX "PK_Shop"
	ON "Shop" ( -- 매장정보
		"saddr" ASC -- 매장 주소
	);

-- 매장정보
ALTER TABLE "Shop"
	ADD
		CONSTRAINT "PK_Shop" -- 매장정보 기본키
		PRIMARY KEY (
			"saddr" -- 매장 주소
		);

-- 매장정보
COMMENT ON TABLE "Shop" IS '매장정보';

-- 매장이름
COMMENT ON COLUMN "Shop"."sname" IS '매장이름';

-- 매장 주소
COMMENT ON COLUMN "Shop"."saddr" IS '매장 주소';

-- 메뉴 이미지
COMMENT ON COLUMN "Shop"."smenu_img" IS '메뉴 이미지';

-- 요금 이미지
COMMENT ON COLUMN "Shop"."price_img" IS '요금 이미지';

-- 시간당요금
COMMENT ON COLUMN "Shop"."hour_price" IS '시간당요금';

-- 무제한요금
COMMENT ON COLUMN "Shop"."unlim_price" IS '무제한요금';

-- 별점
COMMENT ON COLUMN "Shop"."stars" IS '별점';

-- 매장정보 기본키
COMMENT ON INDEX "PK_Shop" IS '매장정보 기본키';

-- 매장정보 기본키
COMMENT ON CONSTRAINT "Shop"."PK_Shop" IS '매장정보 기본키';

-- 모임방 인원
ALTER TABLE "RoomPeople"
	ADD
		CONSTRAINT "FK_User_TO_RoomPeople" -- 유저정보 -> 모임방 인원
		FOREIGN KEY (
			"userid" -- 유저 ID
		)
		REFERENCES "User" ( -- 유저정보
			"userid" -- 유저 ID
		);

-- 유저정보 -> 모임방 인원
COMMENT ON CONSTRAINT "RoomPeople"."FK_User_TO_RoomPeople" IS '유저정보 -> 모임방 인원';

-- 모임방 인원
ALTER TABLE "RoomPeople"
	ADD
		CONSTRAINT "FK_Room_TO_RoomPeople" -- 모임방 -> 모임방 인원
		FOREIGN KEY (
			"roomid" -- 모임방 id
		)
		REFERENCES "Room" ( -- 모임방
			"roomid" -- 모임방 id
		);

-- 모임방 -> 모임방 인원
COMMENT ON CONSTRAINT "RoomPeople"."FK_Room_TO_RoomPeople" IS '모임방 -> 모임방 인원';

-- 일정
ALTER TABLE "Schedule"
	ADD
		CONSTRAINT "FK_User_TO_Schedule" -- 유저정보 -> 일정
		FOREIGN KEY (
			"userid" -- 유저 ID
		)
		REFERENCES "User" ( -- 유저정보
			"userid" -- 유저 ID
		);

-- 유저정보 -> 일정
COMMENT ON CONSTRAINT "Schedule"."FK_User_TO_Schedule" IS '유저정보 -> 일정';

-- 일정
ALTER TABLE "Schedule"
	ADD
		CONSTRAINT "FK_Room_TO_Schedule" -- 모임방 -> 일정
		FOREIGN KEY (
			"roomid" -- 모임방 id
		)
		REFERENCES "Room" ( -- 모임방
			"roomid" -- 모임방 id
		);

-- 모임방 -> 일정
COMMENT ON CONSTRAINT "Schedule"."FK_Room_TO_Schedule" IS '모임방 -> 일정';

-- 매장 보유게임
ALTER TABLE "ShopGame"
	ADD
		CONSTRAINT "FK_Game_TO_ShopGame" -- 게임정보 -> 매장 보유게임
		FOREIGN KEY (
			"name" -- 게임이름
		)
		REFERENCES "Game" ( -- 게임정보
			"name" -- 게임이름
		);

-- 게임정보 -> 매장 보유게임
COMMENT ON CONSTRAINT "ShopGame"."FK_Game_TO_ShopGame" IS '게임정보 -> 매장 보유게임';

-- 매장 보유게임
ALTER TABLE "ShopGame"
	ADD
		CONSTRAINT "FK_Shop_TO_ShopGame" -- 매장정보 -> 매장 보유게임
		FOREIGN KEY (
			"saddr" -- 매장 주소
		)
		REFERENCES "Shop" ( -- 매장정보
			"saddr" -- 매장 주소
		);

-- 매장정보 -> 매장 보유게임
COMMENT ON CONSTRAINT "ShopGame"."FK_Shop_TO_ShopGame" IS '매장정보 -> 매장 보유게임';