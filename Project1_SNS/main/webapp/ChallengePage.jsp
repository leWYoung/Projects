<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ChallengePage</title>
<style>
@import url("./assets/css/FeedPage.css");
</style>
</head>
<body>
	<jsp:include page="MenuBar.jsp" />
	<!-- 피드 선택칸 -->
	<div class="feed-pick">
		<form action="orderByService" method="post">
			<ul class="cate-choice">
				<li><input type="submit" name="ob" value="all"
					 class="custom-button"><div class="cate-con">모든 챌린지</div></li>
				<li><input type="submit" name="ob" value="tak"
					class="custom-button"><div class="cate-con"> 타임 어택</div></li>
				<li><input type="submit" name="ob" value="evn"
					 class="custom-button"><div class="cate-con">친환경 요리</div></li>
				<li><input type="submit" name="ob" value="wtc"
					 class="custom-button"><div class="cate-con">세계 테마</div></li>
				<li><input type="submit" name="ob" value="asn"
					 class="custom-button"><div class="cate-con">반려동물</div></li>
				<li><input type="submit" name="ob" value="gsu"
					class="custom-button"><div class="cate-con">편의점 재료</div></li>
				<li><input type="submit" name="ob" value="plt"
					 class="custom-button"><div class="cate-con">가격 제한</div></li>
				<li><input type="submit" name="ob" value="veg"
					 class="custom-button"><div class="cate-con">비건 요리</div></li>
				<li><input type="submit" name="ob" value="vsl"
					 class="custom-button"><div class="cate-con">비쥬얼 요리</div></li>
			</ul>
		</form>
	</div>
	<div class="feedContainer">
		<c:forEach items="${resultChalList}" var="cdto">
			<div class="feedContent">
				<form action="ChalService" method="post"
					enctype="multipart/form-data">
					<a href="detailChal?id=${cdto.chal_idx}" class="feed-move">
						<div class="feed-container">
							<!-- 사용자 프로필 이미지 및 닉네임 -->
							<div class="feed-profile">
								<img class="mini-pro" src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${cdto.user_profile}" alt="User">
								<span class="mini-nic">${cdto.user_nick}</span>
							</div>
							<!-- 챌린지 제목 -->
							<div class="feed-title">
								<span>${cdto.chal_title}</span>
							</div>
						<%-- 	<div class="feed-content">
								<span>${cdto.chal_content}</span>
							</div> --%>
							<!-- 피드 이미지 -->
							<div class="feed-img-container">
								<img class="feed-img"
									src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${cdto.img}"
									alt="Feed Image">
							</div>
						</div>
					</a>
					<div class="feed-actions">
						<!-- 배경 제거된 좋아요 버튼 -->
						<button type="button" class="button-like" id="likeButton">
							<img
								src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/thumbUpBlank.png"
								class="thumb" alt="Like" id="likeIcon">
						</button>
						<!-- 좋아요 갯수를 표시하는 영역 -->
						<span class="like-count" id="likeCount">0</span>
						<!-- 댓글 버튼에 이미지 추가 -->
						<a href="FeedContent.jsp" class="button-comment"> <img
							src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/comment.png"
							class="comment-icon" alt="Comment">
						</a>
					</div>
				</form>
				<br>
			</div>
			<hr class="feed-end">
		</c:forEach>
	</div>
	<script src="./assets/js/FeedPage.js"></script>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	      const likeButton = document.getElementById('likeButton');
	      const likeIcon = document.getElementById('likeIcon');
	      const likeCount = document.getElementById('likeCount');

	      let isLiked = false; // 좋아요 상태를 추적하기 위한 변수
	      let count = 0; // 좋아요 갯수 초기값

	      likeButton.addEventListener('click', function () {
	          // 좋아요 상태에 따라 아이콘 변경 및 갯수 증가
	          if (isLiked) {
	              likeIcon.src = 'https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/thumbUpBlank.png'; // 원래 아이콘으로 변경
	              count--; // 좋아요 갯수 감소
	          } else {
	              likeIcon.src = 'https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/thumbUp.png'; // 좋아요가 눌린 아이콘으로 변경
	              count++; // 좋아요 갯수 증가
	          }

	          // 좋아요 상태 반전
	          isLiked = !isLiked;
	          likeCount.textContent = count; // 좋아요 갯수 업데이트
	      });
	  });
	</script>
	<script>
	// 모든 input 요소에 대해 data-value 값을 시각적으로 표시하도록 설정
	document.querySelectorAll('input[type="submit"]').forEach(button => {
	    button.style.color = 'transparent'; // value 값 숨김
	    button.addEventListener('click', function() {
	        console.log(`Selected value: ${button.value}`); // 선택된 값 확인용
	    });
	});
	</script>
</body>
</html>