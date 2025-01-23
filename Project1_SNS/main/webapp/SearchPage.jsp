<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FeedPage</title>
<style>
@import url("./assets/css/FeedPage.css");
</style>
</head>

<body>
<jsp:include page="MenuBar.jsp" />
	<div class="main-center">
		<!-- --------------------------상단 끝-------------------------------- -->
		<!-- 피드 띄우기 -->
		<c:forEach items="${searchFeed}" var="searchfeed">
			<div class="feedContent">
				<form action="FeedService" method="post"
					enctype="multipart/form-data">
					<a href="detailFeed?id=${searchfeed.feed_idx}" class="feed-move">
						<div class="feed-container">
							<!-- 사용자 프로필 이미지 및 닉네임 -->
							<div class="feed-profile">
								<img class="mini-pro" src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${searchfeed.user_profile}" alt="User">
								<span class="mini-nic">${searchfeed.user_nick}</span>
							</div>
							<!-- 챌린지 제목 -->
							<div class="feed-title">
								<span>${searchfeed.feed_title}</span>
							</div>
							<!-- 피드 이미지 -->
							<div class="feed-img-container">
								<img class="feed-img"
									src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${searchfeed.feed_img}"
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
		</c:forEach>

		<!-- 챌린지 띄우기 -->
		<c:forEach items="${searchChal}" var="searchchal">
			<div class="feedContent">
				<form action="ChalService" method="post"
					enctype="multipart/form-data">
					<a href="detailChal?id=${searchchal.chal_idx}" class="feed-move">
						<div class="feed-container">
							<!-- 사용자 프로필 이미지 및 닉네임 -->
							<div class="feed-profile">
								<img class="mini-pro" src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${searchchal.user_profile}" alt="User">
								<span class="mini-nic">${searchchal.user_nick}</span>
							</div>
							<!-- 챌린지 제목 -->
							<div class="feed-title">
								<span>${searchchal.chal_title}</span>
							</div>
							<!-- 피드 이미지 -->
							<div class="feed-img-container">
								<img class="feed-img"
									src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${searchchal.img}"
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
		</c:forEach>

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

	</div>
	<script src="./assets/js/FeedPage.js"></script>
</body>
</body>
</html>