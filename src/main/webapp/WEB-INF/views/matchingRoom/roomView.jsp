<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.profiles {
	overflow: auto;
	white-space: nowrap;
}

.profile_img {
	display: inline-block;
	width: 100px;
	height: 100px;
	overflow: hidden;
	object-fit: cover;
	border-radius: 50%;
}

.profile_name {
	text-align: center;
	margin: 5px;
}

tr.explane_value {
	display: flex;
	justify-content: space-between;
}

#cur_num_btn {
	color: gray;
	margin-top: 1em;
	margin-bottom: 0;
}

td {
	padding: 7px;
	text-align: center;
	vertical-align: middle;
}

td:last-child {
	text-align: left;
}

.attendance {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	text-align: center;
	font-size: 1.2em;
	weight: bold;
	color: white;
	line-height: 50px;
}

#modal_attend {
	background-color: #2268aa;
}

#modal_late {
	background-color: #ecba10;
}

#modal_absent {
	background-color: #de352e;
}

tr:first-child td span {
	font-size: 0.8em;
	width: 4.5em;
	margin-top: 0.5em;
	display: inline-block;
}

.progress {
	appearance: none;
	height: 0.8em;
	display: inline-block;
}

.progress::-webkit-progress-bar {
	background: #f0f0f0;
	border-radius: 15px;
	/* box-shadow: inset 3px 3px 10px #ccc; */
}

.progress::-webkit-progress-value {
	border-radius: 10px;
	background: #28c231;
	overflow: hidden;
}

#modal_manner::-webkit-progress-value {
	background: #6da2ff;
}

.ac_link_logo_img {
	width: 35px;
	height: 35px;
}

.modal-backdrop {
    opacity:0.4 !important;
}
</style>

<script type="text/javascript">
	function openCalendar(rdatetime, rplace) {
		window.open('../popupCalendar?rdatetime='+rdatetime+'&rplace='+rplace, 'CalendarPopup', 'width=770px, height=630px, left=100px, top=50px');
	}
	
	$(document).ready(function() {
		
		var rdt = '${room.rdatetime}'.split(/-|T|:/);
		var str = rdt[0] + "년 " + rdt[1] + "월 " + rdt[2] + "일 - " + rdt[3] + "시 " + rdt[4] + "분";
		document.getElementById('rdatetime').innerHTML = str;
		
		$(".member_profile").click(function() {
			$("#member_profile_modal").modal({
				backdrop : true 
				// 배경 어둡게 ==> true : 배경 어두워짐, 배경 클릭시 모달 닫힘
				// false : 배경 불변, 배경 클릭시 모달 유지
				// "static" :  배경 어두워짐, 배경 클릭시 모달 유지
			});
			//////////
			var modal_nickname='모달 유저 닉네임';
			var modal_manner=50;
			var modal_exp_value='70';
			var modal_exp_max=100;
			
			var modal_area='모달 유저 지역';
			var modal_genre='모달 선호 장르1'+', '+'장르2'+', '+'장르3';
			var modal_game='모달 선호 게임1'+', '+'게임2'+', '+'게임3';
			///////////
			
			$('#modal_nickname').text(modal_nickname);
			$('#modal_manner').val(modal_manner);
			$('#modal_exp').attr("value", modal_exp_value);
			$('#modal_exp').attr("max", modal_exp_max);
			
			$('#modal_area').text(modal_area);
			$('#modal_genre').text(modal_genre);
			$('#modal_game').text(modal_game);

			////
			$('#modal_attend').text('5');
			$('#modal_late').text('3');
			//console.log($('#modal_late').text());
			$('#modal_absent').text('0');
			
		});
	});
	
	function evaluation(){
 		window.location.href = '../../eval/memberEval';
	}
	
	const go=function(mode){
		//alert(mode);
		if(mode=='del'){
			frm.method='post';
			frm.action='../delete';
		}else if(mode=='edit'){
			frm.method='post';
			frm.action='../editRoom';
		}
		frm.submit();
	}
</script>

<div class="row" style="height: 700px;">
	<div class="container col-7" id="room_info" style="margin-left: 15px">
		<div style="vertical-align: middle;">
			<h3 style="display: inline-block;">${room.rname}</h3>
			<!-- <button type="button" id="btnTitleEdit" class="float-right btn btn-sm btn-outline-secondary">편집하기</button> -->
			<form name="frm" id="frm">
				<input type="hidden" name="roomId" value="<c:out value="${roomId}"/>">
				<button type="button" id="btnRoomEdit" class="float-right btn btn-sm btn-outline-secondary" 
					style="margin: 0px 3px;" onclick="go('edit')">편집하기</button>
				<button type="button" id="btnRoomDelete" class="float-right btn btn-sm btn-outline-danger" 
					style="margin: 0px 3px;" onclick="go('del')">모임방 삭제</button>
			</form>
		</div>
		<div class="members">
			<button class="btn btn-sm btn-outline-light" id="cur_num_btn">인원 : ${curPnum} / ${room.rmaxpeople}</button>
			<br>
			<div class="profiles" style="">
			
				<!--
				<div class="member_profile" style="display: inline-block;" data-toggle="modal" data-target="#login">
					<img class="profile_img mt-3" src="../images/profile_example.png">
					<div class="profile_name">이름</div>
				</div>
				<div class="member_profile" style="display: inline-block;" data-toggle="modal" data-target="#login">
					<img class="profile_img mt-3" src="../images/search_test.png">
					<div class="profile_name">이름</div>
				</div>
				-->
				
