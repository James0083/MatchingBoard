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

	<%!public static int getMemberNum() {
		// VO에서 인원 수 가져와야 함
		int memberNum = 3; // 예시로 3명이라 가정
		return memberNum;
	}%>

	<%
	int memberNum = getMemberNum();

	StringBuilder buf = new StringBuilder();
	buf.append("<form>\n");

	/* 인원 수 만큼 반복 */
	for (int i = 1; i <= memberNum; i++) {
		buf.append("  <h4>").append(i).append("님 평가</h4>\n");
		buf.append("  <div class=\"rating-container\">\n");
		buf.append("    <p>질문 1: 해당 모임원이 시간약속은 잘 지켰나요?</p>\n");
		buf.append("    <div class=\"stars\">\n");
		/* 별점 반복 */
		for (int j = 1; j <= 5; j++) {
			buf.append("      <span class=\"star\" onclick=\"setRating(").append(j).append(", ").append(i)
			.append(")\">&#9734;</span>\n");
		}
		buf.append("    </div>\n");
		buf.append("  </div>\n");

		buf.append("  <div class=\"rating-container\">\n");
		buf.append("    <p>질문 2: 해당 모임원의 게임플레이 매너는 어떠했나요?</p>\n");
		buf.append("    <div class=\"stars\">\n");
		for (int j = 1; j <= 5; j++) {
			buf.append("      <span class=\"star\" onclick=\"setRating(").append(j).append(", ").append(i)
			.append(")\">&#9734;</span>\n");
		}
		buf.append("    </div>\n");
		buf.append("  </div>\n");

		buf.append("  <div class=\"rating-container\">\n");
		buf.append("    <p>질문 3: 해당 모임원의 모임참여 매너는 어떠했나요?</p>\n");
		buf.append("    <div class=\"stars\">\n");
		for (int j = 1; j <= 5; j++) {
			buf.append("      <span class=\"star\" onclick=\"setRating(").append(j).append(", ").append(i)
			.append(")\">&#9734;</span>\n");
		}
		buf.append("    </div>\n");
		buf.append("  </div>\n");
	}

	buf.append("  <br>\n");
	buf.append("  <button type=\"submit\">제출</button>\n");
	buf.append("</form>");

	out.println(buf.toString());
	%>

	<script>
        let ratings = {};

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

        document.querySelector('form').addEventListener('submit', function (e) {
            e.preventDefault();
            const hasEmptyRating = Object.values(ratings).some(value => value === undefined);
            if (hasEmptyRating) {
                alert('모든 질문에 별점을 선택해주세요.');
                return;
            }
            alert('평가에 참여해주셔서 감사합니다.');
            this.reset();
            window.location.href = '../';
        });
    </script>
</body>
</html>