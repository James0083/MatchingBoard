<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::모임방 만들기::</title>
</head>
<script type="text/javascript">
	jQuery(document).ready(function() {
		const today= new Date();
		alert(today);
	}

	function check() {
		if (rf.rname.value == "") {
			alert('방이름을 입력하세요');
			rf.rname.focus();
			return;
		}
		if (rf.rgenre.value == "") {
			alert('장르를 선택하세요');
			rf.rgenre.focus();
			return;
		}
		if (rf.rmaxpeople.value == "") {
			alert('최대인원을 입력하세요');
			rf.rmaxpeople.focus();
			return;
		}
		if (rf.rplace.value == "") {
			alert('장소를 입력하세요');
			rf.rplace.focus();
			return;
		}
		if (rf.rdate.value == "") {
			alert('날짜를 입력하세요');
			rf.rdate.focus();
			return;
		}
		if (rf.rtime.value == "") {
			alert('시간을 입력하세요');
			rf.rtime.focus();
			return;
		}
		rf.rdatetime.value=rf.rdate.value+rf.rtime.value;

		//window.document.rf.submit();
		rf.submit();
	}
</script>
<body>
	<div id="wrap">
		<form name="rf" action="" method="post">
			<table class="table">
				<tr>
					<td style="width: 20%"><b>방이름</b></td>
					<td style="width: 80%"><input type="text" name="rname"
						id="rname" class="form-control"></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>장르</b></td>
					<td style="width: 80%">
						<select>
							<option>장르선택</option>
							<option>장르1</option>
							<option>장르2</option>
							<option>장르3</option>
						</select>
				</tr>
				<tr>
					<td style="width: 20%"><b>최대인원</b></td>
					<td style="width: 80%"><input type="number" value="2" /></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>장소</b></td>
					<td style="width: 80%"><input type="text" name="rplace"
						id="rplace" readonly>
						<button>
							가게 찾기
							<!-- 중복 닉네임검사 , 새 창 띄워서 지도 api페이지 -> 주소 받아서 입력 -->
						</button></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>시간</b></td>
					<td style="width: 80%"><input type="hidden" name="rdatetime"
						id="rdatetime"> <input type="date" name="rdate" id="rdate"
						min="2023-"> <input type="time" name="rtime" id="rtime">
					</td>
				</tr>
				<tr>
					<td style="width: 20%"><b>방설명</b></td>
					<td style="width: 80%"><textarea name="content" id="bcontent"
							rows="10" cols="50" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" id="btnWrite" class="btn btn-success">방만들기</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>