<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		$('#rgenre').val('${room.rgenre}').attr("selected", "selected");
		
		$('#croomf').submit(function(e){
			//alert('aa');
			//e.preventDefault();
			if (!$('#rname').val()) {
				alert('방이름을 입력하세요');
				$('#rname').focus();
				return false;
			}
			if (!$('#rgenre').val()) {
				alert('장르를 선택하세요');
				$('#rgenre').focus();
				return false;
			}
			if (!$('#rplace').val()) {
				alert('장소를 입력하세요');
				croomf.rplace.focus();
				return false;
			}
			if (!$('#rdate').val()) {
				alert('날짜를 입력하세요');
				$('#rdate').focus();
				return false;
			}
			if (!$('#rtime').val()) {
				alert('시간을 입력하세요');
				$('#rtime').focus();
				return false;
			}
			$('#rdatetime').attr('value',$('#rdate').val()+"T"+$('#rtime').val());
			//alert($('#rdate').val()+" + "+$('#rtime').val()+"==>"+$('#rdatetime').val());
			//alert($('#rmaxpeople').val()+" , "+$('#rgenre').val()+" , "+$('#rstr').val());
			
		})//submit------------------
	})//$() end-----------------
</script>

<div id="wrap" class="container">
	<form name="croomf" id="croomf" action="./roomEditDone" method="post">
		<input type="hidden" name="roomid" value="${room.roomid}">
		<table class="table">
			<tr>
				<th colspan="2" class="text-center">
					<h3>::모임방 편집하기::</h3>
				</th>
			</tr>
			<tr>
				<td style="width: 20%"><b>방이름*</b></td>
				<td style="width: 80%"><input type="text" name="rname"
					id="rname" class="form-control" value="${room.rname}"></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>장르*</b></td>
				<td style="width: 80%">
					<select style="width:100px; padding:4px" name="rgenre" id="rgenre">
						<option value="IQ">IQ</option>
						<option value="strategy">전략</option>
						<option value="psychology">심리</option>
						<option value="reasoning">추리</option>
						<option value="cooperation">협동</option>
						<option value="negotiation">협상</option>
						<!-- <option value="speed">스피드</option> -->
						<option value="agility">순발력</option>
						<option value="skill">손기술</option>
					</select>
			</tr>
			<tr>
				<td style="width: 20%"><b>기본 보드게임</b></td>
				<td style="width: 80%"><input type="text" name="rgame" id="rgame" value="${room.rgame}"></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>최대인원*</b></td>
				<td style="width: 80%">
					<input type="number" value="${room.rmaxpeople}" min="${curPnum}" max="20" name="rmaxpeople" id="rmaxpeople">
				</td>
			</tr>
			<tr>
				<td style="width: 20%"><b>장소*</b></td>
				<td style="width: 80%"><input type="text" name="rplace" id="rplace" readonly style="width:250px;" value="${room.rplace}">
					<button class="btn btn-success" id="searchplace">
						가게 찾기
						<!-- 중복 닉네임검사 , 새 창 띄워서 지도 api페이지 -> 주소 받아서 입력 -->
					</button></td>
			</tr>
			<tr>
				<td style="width: 20%"><b>모임일시*</b></td>
				<td style="width: 80%">
				<input type="hidden" name="rdatetime" id="rdatetime"> 
				<input type="date" name="rdate" id="rdate"> 
				<input type="time" name="rtime" id="rtime" step="60" required>
				<!-- <input type="datetime-local" name="rdatetime" id="rdatetime"> -->
				<p id="testp"></p>
				</td>
			</tr>
			<tr>
				<td style="width: 20%"><b>방설명</b></td>
				<td style="width: 80%">
				<textarea name="rstr" id="rstr" rows="10" cols="50" class="form-control" placeholder="모임방을 소개해보세요!">${room.rstr}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<!-- <button type="button" onclick="formcheck()" id="btnCreate" class="btn btn-success">방만들기</button> -->
					<button type="submit" id="btnCreate" class="btn btn-success">편집완료</button>
				</td>
			</tr>

		</table>
	</form>
</div>

<script type="text/javascript">
	const offset = new Date().getTimezoneOffset() * 60000;
	const today = new Date(Date.now() - offset);
	document.getElementById('rdate').min = today.toISOString().substring(0, 10);
	
	var rdatetime= '${room.rdatetime}';
	document.getElementById('rdate').value = rdatetime.substring(0, 10);
	document.getElementById('rtime').value = rdatetime.substring(11, 16);
	
	function openNaverMap() {
      $('#croomf').unbind('submit'); // submit 이벤트 핸들러 해제
      var popup = window.open('../naverMap', 'NaverMapPopup', 'width=1000px,height=1000px');
      window.addEventListener('message', function(event) {
        var storeName = event.data;
        document.getElementById('rplace').value = storeName;
        $('#croomf').submit(); // submit 이벤트 발생
      });
    }

    $('#searchplace').click(function(e) {
      e.preventDefault(); // 클릭 이벤트의 기본 동작 막음
      openNaverMap(); // 가게 찾기 함수 호출
    });
</script>
