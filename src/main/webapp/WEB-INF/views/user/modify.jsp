<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Info</title>
<link rel="stylesheet" href="http://openlayers.org/en/latest/css/ol.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
<style>
.location-selection {
	display: flex;
	align-items: center;
}

.location-select {
	margin-left: 10px;
}

/* 첫 번째 select 요소의 margin 제거 */
.location-select:first-child {
	margin-left: 0;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 100%;
	width: 750px;
	height: 100%;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-100%) translateY(-50%);
}

.m_head {
	height: 10%;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	background-color: #e7e5e5;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.m_body {
	height: 80%;
	padding: 20px;
}

.m_footer {
	height: 10%;
	padding: 15px;
	background-color: #e7e5e5;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	display: flex;
	justify-content: end;
}

.modal_title {
	font-size: 18px;
	color: gray;
	font-weight: 500;
}

.close_btn {
	font-size: 20px;
	color: rgb(139, 139, 139);
	font-weight: 900;
	cursor: pointer;
}

.input_box {
	width: 100%;
	border: 1px solid rgb(189, 189, 189);
	height: 30px;
}

.modal_btn {
	width: 80px;
	height: 30px;
	border-radius: 5px;
	text-align: center;
	font-size: 14px;
	font-weight: bolder;
	padding-top: 5px;
	margin-left: 5px;
	font-family: sans-serif;
}

.cancle {
	background-color: white;
	color: black;
}

.save {
	background-color: rgb(50, 77, 158);
	color: white;
}

.modal-content {
    display: flex;
    flex-wrap: wrap;
  }

  .modal-content .game-item {
    flex-basis: 33%;
    box-sizing: border-box;
    padding: 5px;
  }
   #m_body {
    display: flex;
    flex-wrap: wrap;
    overflow: auto;
  }

  #m_body > div {
    display: flex;
    align-items: center;
    margin-right: 10px;
    margin-bottom: 10px;
  }

  #m_body input[type="checkbox"] {
    margin-right: 5px;
  }
  
  #selectedGames {
    display: flex;
    flex-wrap: wrap;
  }

  #selectedGames p {
    padding-right: 8px;
  }
</style>

