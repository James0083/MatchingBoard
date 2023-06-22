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
		<c:forEach var="i" begin="1" end="${memberNum}">
			<div class="member-rating">
				<h4>${i}님평가</h4>
				<!-- 참여인원 닉네임 필요 -->
				<div class="rating-container">
					<p>질문 1: 해당 모임원이 시간약속은 잘 지켰나요?</p>
					<%-- <div class="stars">
						<c:forEach var="star" begin="1" end="5">
							<span class="star" onclick="setRating(${star}, ${(i*2)})">&#9734;</span>
						</c:forEach>
					</div> --%>
					<div class="stars">
						<span class="star" onclick="setRating(1, ${(i-1)*3+1})">&#9734;</span> 
						<span class="star" onclick="setRating(2, ${(i-1)*3+1})">&#9734;</span> 
						<span class="star" onclick="setRating(3, ${(i-1)*3+1})">&#9734;</span> 
						<span class="star" onclick="setRating(4, ${(i-1)*3+1})">&#9734;</span> 
						<span class="star" onclick="setRating(5, ${(i-1)*3+1})">&#9734;</span>
					</div>
					<p>질문 2: 해당 모임원의 게임플레이 매너는 어떠했나요?</p>
					<div class="stars">
						<span class="star" onclick="setRating(1, ${(i-1)*3+2})">&#9734;</span> 
						<span class="star" onclick="setRating(2, ${(i-1)*3+2})">&#9734;</span> 
						<span class="star" onclick="setRating(3, ${(i-1)*3+2}">&#9734;</span>
						<span class="star" onclick="setRating(4, ${(i-1)*3+2})">&#9734;</span> 
						<span class="star" onclick="setRating(5, ${(i-1)*3+2})">&#9734;</span>
					</div>
					<p>질문 3: 해당 모임원의 모임참여 매너는 어떠했나요?</p>
					<div class="stars">
						<span class="star" onclick="setRating(1, ${(i-1)*3+3})">&#9734;</span>
						<span class="star" onclick="setRating(2, ${(i-1)*3+3})">&#9734;</span> 
						<span class="star" onclick="setRating(3, ${(i-1)*3+3})">&#9734;</span>
						<span class="star" onclick="setRating(4, ${(i-1)*3+3})">&#9734;</span> 
						<span class="star" onclick="setRating(5, ${(i-1)*3+3})">&#9734;</span>
					</div>
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
	    ratings[questionNumber] = value;
	    
	    const ratingContainer = document.querySelectorAll('.rating-container')[questionNumber - 1];
	    const stars = ratingContainer.querySelectorAll('.stars .star');
	    
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
                const memberRatings = Object.values(ratings).filter(key => key.startsWith(i));
                const ratingSum = memberRatings.reduce((sum, value) => sum + value, 0);
                const ratingCount = memberRatings.length;
                const avgRating = ratingSum / ratingCount;
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