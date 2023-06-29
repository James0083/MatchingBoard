<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="myctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>Evaluation - MEMBER</title>
<script src="https://jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

h1 {
	text-align: center;
}

.rating-container {
	margin-top: 30px;
	max-width: 400px;
}

.rating-container p {
	font-weight: bold;
	margin-bottom: 10px;
}

.rating-container .range-value {
	font-weight: bold;
}

.rating-container .range-slider {
	width: 100%;
	margin-bottom: 20px;
}

.rating-container button {
	display: block;
	margin-top: 20px;
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

.rating-container button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>모임원 평가</h1>

	<c:set var="memberNum" value="3" />
	<!-- 참여인원 수 -->

	<form action="${myctx}/eval/memberEval" method="post">
		<c:forEach var="i" begin="1" end="${memberNum}" varStatus="stat">

			<div class="member-rating">
				<h4>${i}님 평가</h4>
				<!-- 참여인원 닉네임 필요 -->
				<div class="rating-container">
					<c:forEach var="j" items="${question}" varStatus="stat2">
						<p>${j.key}:${j.value}?</p>
						<input type="range" class="range-slider" 
						id="range${stat.index*3+stat2.index}" name="range${stat.index*3+stat2.index}" 
						min="1" max="100" value="50" onchange="updateRangeValue(this)">
						<p class="range-value">50</p>
					</c:forEach>
					<input type="text" name="avgRating${stat.index}" id="avgRating${stat.index}">
				</div>
			</div>
		</c:forEach>

		<br>
		<input type="hidden" name="" id="">
		<button type="submit">제출</button>
	</form>

	<script>
	  // range 값 업데이트
	  function updateRangeValue(rangeSlider) {
	    const rangeValue = rangeSlider.nextElementSibling;
	    rangeValue.innerText = rangeSlider.value;
	  }
	</script>
</body>
</html>
