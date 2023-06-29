<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form name="evalMem" id="evalMem" action="../eval/memberEval" method="post">
		<c:forEach var="member" items="${userList}" varStatus="stat">
			<div class="member-rating">
				<h4>${member.nickname}님 평가</h4>
				<div class="rating-container">
					<c:forEach var="question" items="${question}" varStatus="stat2">
						<p>${question.key}:${question.value}?</p>
						<input type="range" class="range-slider" min="1" max="100"
							value="50"
							onchange="updateRangeValue(this, ${stat.index}, ${stat2.index})">
						<p class="range-value">50</p>
					</c:forEach>
					<input type="hidden" name="memberEvals[${stat.index}].userId"
						value="${member.userid}" />
				</div>
			</div>
		</c:forEach>
		<br> 
		<input type="hidden" name="ranges" id="avgRange">
		<button type="submit">제출</button>
	</form>
	<script>
  // range 값 업데이트
  function updateRangeValue(rangeSlider, rangePoint) {
    const rangeValue = rangeSlider.nextElementSibling;
    rangeValue.innerText = rangeSlider.value;
    setRanges(rangeSlider.value, rangePoint);
  }
  
  // 맴버 range 체크
  let ranges = [];
  
  function setRanges(value, rangePoint) {
    ranges[rangePoint] = value;
  }
  
  
  $(function(){
	   $('#evalMem').submit(function(){
	     var avgRanges = calculateAverageRanges(ranges);
	     $('#avgRange').val(avgRanges.join(', '));
	     return true;
	   });
	});


	//맴버별 평점 구하기
	function calculateAverageRanges(ranges) {
		var avgRanges = [];
    	for (var i = 0; i < ranges.length; i++) {
      		var sum = 0;
      		for (var j = 0; j < ranges[i].length; j++) {
        		sum += parseInt(ranges[i][j]);
      		}
      		var avg = sum / ranges[i].length;
      		avgRanges.push(avg);
   		}
    return avgRanges;
  }
</script>

</body>
</html>
