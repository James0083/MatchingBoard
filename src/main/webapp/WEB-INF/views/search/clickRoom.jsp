<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#foot-container {
	display: none;
}

.navbar {
		display:none;
	}
	
#total_container{
    min-width: 550px;
}


</style>
</head>
<body>


	<div>
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<ul class="list-group">
					<li class="list-group-item">방이름: <c:out value="${list.rname}" /></li>
					<li class="list-group-item">장르: <c:out value="${list.rgenre}" /></li>
					<li class="list-group-item">기본보드게임: <c:out value="${list.rgame}" /></li>
					<li class="list-group-item">최대인원: <c:out value="${list.rmaxpeople}" /></li>
					<li class="list-group-item">장소: <c:out value="${list.rplace}" /></li>
					<li class="list-group-item">모임일시: <c:out value="${list.rdatetime}" /></li>
					<li class="list-group-item">방설명: <c:out value="${list.rstr}" /></li>
				</ul>
				
				<br>

				<div class="bd-example-snippet bd-code-snippet"
					style="text-align: center;">
					<div class="bd-example">
						<button type="button" class="btn btn-secondary" id="list_room">모임방 목록</button>
						<button type="button" class="btn btn-secondary">모임방 참가</button>
					</div>
					<!-- 모임방 목록으로 돌아가기 -->
					<form id="infoForm" action="boardSearch" method="get">
						<input type ="hidden" id="roomid" name="roomid" value='<c:out value="${list.roomid}"/>'>
						<input type="hidden" name="pageNum" value='<c:out value="${pagingvo.pageNum}"/>'>
						<input type="hidden" name="amount" value='<c:out value="${pagingvo.amount}"/>'>
						<!--  
						<input type="hidden" name="keyword" value="${pagingvo.keyword}">
						<input type="hidden" name="type" value="${pagingvo.type }">
						-->
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>

// 모임방 목록으로 돌아가기 - 팝업으로 만들어서 팝업창에 다시 돌아감.. 수정해야됨!
	let form = $("#infoForm");
	$("#list_room").on("click", function(e){
		form.find("#roomid").remove();
		form.attr("action", "boardSearch");
		form.submit();
	});
	

</script>
</html>