</head>
<body>
	<h1>정보 수정</h1>
	<form id="userForm" action="submitUserInfo" method="post" enctype="multipart/form-data">
		<label for="profile_img">프로필 이미지:</label>
		<input type="file" id="profile_img" name="profile_img">
		<br> <br>
		<label for="nickname">닉네임:</label>
		<input type="text" id="nickname" name="nickname">
		<br> <br>
		<label for="sido_code">지역:</label>
		<select id="sido_code" name="sido_code">
			<option>선택</option>
		</select>
		<select id="sigoon_code" name="sigoon_code">
			<option>선택</option>
		</select>
		<select id="dong_code" name="dong_code">
			<option>선택</option>
		</select>
		<select id="lee_code" name="lee_code">
			<option>선택</option>
		</select>
		<br><br>

	<label>장르:</label>
	<input type="checkbox" id="genre1" name="genre" value="IQ"
		onclick="count_check(this)">
	<label for="genre1">IQ</label>
	<input type="checkbox" id="genre2" name="genre" value="strategy"
		onclick="count_check(this)">
	<label for="genre2">전략</label>
	<input type="checkbox" id="genre3" name="genre" value="psychology"
		onclick="count_check(this)">
	<label for="genre3">심리</label>
	<input type="checkbox" id="genre4" name="genre" value="reasoning"
		onclick="count_check(this)">
	<label for="genre4">추리</label>
	<input type="checkbox" id="genre5" name="genre" value="cooperation"
		onclick="count_check(this)">
	<label for="genre5">협동</label>
	<input type="checkbox" id="genre6" name="genre" value="negotiation"
		onclick="count_check(this)">
	<label for="genre6">협상</label>
	<input type="checkbox" id="genre7" name="genre" value="agility"
		onclick="count_check(this)">
	<label for="genre7">순발력</label>
	<input type="checkbox" id="genre8" name="genre" value="skill"
		onclick="count_check(this)">
	<label for="genre8">손기술</label>
	<br>

	<label>게임: </label>
	<div id="selectedGames"></div>
	<button type="button" onclick="openGameModal()">게임 찾기</button>

	<div class="modal" id="modal">
		<div class="modal_body">
			<div class="m_head">
				<div class="modal_title">게임 목록</div>
				<div class="close_btn" id="close_btn">X</div>
			</div>
			<div class="m_body" id="m_body">
				<c:forEach var="game" items="${gameList}">
					<div>
						<input type="checkbox" name="games" value="${game}" onclick="count_check(this)">${game}
					</div>
				</c:forEach>
			</div>
			<div class="m_footer">
				<div class="modal_btn cancle" id="close_btn_cancle">CANCLE</div>
				<div class="modal_btn save" id="save_btn">SAVE</div>
			</div>
		</div>
	</div>


	<br>
	<br>
	<button type="button" id="usermodify" onclick="submitForm()">수정하기</button>
	<button type="button" id="testSubmit">반환값 테스트</button>
	</form>

	<script>
	// 반환값 테스트 버튼 클릭 이벤트 처리
	  document.getElementById("testSubmit").addEventListener("click", function() {
    var formData = {
      profile_img: document.getElementById("profile_img").value,
      nickname: document.getElementById("nickname").value,
      sido_code: document.getElementById("sido_code").value,
      sigoon_code: document.getElementById("sigoon_code").value,
      dong_code: document.getElementById("dong_code").value,
      lee_code: document.getElementById("lee_code").value,
      games: [],
      genres: []
    };

    // 선택된 게임 정보 가져오기
    var gameCheckboxes = document.getElementsByName("game");
    for (var i = 0; i < gameCheckboxes.length; i++) {
      if (gameCheckboxes[i].checked) {
        formData.games.push(gameCheckboxes[i].value);
      }
    }

    // 선택된 장르 정보 가져오기
    var genreCheckboxes = document.getElementsByName("genre");
    for (var i = 0; i < genreCheckboxes.length; i++) {
      if (genreCheckboxes[i].checked) {
        formData.genres.push(genreCheckboxes[i].value);
      }
    }

    console.log("반환값 테스트: ", formData);
  });
		
		$.support.cors = true;

		$(function() {
			$.ajax({
				type : "get",
				url : "https://api.vworld.kr/req/data?key=E4041AA7-D585-39C3-9DC7-A5B6EA4C7B00&domain=http://localhost:9090/matchingboard/user/modify.jsp&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
				async : false,
				dataType : 'jsonp',
				success : function(data) {
							let html = "<option>선택</option>";
							console.log(data);
							data.response.result.featureCollection.features
									.forEach(function(f) {
										console.log(f.properties)
										let regionCode = f.properties.ctprvn_cd;
										let regionName = f.properties.ctp_kor_nm;
										console.log(regionCode)
										console.log(regionName)
										// html += '<option value="' + regionCode + '">' + regionName + '</option>'
										html += `<option value="\${regionCode}">\${regionName}(\${regionCode})</option>`

									})

							$('#sido_code').html(html);

						},
						error : function(xhr, stat, err) {
						}
					});

			$(document).on("change","#sido_code",function() {
								let thisVal = $(this).val();
								$.ajax({
									type : "get",
									url : "https://api.vworld.kr/req/data?key=E4041AA7-D585-39C3-9DC7-A5B6EA4C7B00&domain=http://localhost:9090/matchingboard/user/modify.jsp&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
									data : {attrfilter : 'sig_cd:like:'+ thisVal},
									async : false,
									dataType : 'jsonp',
									success : function(data) {
												let html = "<option>선택</option>";
												console.log(data)
												data.response.result.featureCollection.features.forEach(function(f) {
															console.log(f.properties)
															let regionCode = f.properties.sig_cd;
															let regionName = f.properties.sig_kor_nm;
															html += `<option value="\${regionCode}">\${regionName}(\${regionCode})</option>`
														})
												$('#sigoon_code').html(html);
											},
											error : function(xhr, stat, err) {
											}
										});
							});

			$(document).on("change","#sigoon_code",function() {
								let thisVal = $(this).val();

								$.ajax({
									type : "get",
									url : "https://api.vworld.kr/req/data?key=E4041AA7-D585-39C3-9DC7-A5B6EA4C7B00&domain=http://localhost:9090/matchingboard/user/modify.jsp&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
									data : {attrfilter : 'emd_cd:like:'+ thisVal},
									async : false,
									dataType : 'jsonp',
									success : function(data) {
												let html = "<option>선택</option>";
												data.response.result.featureCollection.features.forEach(function(f) {
															console.log(f.properties)
															let regionCode = f.properties.emd_cd;
															let regionName = f.properties.emd_kor_nm;
															html += `<option value="\${regionCode}">\${regionName}(\${regionCode})</option>`
														})
												$('#dong_code').html(html);

											},
											error : function(xhr, stat, err) {
											}
										});

							});

			// 읍면 코드로 검색
			$(document).on("change","#dong_code",function() {
								let thisVal = $(this).val();
								$.ajax({
									type : "get",
									url : "https://api.vworld.kr/req/data?key=E4041AA7-D585-39C3-9DC7-A5B6EA4C7B00&domain=http://localhost:9090/matchingboard/user/modify.jsp&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADRI_INFO",
									data : {attrfilter : 'li_cd:like:'+ thisVal},
									async : false,
									dataType : 'jsonp',
									success : function(data) {
												let html = "<option></option>";
												data.response.result.featureCollection.features.forEach(function(f) {
															console.log(f.properties)
															let regionCode = f.properties.li_cd;
															let regionName = f.properties.li_kor_nm;
															html += `<option value="\${regionCode}">\${regionName}(\${regionCode})</option>`

														})
												$('#lee_code').html(html);

											},
											error : function(xhr, stat, err) {
											}
										});

							});
		})


		
		function count_check(checkbox) {
		    var checkboxes = document.getElementsByName('game');
		    var checkboxes = document.getElementsByName("genre");
		    var totalChecked = 0;
		    for (var i = 0; i < checkboxes.length; i++) {
		        if (checkboxes[i].checked) {
		            totalChecked++;
		        }
		    }
		    if (totalChecked > 3) {
		        alert('3개 이상 선택할 수 없습니다.');
		        checkbox.checked = false;
		    }
		}
		
		var gameList = [
	        <c:forEach items="${gameName}" var="game">
	            '<c:out value="${game}" />',
	        </c:forEach>
	    ];

		function openGameModal() {
			// 게임 목록 초기화
			$("#m_body").empty();

			// 각 게임에 대한 체크박스 생성
			for (var i = 0; i < gameList.length; i++) {
				var checkBox = document.createElement("input");
				var label = document.createElement("label");
				var div = document.createElement("div");
				checkBox.type = "checkbox";
				checkBox.name = "game";
				checkBox.value = gameList[i];
				checkBox.onclick = function() { count_check(this); };
				label.appendChild(document.createTextNode(gameList[i]));
				div.appendChild(checkBox);
				div.appendChild(label);
				document.getElementById("m_body").appendChild(div);
			}

			// 모달 표시
			document.getElementById("modal").classList.add("show");
		}

		// 모달 닫기
		document.getElementById("close_btn").addEventListener("click",
				function() {
					document.getElementById("modal").classList.remove("show");
				});
		
		document.getElementById("close_btn_cancle").addEventListener("click",
				function() {
					document.getElementById("modal").classList.remove("show");
				});

		// 게임 저장 버튼 클릭 시 실행될 함수
		document.getElementById("save_btn").addEventListener(
				"click",
				function() {
					var checkedGames = [];
					$("#m_body input:checked").each(function() {
						checkedGames.push($(this).val());
					});

					// 선택한 게임을 '#selectedGames' 요소에 표시
					$("#selectedGames").empty();
					for (var i = 0; i < checkedGames.length; i++) {
						$("#selectedGames").append(
								'<p>' + checkedGames[i] + '</p>');
					}

					// 모달 닫기
					document.getElementById("modal").classList.remove("show");
		});
		
		function submitForm() {
			  var formData = new FormData();

			  // 프로필 이미지
			  var profileImg = document.getElementById("profile_img").files[0];
			  formData.append("profile_img", profileImg);

			  // 닉네임
			  var nickname = document.getElementById("nickname").value;
			  formData.append("nickname", nickname);

			  // 시도, 시군구, 동, 리 코드
			  var sidoCode = document.getElementById("sido_code").value;
			  var sigoonCode = document.getElementById("sigoon_code").value;
			  var dongCode = document.getElementById("dong_code").value;
			  var leeCode = document.getElementById("lee_code").value;
			  formData.append("sido_code", sidoCode);
			  formData.append("sigoon_code", sigoonCode);
			  formData.append("dong_code", dongCode);
			  formData.append("lee_code", leeCode);

			  // 선택된 장르
			 var genres = [];
			 var genreCheckboxes = document.getElementsByName("genre");
			 for (var i = 0; i < genreCheckboxes.length; i++) {
  					if (genreCheckboxes[i].checked) {
    					genres.push(genreCheckboxes[i].value);
    					 formData.append("genres", genreCheckboxes[i].value);
  					}
			 }

			 var games = [];
			 var gameCheckboxes = document.getElementsByName("game");
			 for (var i = 0; i < gameCheckboxes.length; i++) {
  					if (gameCheckboxes[i].checked) {
    					games.push(gameCheckboxes[i].value);
    					formData.append("games", gameCheckboxes[i].value);
  					}
			 }
			 //formData.append("genres", genres);
			 //formData.append("games", games);


			  // AJAX 요청
			  $.ajax({
			    url: "submitUserInfo",
			    type: "POST",
			    data: formData,
			    processData: false,
			    contentType: false,
			    success: function(response) {
			      console.log("서버 응답: ", response);
			      if (response === 'success') {
			            window.location.href = "http://localhost:9090/matchingBoard/";
			        } else {
			            alert(response);
			        }
			    },
			    error: function(xhr, status, error) {
			      // 요청 실패 시 처리 로직
			      console.error("요청 실패: ", error);
			    }
			  });
			}
	</script>
</body>
</html>