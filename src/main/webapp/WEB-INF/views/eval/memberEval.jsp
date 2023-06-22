<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="myctx" value="${pageContext.request.contextPath}" />

<!-- 모임원 개별 평가(본인 제외), 모임원 평가 건너뛰기 있음 -->

<!DOCTYPE html>
<html>
<head>
<title>Evaluation - MEMBER</title>
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

.rating-container .stars {
	display: inline-block;
	font-size: 24px;
	cursor: pointer;
	caret-color: transparent; /* 깜빡이는 커서 숨김 */
}

.rating-container .stars .star {
	color: gray;
	transition: color 0.3s;
}

.rating-container .stars .star:hover, .rating-container .stars .star.active
	{
	color: red;
	content: "\2605";
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

	<form>
		<c:forEach var="i" begin="1" end="${memberNum}" varStatus="stat">

			<div class="member-rating">
				<h4>${i}님 평가</h4>
				<!-- 참여인원 닉네임 필요 -->
				<div class="rating-container">
					<c:forEach var="j" items="${question}" varStatus="stat2">
						<p>${j.key}:${j.value}?</p>
						<div class="stars" id="stars${stat.index*3+stat2.index}">
							<c:forEach var="star" begin="1" end="5">
								<span class="star"
									onclick="setRating(${star},${stat.index*3+stat2.index})">&#9734;</span>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:forEach>

		<br>
		<button type="submit">제출</button>
	</form>

	<script>
	  let ratings = {};
	
	  // 별점 체크
	  function setRating(value, questionNumber) {
		//console.log(questionNumber+"<<<<")
	    ratings[questionNumber] = value;
	    
	   const ratingContainer = document.querySelectorAll('.rating-container')[questionNumber - 1];
	   // const stars = ratingContainer.querySelectorAll('.stars .star');//동적인 코드를 정적으로 이용하는 부분에서 문제
	   const stars =$('#stars'+questionNumber+".star");
	   //alert(stars.length)
	    
	    for (let i = 0; i < stars.length; i++) {
	      if (i < value) {
	        stars[i].classList.add('active');
	      } else {
	        stars[i].classList.remove('active');
	      }
	    }
	  }

        //참가자별 평균 별점 계산
        function averageRatings(ratings) {
            const memberCount = ${memberNum};
            const avgRatings = {};
            for (let i = 1; i <= memberCount; i++) {
                const memberRatings = Object.values(ratings).filter(key => key.startsWith(i));//참가자 인덱스를 key로 변환
                const ratingSum = memberRatings.reduce((sum, value) => sum + value, 0);
                const avgRating = ratingSum / 3;
                avgRatings[i] = avgRating;
            }
            return avgRatings;
        }
        
        document.querySelector('form').addEventListener('submit', function (e) {
            e.preventDefault();
            const hasEmptyRating = Object.values(ratings).some(value => value === undefined);
            /* if (hasEmptyRating) {
                alert('모든 질문에 별점을 선택해주세요.');
                return;
            } */
            const avgStars = averageRatings(ratings);
            alert('평가에 참여해주셔서 감사합니다. 총점: ' + avgStars);
            this.reset();
            window.location.href = '../';
        });
    </script>
</body>
</html>