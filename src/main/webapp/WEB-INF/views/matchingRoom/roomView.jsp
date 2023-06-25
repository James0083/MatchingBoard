<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.profile_img {
	display: inline-block;
	width: 100px;
	height: 100px;
	overflow: hidden;
	object-fit: cover;
	border-radius: 50%;
}
.profile_name{
	text-align: center;
	margin: 5px;
}
tr.explane_value{
	display: flex;
	justify-content: space-between;
}
#cur_num_btn{
	color: gray;
	margin-top: 1em;
	margin-bottom: 0;
}
</style>

<script type="text/javascript">
	function openCalendar() {
		window.open('popupCalendar', 'CalendarPopup', 'width=770px, height=630px, left=100px, top=50px');
	}
	
	function evaluation(){
 		window.location.href = '../eval/cafeEval';
	}
</script>

<div class="row" style="height: 700px;">
	<div class="container col-7" id="room_info" style="margin-left: 15px">
		<div>
			<h3 style="display: inline-block;">{rname}</h3>
			<button type="button" id="btnRoomEdit" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
		</div>
		<div class="profiles" style="">
			<button class="btn btn-sm btn-outline-light" id="cur_num_btn">현재인원/{rmaxpeople}</button>
			<br>
			<div style="display: inline-block;">
				<img class="profile_img mt-3" src="../images/profile_example.png">
				<div class="profile_name">이름</div>
			</div>
			<div style="display: inline-block;">
				<img class="profile_img mt-3" src="../images/profile_example.png">
				<div class="profile_name">이름</div>
			</div>
			<div style="display: inline-block;">
				<img class="profile_img mt-3" src="../images/search_test.png">
				<div class="profile_name">이름</div>
			</div>
			
			<!-- 
			<c:forEach var="i" begin="1" end="${memberNum}">
				<div style="display: inline-block;">
					<img class="profile_img mt-3" src="../images/profile_example.png">
					<div class="profile_name">이름</div>
				</div>
			</c:forEach>
			 -->
			 
		</div>
		
		<div>
			<table class="table">
				<tr>
					<td class="explane_title" style="width: 25%; min-width: 120px"><b>장르</b></td>
					<td class="explane_value" style="width: 75%;">
						<span style="display: inline-block;">{rgenre}</span>
						<button type="button" id="btnEditGenre" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>기본 보드게임</b></td>
					<td class="explane_value">
						<span style="display: inline-block;">{rgame}</span>
						<button type="button" id="btnEditGame" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>장소</b></td>
					<td class="explane_value">
						<span style="display: inline-block;">{rplace}</span>
						<button type="button" id="btnEditPlace" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>다음 모임일시</b></td>
					<td class="explane_value">
						<span class="btn-light" style="display: inline-block;" onclick="openCalendar(${rdatetime})">{rdatetime}</span>
						<button type="button" id="btnEditDatetime" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>방설명</b></td>
					<td>
						<button type="button" id="btnEditStr" class="float-right btn btn-sm btn-outline-secondary">편집하기</button>
					</td>
				</tr>
				<tr>
					<td class="explane_value" colspan="2">
						<span style="display: inline-block;">{rstr}</span>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="text-center">
						<button type="button" id="btnEval" class="btn btn-success" onclick="evaluation()">후기 평가</button>
					</td>
				</tr>
				<!-- 
				<tr>
					<td colspan="3" class="text-center">
						<button type="button" id="btnEditRoom" class="btn btn-success">전체 편집하기</button>
					</td>
				</tr>
				 -->
			</table>
		</div>
	</div>
	<div class="container col-4 chatting" id="chatting" style="background-color: lightgray; min-width:250px; margin-right: 15px">
		<div style="margin: 20px;">Chatting</div>
	</div>
</div>