<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::모임방 만들기::</title>
</head>
<script type="text/javascript">

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
					<td style="width: 20%"><b>방이름*</b></td>
					<td style="width: 80%"><input type="text" name="rname"
						id="rname" class="form-control"></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>장르*</b></td>
					<td style="width: 80%">
						<select style="width:100px; padding:4px">
							<option value="">장르선택</option>
							<option value="IQ">IQ</option>
							<option value="strategy">전략</option>
							<option value="psychology">심리</option>
							<option value="reasoning">추리</option>
							<option value="cooperation">협동</option>
							<option value="negotiation">협상</option>
							<!-- <option value="speed">스피드</option> -->
							<option value="agility">순발력</option>
							<option value="">손기술</option>
						</select>
				</tr>
				<tr>
					<td style="width: 20%"><b>최대인원*</b></td>
					<td style="width: 80%"><input type="number" value="2" /></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>장소*</b></td>
					<td style="width: 80%"><input type="text" name="rplace"
						id="rplace" readonly>
						<button class="btn btn-success">
							가게 찾기
							<!-- 중복 닉네임검사 , 새 창 띄워서 지도 api페이지 -> 주소 받아서 입력 -->
						</button></td>
				</tr>
				<tr>
					<td style="width: 20%"><b>모임일시*</b></td>
					<td style="width: 80%">
					<input type="hidden" name="rdatetime" id="rdatetime"> 
					<input type="date" name="rdate" id="rdate"> 
					<input type="time" name="rtime" id="rtime">
					<!-- <input type="datetime-local" name="rdatetime" id="rdatetime"> -->
					<p id="testp"></p>
					</td>
				</tr>
				<tr>
					<td style="width: 20%"><b>방설명</b></td>
					<td style="width: 80%">
					<textarea name="content" id="bcontent" rows="10" cols="50" class="form-control" placeholder="모임을 소개해보세요!"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" id="btnCreate" class="btn btn-success">방만들기</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	const offset = new Date().getTimezoneOffset() * 60000;
	const today = new Date(Date.now() - offset);
	document.getElementById('rdate').value = today.toISOString().substring(0, 10);
	document.getElementById('rdate').min = today.toISOString().substring(0, 10);
	document.getElementById('rtime').value = today.toISOString().slice(11, 16);
//	document.getElementById('rdatetime').value = today.toISOString().slice(0, 10)+today.toISOString().slice(11, 16);
	
</script>
</html>