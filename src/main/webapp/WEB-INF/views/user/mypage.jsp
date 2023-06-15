<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.myPageTable {
	width: 70%;
	margin: 1em auto;
}

td {
	padding: 7px;
}

td:last-child {
	text-align: left;
}
</style>
<div class="container m2">
	<h1>MyPage-${loginUser.nickname} 님 정보</h1>
	<p>회원 인증 페이지 - 로그인 해야 들어올 수 있는 페이지입니다</p>
	<table border="0" class="table table-striped mt-3">
		<tr>
			<td width="25%"><img src="${loginUser.profile_img}"></td>
			<td width="75%"><b>${loginUser.userid}</b></td>
		</tr>
		<tr>
			<td>지역</td>
			<td><b>${loginUser.area}</b></td>
		</tr>
		<tr>
			<td>선호 장르</td>
			<td><b>${loginUser.fgenre1}, ${loginUser.fgenre2}, ${loginUser.fgenre3}</b></td>
		</tr>
		<tr>
			<td>선호 게임 Top3</td>
			<td><b>${loginUser.fgame1}, ${loginUser.fgame2}, ${loginUser.fgame3}</b></td>
		</tr>
		<tr>
			<td>경험치</td>
			<td><progress id="progress" value="${loginUser.exp}" max="${loginUser.grade *100}"></progress></td>
		</tr>
		<tr>
			<td>매너점수</td>
			<td><progress id="progress" value="${loginUser.manner}" max="100"></progress></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				<form name='f' method='post' action='modify'>
					<input type="hidden" name="idx" value="${loginUser.idx }">
					<button class="btn btn-success">정보수정|탈퇴</button>
				</form>
			</td>
		</tr>
	</table>
</div>