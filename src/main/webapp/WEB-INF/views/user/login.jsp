<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MatchingBoard- 보드게임카페 동행를 찾는 커뮤니티</title>
<style>
.button-group {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}

.button {
  margin: 0 10px;
}

</style>
</head>
<body>
	<div class="container text-center" style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 80vh; padding: 5px;">
		<h2 style="padding:30px;">MatchingBoard에 오신 것을 환영합니다.</h2>
		<h4 style="padding:30px;">로그인 하기</h4>
		<div class="button-group" style="padding:80px;">
			<div><a class="button Naver"> <span>Sign in with Naver</span></a></div>
			<div><a class="button Kakao"> <span>Sign in with Kakao</span></a></div> 
			<div><a class="button Google"><span>Sign in with Google</span></a></div>
		</div>
	</div>

</body>
</html>