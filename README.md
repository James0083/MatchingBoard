# MatchingBoard 🎲
### MultiCampus Final-Project

> 보드게임 카페에서 **함께 할 사람을 찾는 모임 매칭 커뮤니티**
> 멀티캠퍼스 최종 프로젝트 **최우수상(1위, 5개 팀 중)** · 2023.06.05 – 2023.07.11

<!-- TODO: 메인 화면 / 모임방 / 채팅 스크린샷 또는 시연 GIF 1~3장 (docs/images/ 에 두고 아래에 삽입) -->
<!-- ![메인](docs/images/main.png) -->

## 한 줄 소개
보드게임을 하고 싶은데 같이 할 사람이 없을 때, **모임방을 만들고 참가자와 실시간으로 채팅하며 약속을 잡는** 서비스입니다.

## 주요 기능
| 영역 | 기능 |
|---|---|
| 모임 | 모임방 생성 · 수정 · 삭제, 참가/탈퇴, 참가자 프로필 모달 |
| 실시간 채팅 | WebSocket(STOMP) 기반, **모임방 ID 기준으로 채팅방 분리**, 입장·퇴장·메시지 |
| 보드게임 | 게임 목록 · 검색, 위시리스트 |
| 장소 | 네이버 지도 API로 보드게임 카페 위치 표시 |
| 마이페이지 | 프로필 조회, 참여 모임 캘린더 |
| 평가 | 카페 평가 · 멤버 평가 |
| 계정 | 카카오·네이버 소셜 로그인, 관리자 로그인 |

## 기술 스택
- **Backend**: Java 11, Spring Framework (Legacy, Spring MVC 5.2), Spring WebSocket/STOMP, MyBatis 3.5
- **DB**: Oracle 11g XE
- **Frontend**: JSP/JSTL, HTML5, CSS, JavaScript, jQuery, Bootstrap 5
- **Infra/Tooling**: Tomcat 9, Maven, Lombok, JUnit 4, Git(브랜치 전략 사용)
- **External API**: 네이버 지도, 카카오/네이버 로그인

## 아키텍처
```
Browser (JSP + jQuery)
   │  HTTP                      │  WebSocket (SockJS/STOMP)
   ▼                            ▼
Controller (17)            /ws-connection
   │                          ├─ /publish/chat/join|quit|message   (client → server)
   ▼                          └─ /subscribe/...                    (server → clients, 방 ID별)
Service (22)
   ▼
Mapper (MyBatis, 11) ──► Oracle
```
- 패키지: `com.multi.{matchingBoard(controller) · service · mapper · model · snslogin}`
- 설계 문서: [`related info/Diagram`](./related%20info/Diagram) 의 클래스 다이어그램(User, Game, Shop, EvalCafe, EvalMember, SocialLogin)과 유스케이스 다이어그램, ERD는 [`SQL/MatchingBoarddb.exerd`](./SQL/MatchingBoarddb.exerd)

## 데이터 모델
`Member` · `Social` · `Room` · `Roompeople` · `wishlist` · `Game` · `Shop` · `ShopGame` · `Membereval` · `Evaluation`
<!-- TODO: ERD 이미지 1장 추가 -->

## 팀 & 내 역할
- **팀 구성**: 백엔드 4명 (각자 기능 단위로 BE + FE 개발), **프로젝트 리더(팀장)**
- **내가 담당한 부분 (전체 기능의 약 40%)**
  - 마이페이지: 프로필 조회, 참여 모임 캘린더
  - 모임방: 생성 · 삭제 · 상세, 참가자 프로필 모달
  - **STOMP 실시간 채팅**: 모임방 ID 기준 채팅방 분리
  - 보드게임 목록 · 검색
- **팀장으로서**: 일정(WBS) 관리, Git 브랜치 전략 운영, 기획안·포트폴리오 정리

## 실행 방법
1. JDK 11, Maven, Tomcat 9, Oracle 11g XE 준비
2. `SQL/MatchingBoard.sql` → `SQL/MatchingBoard_dataInsert.sql` 순서로 실행
3. 설정값 입력 (**저장소에 커밋하지 마세요**)
   - DB 접속 정보: `WEB-INF/spring/root-context.xml`
   - 카카오/네이버 로그인, 네이버 지도 키
4. `mvn clean package` 후 Tomcat에 배포 → `http://localhost:8080/`

## 문서
- 개발 일정 및 WBS, 최종 프로젝트 기획안, 프로젝트 소개 포트폴리오: `related info/`

## 회고
<!-- TODO: 본인 말로 2~3줄. 예) 가장 어려웠던 점(채팅방 분리/동시 참가 처리 등), 다시 한다면 바꿀 점 -->

## 알려진 한계
- 레거시 Spring + JSP 구조로, 프론트/백 분리 및 자동화 테스트는 미적용 (교육과정 프로젝트 범위)