<!-- 				<c:forEach var="for_profile" begin="1" end="8"></c:forEach>-->
 				<c:forEach var="members" items="${memberArr}">
					<div class="member_profile" style="display: inline-block;" data-toggle="modal" data-target="#login">
						<img class="profile_img mt-3" src="../../images/search_test.png">
						<div class="profile_name">${members.nickname}</div>
					</div>
				</c:forEach>
				
			 </div>
		</div>
		
		<div>
			<table class="table">
				<tr>
					<td class="explane_title" style="width: 25%; min-width: 120px"><b>장르</b></td>
					<td class="explane_value" style="width: 75%;" id="rgenre_value">
						<span style="display: inline-block;">${room.rgenre}</span>
						<!-- <button type="button" id="btnEditGenre" class="float-right btn btn-sm btn-outline-secondary">편집하기</button> -->
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>기본 보드게임</b></td>
					<td class="explane_value">
						<span style="display: inline-block;">${room.rgame}</span>
						<!-- <button type="button" id="btnEditGame" class="float-right btn btn-sm btn-outline-secondary">편집하기</button> -->
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>장소</b></td>
					<td class="explane_value">
						<span style="display: inline-block;">${room.rplace}</span>
						<!-- <button type="button" id="btnEditPlace" class="float-right btn btn-sm btn-outline-secondary">편집하기</button> -->
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>다음 모임일시</b></td>
					<td class="explane_value">
						<span class="btn-light" id="rdatetime" style="display: inline-block;" onclick="openCalendar('${room.rdatetime}', '${room.rplace}')"></span>
						<!-- <button type="button" id="btnEditDatetime" class="float-right btn btn-sm btn-outline-secondary">편집하기</button> -->
					</td>
				</tr>
				<tr>
					<td class="explane_title"><b>방설명</b></td>
					<td class="explane_value">
						<span style="display: inline-block;">${room.rstr}</span>
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
	
	
	<!-- The Modal -->
	<div class="modal fade" id="member_profile_modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">상세 프로필</h4>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table class="table mt-3 text-center" style="width:100%;">
				<tr>
					<%-- <td width="25%"><img src="${loginUser.profile_img}"></td> --%>
					<td width="25%"><img class="profile_img" id="profile_img" src="../../images/profile_example.png"></td>
					<td width="75%">
						<div style="margin: auto 0;">
							<a href=""><img src="../../images/grades/grade1.png" style="width:1.2em; height:1.2em;"></a>
							<b id="modal_nickname" style="color: #505050;">유저 닉네임</b>
						<%--
							<b>${loginUser.nickname}</b>
						--%>
							
							<br>
							<span>경험치</span>
							<span>
								<progress class="progress" id="modal_exp" value="${loginUser.exp}" max="${loginUser.grade *100}"></progress>
							</span>
							<br>
							<span>매너점수</span>
							<span>
								<progress class="progress" id="modal_manner" value="${loginUser.manner}" max="100"></progress>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>지역</td>
					<td><b id="modal_area">${loginUser.area}</b></td>
				</tr>
				<tr>
					<td>선호 장르</td>
					<%-- <td><b>${loginUser.fgenre1}, ${loginUser.fgenre2}, ${loginUser.fgenre3}</b></td> --%>
					<td><b id="modal_genre">장르1, 장르2, 장르3</b></td>
				</tr>
				<tr>
					<td>선호 게임 Top3</td>
					<%-- <td><b>${loginUser.fgame1}, ${loginUser.fgame2}, ${loginUser.fgame3}</b></td> --%>
					<td><b id="modal_game">게임1, 게임2, 게임3</b></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<table class="tb-attend table table-sm table-borderless " style="margin:0 auto;">
							<tr>
								<td><div class="attendance" id="modal_attend" style="margin:0 auto;">0${loginUser.attend}</div></td>
								<td><div class="attendance" id="modal_late" style="margin:0 auto;">0${loginUser.late}</div></td>
								<td><div class="attendance" id="modal_absent" style="margin:0 auto;">0${loginUser.absent}</div></td>
							</tr>
							<tr>
								<td style="text-align: center">출석</td>
								<td style="text-align: center">지각</td>
								<td style="text-align: center">결석</td>
							</tr>
						</table>
		
					</td>
				</tr>
			</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<!-- ----Modal End------------------------- -->
	
	<div class="container col-4 chatting" id="chatting" style="background-color: lightgray; min-width:250px; margin-right: 15px">
		<div>
 			<%@ include file="./chatting.jspf" %>
		</div>
	</div>
</div>