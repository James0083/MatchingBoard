INSERT INTO room(roomid, rname, rplace, shopid, rmaxpeople, rgenre, rgame, rstr, rdatetime) 
VALUES ('5505136f-ba8d-4092-a02d-36cd776a516c', '같이 카탄 하실분~!', '보드게임카페 레드버튼 범계점', 'red002',
    4, 'strategy', '카탄', '같이 카탄 하실분을 모집합니다! 같이 재밌게 해봐요~!', '2023-07-16T13:00');

INSERT INTO room(roomid, rname, rplace, shopid, rmaxpeople, rgenre, rgame, rstr, rdatetime) 
VALUES ('5f3b9d9b-de81-417d-bc58-09120058ee61', '루미큐브 같이 하실분!', '히어로 보드게임카페 안양점', 'hero001',
    6, 'strategy', '루미큐브', '같이 루미큐브 하실분을 모집합니다! 같이 재밌게 해봐요~!', '2023-07-14T15:30');
    
INSERT INTO room(roomid, rname, rplace, shopid, rmaxpeople, rgenre, rgame, rstr, rdatetime) 
VALUES ('28ab4beb-e752-474b-b084-26c259989434', '레지스탕스 아발론', '천 보드 카페', 'chun001',
    8, 'psychology', '아발론 클래식', '아발론 뿐만 아니라 다양한 보드게임을 할 예정입니다~', '2023-07-16T14:30');
    
INSERT INTO room(roomid, rname, rplace, shopid, rmaxpeople, rgenre, rgame, rstr, rdatetime) 
VALUES ('ecd03166-e49a-41aa-8c60-a9383d90abd2', '같이 보드게임 하실분~', '보드게임카페 홈즈앤루팡 산본점', 'home002',
    5, 'strategy', '', '보드게임은 멤버의 상의를 통해 결정할 예정입니다.', '2023-07-15T15:00');

select * from room;



INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red001', '보드게임카페 레드버튼 안양점', '경기 안양시 만안구 장내로149번길 41 3층', 3000, 4.5);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red002', '보드게임카페 레드버튼 범계점', '경기 안양시 동안구 평촌대로223번길 52 502호', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red003', '보드게임카페 레드버튼 산본점', '경기 군포시 산본로323번길 16-30 성보빌딩 지하1층', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red004', '보드게임카페 레드버튼 수원점', '경기 수원시 팔달구 향교로1번길 2 3층', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red005', '보드게임카페 레드버튼 수원인계점', '경기 수원시 팔달구 효원로265번길 47 3층', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red006', '보드게임카페 레드버튼 아주대점', '경기 수원시 영통구 아주로 38 2층', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red007', '보드게임카페 레드버튼 강남점', '서울 강남구 강남대로 442 1층', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red008', '보드게임카페 레드버튼 이수역점', '서울 동작구 동작대로27길 5 지안프라자 3층 레드버튼', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('red009', '보드게임카페 레드버튼 신림점', '서울 관악구 신림로 323 3층 레드버튼', 3000, 4.4);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('chun001', '천 보드 카페', '경기 안양시 동안구 관평로182번길 43 삼일프라자', 3000, 4.3);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('home001', '보드게임카페 홈즈앤루팡 범계점', '경기 안양시 동안구 평촌대로223번길 44 3층', 3000, 3.8);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('home002', '보드게임카페 홈즈앤루팡 산본점', '경기 군포시 산본로323번길 16-25 삼일빌딩 5층', 3000, 3.8);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('home003', '보드게임카페 홈즈앤루팡 수원역점', '경기 수원시 팔달구 향교로 25 3층, 4층', 3000, 3.8);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('home004', '보드게임카페 홈즈앤루팡 강남점', '서울 강남구 테헤란로1길 48 2층', 3000, 3.8);

INSERT INTO shop(shopid, sname, saddr, unlim_price, stars) 
VALUES ('the001', '더홀릭 보드게임카페 범계점', '경기 안양시 동안구 평촌대로223번길 48 백운빌딩 5층 502호', 8000, 4.7);

