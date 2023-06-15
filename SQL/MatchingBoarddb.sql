-- ��������
DROP TABLE "User";

-- ���ӹ� �ο�
DROP TABLE "RoomPeople";

-- ����
DROP TABLE "Schedule";

-- ���ӹ�
DROP TABLE "Room";

-- ��������
DROP TABLE "Game";

-- ���� ��������
DROP TABLE "ShopGame";

-- ��������
DROP TABLE "Shop";

-- ��������
CREATE TABLE "User" (
	"userid"      VARCHAR2(100) NOT NULL, -- ���� ID
	"profile_img" VARCHAR2(500) NULL,     -- ������ �̹���
	"nickname"    VARCHAR2(30)  NOT NULL, -- �г���
	"area"        NUMBER(10)    NULL,     -- Ȱ������
	"grade"       NUMBER(3)     NOT NULL DEFAULT 0, -- ���
	"exp"         NUMBER(5)     NOT NULL DEFAULT 0, -- ����ġ
	"manner"      NUMBER(3,1)   NOT NULL DEFAULT 30, -- �ų�����
	"fgenre1"     VARCHAR2(15)  NULL,     -- ��ȣ�帣1
	"fgenre2"     VARCHAR2(15)  NULL,     -- ��ȣ�帣2
	"fgenre3"     VARCHAR2(15)  NULL,     -- ��ȣ�帣3
	"fgame1"      VARCHAR2(60)  NULL,     -- ��ȣ����1
	"fgame2"      VARCHAR2(60)  NULL,     -- ��ȣ����2
	"fgame3"      VARCHAR2(60)  NULL,     -- ��ȣ����3
	"attend"      NUMBER(3)     NOT NULL DEFAULT 0, -- �⼮
	"late"        NUMBER(3)     NOT NULL DEFAULT 0, -- ����
	"absent"      NUMBER(3)     NOT NULL DEFAULT 0 -- �Ἦ
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX "PK_User"
	ON "User" ( -- ��������
		"userid" ASC -- ���� ID
	);

-- ��������
ALTER TABLE "User"
	ADD
		CONSTRAINT "PK_User" -- �������� �⺻Ű
		PRIMARY KEY (
			"userid" -- ���� ID
		);

-- ��������
COMMENT ON TABLE "User" IS '��������';

-- ���� ID
COMMENT ON COLUMN "User"."userid" IS '���� ID';

-- ������ �̹���
COMMENT ON COLUMN "User"."profile_img" IS '������ �̹���';

-- �г���
COMMENT ON COLUMN "User"."nickname" IS '�г���';

-- Ȱ������
COMMENT ON COLUMN "User"."area" IS 'Ȱ������';

-- ���
COMMENT ON COLUMN "User"."grade" IS '���';

-- ����ġ
COMMENT ON COLUMN "User"."exp" IS '����ġ';

-- �ų�����
COMMENT ON COLUMN "User"."manner" IS '�ų�����';

-- ��ȣ�帣1
COMMENT ON COLUMN "User"."fgenre1" IS '��ȣ�帣1';

-- ��ȣ�帣2
COMMENT ON COLUMN "User"."fgenre2" IS '��ȣ�帣2';

-- ��ȣ�帣3
COMMENT ON COLUMN "User"."fgenre3" IS '��ȣ�帣3';

-- ��ȣ����1
COMMENT ON COLUMN "User"."fgame1" IS '��ȣ����1';

-- ��ȣ����2
COMMENT ON COLUMN "User"."fgame2" IS '��ȣ����2';

-- ��ȣ����3
COMMENT ON COLUMN "User"."fgame3" IS '��ȣ����3';

-- �⼮
COMMENT ON COLUMN "User"."attend" IS '�⼮';

-- ����
COMMENT ON COLUMN "User"."late" IS '����';

-- �Ἦ
COMMENT ON COLUMN "User"."absent" IS '�Ἦ';

-- �������� �⺻Ű
COMMENT ON INDEX "PK_User" IS '�������� �⺻Ű';

-- �������� �⺻Ű
COMMENT ON CONSTRAINT "User"."PK_User" IS '�������� �⺻Ű';

-- ���ӹ� �ο�
CREATE TABLE "RoomPeople" (
	"roomid" VARCHAR2(30)  NOT NULL, -- ���ӹ� id
	"userid" VARCHAR2(100) NOT NULL  -- ���� ID
);

-- ���ӹ� �ο�
COMMENT ON TABLE "RoomPeople" IS '���ӹ� �ο�';

-- ���ӹ� id
COMMENT ON COLUMN "RoomPeople"."roomid" IS '���ӹ� id';

-- ���� ID
COMMENT ON COLUMN "RoomPeople"."userid" IS '���� ID';

-- ����
CREATE TABLE "Schedule" (
	"userid" VARCHAR2(100) NOT NULL, -- ���� ID
	"roomid" VARCHAR2(30)  NOT NULL  -- ���ӹ� id
);

-- ����
COMMENT ON TABLE "Schedule" IS '����';

-- ���� ID
COMMENT ON COLUMN "Schedule"."userid" IS '���� ID';

-- ���ӹ� id
COMMENT ON COLUMN "Schedule"."roomid" IS '���ӹ� id';

-- ���ӹ�
CREATE TABLE "Room" (
	"roomid"     VARCHAR2(30)         NOT NULL, -- ���ӹ� id
	"rname"      VARCHAR2(60)         NOT NULL, -- ���ӹ� �̸�
	"rplace"     VARCHAR2(60)         NOT NULL, -- ���
	"rmaxpeople" NUMBER(2)            NOT NULL, -- �ο�
	"rgenre"     VARCHAR2(15)         NOT NULL, -- �帣
	"rgame"      VARCHAR2(60)         NULL,     -- ����
	"rstr"       VARCHAR2(3000)       NULL,     -- ���� ����
	"rdatetime"  DATA DEFAULT SYSDATE NOT NULL  -- �����Ͻ�
);

-- ���ӹ� �⺻Ű
CREATE UNIQUE INDEX "PK_Room"
	ON "Room" ( -- ���ӹ�
		"roomid" ASC -- ���ӹ� id
	);

-- ���ӹ�
ALTER TABLE "Room"
	ADD
		CONSTRAINT "PK_Room" -- ���ӹ� �⺻Ű
		PRIMARY KEY (
			"roomid" -- ���ӹ� id
		);

-- ���ӹ�
COMMENT ON TABLE "Room" IS '���ӹ�';

-- ���ӹ� id
COMMENT ON COLUMN "Room"."roomid" IS '���ӹ� id';

-- ���ӹ� �̸�
COMMENT ON COLUMN "Room"."rname" IS '���ӹ� �̸�';

-- ���
COMMENT ON COLUMN "Room"."rplace" IS '���';

-- �ο�
COMMENT ON COLUMN "Room"."rmaxpeople" IS '�ο�';

-- �帣
COMMENT ON COLUMN "Room"."rgenre" IS '�帣';

-- ����
COMMENT ON COLUMN "Room"."rgame" IS '����';

-- ���� ����
COMMENT ON COLUMN "Room"."rstr" IS '���� ����';

-- �����Ͻ�
COMMENT ON COLUMN "Room"."rdatetime" IS '�����Ͻ�';

-- ���ӹ� �⺻Ű
COMMENT ON INDEX "PK_Room" IS '���ӹ� �⺻Ű';

-- ���ӹ� �⺻Ű
COMMENT ON CONSTRAINT "Room"."PK_Room" IS '���ӹ� �⺻Ű';

-- ��������
CREATE TABLE "Game" (
	"name"         VARCHAR2(60)   NOT NULL, -- �����̸�
	"explane"      VARCHAR2(2000) NOT NULL, -- ���� �Ұ�
	"minpeople"    NUMBER(1)      NOT NULL, -- �ּ��ο�
	"maxpeople"    NUMBER(2)      NOT NULL, -- �ִ��ο�
	"playtime"     NUMBER(2)      NOT NULL, -- �÷��̽ð�
	"genre"        VARCHAR2(15)   NOT NULL, -- �帣
	"dlevel"       NUMBER(1)      NOT NULL, -- ���̵�
	"pubYear"      NUMBER(4)      NOT NULL, -- ��ó⵵
	"age"          NUMBER(2)      NOT NULL, -- ����
	"youtube_link" VARCHAR2(1000) NULL,     -- ���� ��ũ
	"namu_link"    VARCHAR2(1000) NULL,     -- ������Ű��ũ
	"shop_link"    VARCHAR2(1000) NULL,     -- ���� ��ũ
	"gimage"       VARCHAR2(500)  NULL      -- �̹���
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX "PK_Game"
	ON "Game" ( -- ��������
		"name" ASC -- �����̸�
	);

-- ��������
ALTER TABLE "Game"
	ADD
		CONSTRAINT "PK_Game" -- �������� �⺻Ű
		PRIMARY KEY (
			"name" -- �����̸�
		);

-- ��������
COMMENT ON TABLE "Game" IS '��������';

-- �����̸�
COMMENT ON COLUMN "Game"."name" IS '�����̸�';

-- ���� �Ұ�
COMMENT ON COLUMN "Game"."explane" IS '���� �Ұ�';

-- �ּ��ο�
COMMENT ON COLUMN "Game"."minpeople" IS '�ּ��ο�';

-- �ִ��ο�
COMMENT ON COLUMN "Game"."maxpeople" IS '�ִ��ο�';

-- �÷��̽ð�
COMMENT ON COLUMN "Game"."playtime" IS '�÷��̽ð�';

-- �帣
COMMENT ON COLUMN "Game"."genre" IS '�帣';

-- ���̵�
COMMENT ON COLUMN "Game"."dlevel" IS '���̵�';

-- ��ó⵵
COMMENT ON COLUMN "Game"."pubYear" IS '��ó⵵';

-- ����
COMMENT ON COLUMN "Game"."age" IS '����';

-- ���� ��ũ
COMMENT ON COLUMN "Game"."youtube_link" IS '���� ��ũ';

-- ������Ű��ũ
COMMENT ON COLUMN "Game"."namu_link" IS '������Ű��ũ';

-- ���� ��ũ
COMMENT ON COLUMN "Game"."shop_link" IS '���� ��ũ';

-- �̹���
COMMENT ON COLUMN "Game"."gimage" IS '�̹���';

-- �������� �⺻Ű
COMMENT ON INDEX "PK_Game" IS '�������� �⺻Ű';

-- �������� �⺻Ű
COMMENT ON CONSTRAINT "Game"."PK_Game" IS '�������� �⺻Ű';

-- ���� ��������
CREATE TABLE "ShopGame" (
	"name"  VARCHAR2(60)  NOT NULL, -- �����̸�
	"saddr" VARCHAR2(150) NOT NULL  -- ���� �ּ�
);

-- ���� ��������
COMMENT ON TABLE "ShopGame" IS '���� ��������';

-- �����̸�
COMMENT ON COLUMN "ShopGame"."name" IS '�����̸�';

-- ���� �ּ�
COMMENT ON COLUMN "ShopGame"."saddr" IS '���� �ּ�';

-- ��������
CREATE TABLE "Shop" (
	"sname"       VARCHAR2(60)  NOT NULL, -- �����̸�
	"saddr"       VARCHAR2(150) NOT NULL, -- ���� �ּ�
	"smenu_img"   VARCHAR2(500) NULL,     -- �޴� �̹���
	"price_img"   VARCHAR2(500) NULL,     -- ��� �̹���
	"hour_price"  NUMBER(4)     NULL,     -- �ð�����
	"unlim_price" NUMBER(4)     NULL,     -- �����ѿ��
	"stars"       NUMBER(3,1)   NOT NULL DEFAULT 0.0 -- ����
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX "PK_Shop"
	ON "Shop" ( -- ��������
		"saddr" ASC -- ���� �ּ�
	);

-- ��������
ALTER TABLE "Shop"
	ADD
		CONSTRAINT "PK_Shop" -- �������� �⺻Ű
		PRIMARY KEY (
			"saddr" -- ���� �ּ�
		);

-- ��������
COMMENT ON TABLE "Shop" IS '��������';

-- �����̸�
COMMENT ON COLUMN "Shop"."sname" IS '�����̸�';

-- ���� �ּ�
COMMENT ON COLUMN "Shop"."saddr" IS '���� �ּ�';

-- �޴� �̹���
COMMENT ON COLUMN "Shop"."smenu_img" IS '�޴� �̹���';

-- ��� �̹���
COMMENT ON COLUMN "Shop"."price_img" IS '��� �̹���';

-- �ð�����
COMMENT ON COLUMN "Shop"."hour_price" IS '�ð�����';

-- �����ѿ��
COMMENT ON COLUMN "Shop"."unlim_price" IS '�����ѿ��';

-- ����
COMMENT ON COLUMN "Shop"."stars" IS '����';

-- �������� �⺻Ű
COMMENT ON INDEX "PK_Shop" IS '�������� �⺻Ű';

-- �������� �⺻Ű
COMMENT ON CONSTRAINT "Shop"."PK_Shop" IS '�������� �⺻Ű';

-- ���ӹ� �ο�
ALTER TABLE "RoomPeople"
	ADD
		CONSTRAINT "FK_User_TO_RoomPeople" -- �������� -> ���ӹ� �ο�
		FOREIGN KEY (
			"userid" -- ���� ID
		)
		REFERENCES "User" ( -- ��������
			"userid" -- ���� ID
		);

-- �������� -> ���ӹ� �ο�
COMMENT ON CONSTRAINT "RoomPeople"."FK_User_TO_RoomPeople" IS '�������� -> ���ӹ� �ο�';

-- ���ӹ� �ο�
ALTER TABLE "RoomPeople"
	ADD
		CONSTRAINT "FK_Room_TO_RoomPeople" -- ���ӹ� -> ���ӹ� �ο�
		FOREIGN KEY (
			"roomid" -- ���ӹ� id
		)
		REFERENCES "Room" ( -- ���ӹ�
			"roomid" -- ���ӹ� id
		);

-- ���ӹ� -> ���ӹ� �ο�
COMMENT ON CONSTRAINT "RoomPeople"."FK_Room_TO_RoomPeople" IS '���ӹ� -> ���ӹ� �ο�';

-- ����
ALTER TABLE "Schedule"
	ADD
		CONSTRAINT "FK_User_TO_Schedule" -- �������� -> ����
		FOREIGN KEY (
			"userid" -- ���� ID
		)
		REFERENCES "User" ( -- ��������
			"userid" -- ���� ID
		);

-- �������� -> ����
COMMENT ON CONSTRAINT "Schedule"."FK_User_TO_Schedule" IS '�������� -> ����';

-- ����
ALTER TABLE "Schedule"
	ADD
		CONSTRAINT "FK_Room_TO_Schedule" -- ���ӹ� -> ����
		FOREIGN KEY (
			"roomid" -- ���ӹ� id
		)
		REFERENCES "Room" ( -- ���ӹ�
			"roomid" -- ���ӹ� id
		);

-- ���ӹ� -> ����
COMMENT ON CONSTRAINT "Schedule"."FK_Room_TO_Schedule" IS '���ӹ� -> ����';

-- ���� ��������
ALTER TABLE "ShopGame"
	ADD
		CONSTRAINT "FK_Game_TO_ShopGame" -- �������� -> ���� ��������
		FOREIGN KEY (
			"name" -- �����̸�
		)
		REFERENCES "Game" ( -- ��������
			"name" -- �����̸�
		);

-- �������� -> ���� ��������
COMMENT ON CONSTRAINT "ShopGame"."FK_Game_TO_ShopGame" IS '�������� -> ���� ��������';

-- ���� ��������
ALTER TABLE "ShopGame"
	ADD
		CONSTRAINT "FK_Shop_TO_ShopGame" -- �������� -> ���� ��������
		FOREIGN KEY (
			"saddr" -- ���� �ּ�
		)
		REFERENCES "Shop" ( -- ��������
			"saddr" -- ���� �ּ�
		);

-- �������� -> ���� ��������
COMMENT ON CONSTRAINT "ShopGame"."FK_Shop_TO_ShopGame" IS '�������� -> ���� ��������';