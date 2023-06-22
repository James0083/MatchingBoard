<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="myctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>Evaluation - CAFE</title>
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
	<h1>${Room.rplace} 매장평가</h1>
	<form>
		<div class="rating-container">
			<p>질문 1: 해당 카페의 게임 종류는 다양했나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 1)">&#9734;</span> <span
					class="star" onclick="setRating(2, 1)">&#9734;</span> <span
					class="star" onclick="setRating(3, 1)">&#9734;</span> <span
					class="star" onclick="setRating(4, 1)">&#9734;</span> <span
					class="star" onclick="setRating(5, 1)">&#9734;</span>
			</div>
		</div>

		<div class="rating-container">
			<p>질문 2: 해당 카페의 매장 청결도는 깨끗했나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 2)">&#9734;</span> <span
					class="star" onclick="setRating(2, 2)">&#9734;</span> <span
					class="star" onclick="setRating(3, 2)">&#9734;</span> <span
					class="star" onclick="setRating(4, 2)">&#9734;</span> <span
					class="star" onclick="setRating(5, 2)">&#9734;</span>
			</div>
		</div>

		<div class="rating-container">
			<p>질문 3: 해당 카페의 보드게임 상태는 좋았나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 3)">&#9734;</span> <span
					class="star" onclick="setRating(2, 3)">&#9734;</span> <span
					class="star" onclick="setRating(3, 3)">&#9734;</span> <span
					class="star" onclick="setRating(4, 3)">&#9734;</span> <span
					class="star" onclick="setRating(5, 3)">&#9734;</span>
			</div>
		</div>

		<div class="rating-container">
			<p>질문 4: 보드게임카페의 게임 종류는 다양했나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 4)">&#9734;</span> <span
					class="star" onclick="setRating(2, 4)">&#9734;</span> <span
					class="star" onclick="setRating(3, 4)">&#9734;</span> <span
					class="star" onclick="setRating(4, 4)">&#9734;</span> <span
					class="star" onclick="setRating(5, 4)">&#9734;</span>
			</div>
		</div>

		<div class="rating-container">
			<p>질문 5: 보드게임카페의 게임 종류는 다양했나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 5)">&#9734;</span> <span
					class="star" onclick="setRating(2, 5)">&#9734;</span> <span
					class="star" onclick="setRating(3, 5)">&#9734;</span> <span
					class="star" onclick="setRating(4, 5)">&#9734;</span> <span
					class="star" onclick="setRating(5, 5)">&#9734;</span>
			</div>
		</div>

		<div class="rating-container">
			<p>질문 6: 보드게임카페의 게임 종류는 다양했나요?</p>
			<div class="stars">
				<span class="star" onclick="setRating(1, 6)">&#9734;</span> <span
					class="star" onclick="setRating(2, 6)">&#9734;</span> <span
					class="star" onclick="setRating(3, 6)">&#9734;</span> <span
					class="star" onclick="setRating(4, 6)">&#9734;</span> <span
					class="star" onclick="setRating(5, 6)">&#9734;</span>
			</div>
		</div>

		<br>

		<button type="submit">제출</button>
		<button type="memEval" onclick="redirectMemEval()">모임원 평가</button>
	</form>

	<script>
    let ratings = {};
    
    //별점 체크
    function setRating(value, questionNumber) {
      ratings[questionNumber] = value;

      const stars = document.querySelectorAll('.rating-container:nth-child(' + questionNumber + ') .star');
      for (let i = 0; i < stars.length; i++) {
        if (i < value) {
          stars[i].classList.add('active');
        } else {
          stars[i].classList.remove('active');
        }
      }
    }
    
    //별점 평균
    function averageRating(ratings) {
   	  const values = Object.values(ratings);
   	  const totalRating = values.reduce((sum, value) => sum + value, 0);
	  const questionCount = Object.keys(ratings).length;
   	  const avgRating = questionCount > 0 ? (totalRating / questionCount).toFixed(2) : 0;
      return avgRating;//소수점 2째자리
   	}
    
	
    //모임원 평가로 이동
    function redirectMemEval() {
        window.location.href = '../eval/memberEval';
    }
    
    document.querySelector('form').addEventListener('submit', function (e) {
      e.preventDefault();
      /* const hasEmptyRating = Object.values(ratings).some(value => value === undefined || value === null);
      if (hasEmptyRating) {
        alert('모든 질문에 별점을 선택해주세요.');
        return;
      } */
      const avgStar = averageRating(ratings);
      alert('평가에 참여해주셔서 감사합니다. 총점: ' + avgStar);
      this.reset();
      window.location.href = '../';
      
      
      
    });
  </script>
</body>
</html>