INSERT INTO shop(shopid, sname, saddr, hour_price, unlim_price, stars) 
VALUES ('the002', '더홀릭 보드게임카페 수원역점', '경기 수원시 팔달구 향교로 15 3층/4층', 2400, 8000, 4.7);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('hero001', '히어로 보드게임카페 안양점', '경기 안양시 만안구 안양로292번길 14 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('hero002', '히어로 보드게임카페 산본점', '경기 군포시 산본로323번길 20-17 4층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('hero003', '히어로 보드게임카페 수원점', '경기 수원시 팔달구 향교로 29 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('devel001', '데블다이스 보드게임카페 안양점', '경기 안양시 만안구 안양로 300 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('devel002', '데블다이스 보드게임카페 범계점', '경기 안양시 동안구 평촌대로223번길 28 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('devel003', '데블다이스 보드게임카페 강남시티점', '서울 강남구 테헤란로1길 42 5층, 6층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, unlim_price, stars) 
VALUES ('holes001', '홀스 안양점', '경기 안양시 만안구 장내로139번길 52 더존아카데미 2층', 10000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('hidden001', '히든룸 보드 카페', '경기 안양시 동안구 흥안대로517번길 30', 3000, 4.3);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('holic001', '홀릭 보드 카페', '경기 안양시 동안구 시민대로 272 207호', 1750, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('james001', '제임스 보드 게임', '경기 안양시 동안구 관평로182번길 30 4층 405호', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('fres001', '프리스콜레', '경기 수원시 영통구 센트럴타운로 106 센트럴프라자 214호', 2700, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('jade001', '제이드플레이스', '경기 용인시 수지구 신봉1로 175 진성프라자 204호', 4000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('fun001', '펀타임 강남점', '서울 강남구 테헤란로1길 17 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('dal001', '달무티 교대점', '서울 서초구 서초대로58길 18 지에스타워 지하 1층 B02', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, unlim_price, stars) 
VALUES ('gom001', '곰곰이 보드게임', '서울 서초구 방배천로14길 16 2층', 5000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('gac001', '게임 아카이브', '서울 서초구 효령로23길 45 리츠빌 101호', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, unlim_price, stars) 
VALUES ('haja001', '보드 게임 하자', '서울 동작구 만양로14길 25 지하1층', 2400, 10000, 4.6);

INSERT INTO shop(shopid, sname, saddr, unlim_price, stars) 
VALUES ('mir001', '미르 보드카페', '서울 동작구 흑석로 81-6 지하1층', 5000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('isu001', '이수보드게임카페', '서울 동작구 동작대로27가길 6-4 3층', 3000, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('plon001', '플레이온 보드게임카페', '서울 관악구 남부순환로 1592 3층', 2400, 4.6);

INSERT INTO shop(shopid, sname, saddr, hour_price, stars) 
VALUES ('kdom001', '킹덤 보드게임카페 신림점', '서울 관악구 신림로59길 12 양지순대타운6층  킹덤보드게임 카페', 2400, 4.6);

select * from shop;


INSERT INTO member(userid, nickname, area, grade, exp, manner, 
    fgenre1, fgenre2, fgenre3, fgame1, fgame2, fgame3, attend, late, absent)
VALUES ('6f112194-8ba7-4e6d-be9c-f03f77a74c13', 'micky', 11680101, 1, 30, 78.6,
    'IQ', 'stratgy', 'reasoning', '레지스탕스:아발론', '뱅', '달무티', 3, 1, 0);

INSERT INTO member(userid, nickname, area, grade, exp, manner, 
    fgenre1, fgenre2, fgame1, fgame2, attend, late, absent)
VALUES ('4c6c7f1e-4f14-48fa-81ec-3eac09daba3a', 'lizy', 11680107, 2, 45, 83.4,
    'cooperation', 'negotiation', '보난자', '하나비', 8, 2, 0);
    
INSERT INTO member(userid, nickname, area, grade, exp, manner, 
    fgenre1, fgenre2, fgame1, fgame2, attend, late, absent)
VALUES ('7f565919-bf30-41c6-b0c4-4d11d7edee53', 'scott', 41171101, 1, 55, 91.6,
    'agility', 'skill', '우노', '할리갈리', 4, 1, 1);

INSERT INTO member(userid, nickname, area, grade, exp, manner, 
    fgenre1, fgenre2, fgenre3, fgame1, fgame2, fgame3, attend, late, absent)
VALUES ('22212851-7840-4b28-9b88-7d05a1daa876', 'james', 41171101, 1, 70, 81.2,
    'IQ', 'psychology', 'reasoning', '레지스탕스:아발론', '뱅', '달무티', 2, 1, 0);

select * from member;
