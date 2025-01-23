<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>
<link rel="stylesheet" href="./assets/css/MyPage.css">
<style>
.menu-bar .blocks-menus {
	width: 100%;
	background: white;
	padding-top: 20px;
	text-align: center;
	display: inline-block;
	position: relative;
	z-index: 120;
	left: 11px;
	top: 8px;
}

.menu-bar .search-icon {
	position: relative;
	float: right;
	width: 40px;
	height: 40px;
	top: -6px;
	right: 46px;
}

.menu-bar .search-container {
	height: 60px;
	width: 125%;
	display: inline-block;
	margin: 0px auto;
	left: -8%;
	position: relative;
	top: 15px;
}

.menu-bar .input#search-bar {
	margin: 0 auto;
	width: 80%;
	height: 22px;
	padding: 0 20px;
	font-size: 0.7rem;
	border-radius: 10px;
	border: 1px solid #D0CFCE;
	outline: none;
}

</style>
</head>
<body>
	<jsp:include page="MenuBar.jsp" />
	<div class="content-center">
		<div>
			<!-- User Info Bar -->
			<div class="user-info-bar">
				<div class="ufo-bar-col1"></div>
				<!-- 프로필 사진 수정 기능을 넣은 자리 (ufo-bar-col2) -->
				<div class="ufo-bar-col2">
					<div class="profile-pic-wrapper">
						<img id="profile-pic"
							src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${info.user_profile}"
							alt="Profile Picture" class="profile-pic"
							style="cursor: pointer;"> <input type="file"
							id="upload-profile-pic" accept="image/*" style="display: none;">
						<!-- <p>프로필 사진 수정</p> -->
					</div>
				</div>

				<div class="ufo-bar-col3">
					<div class="ufo-bar-col3-inner">
						<div class="username-wrapper-outer">
							<div class="username-wrapper">
								<h3 class="username-dev">${info.user_nick}</h3>
							</div>
							<div>
								<a class="ufo-bar-fff" href=""><span>${followCnt.follower}</span>
									팔로워</a> <a class="ufo-bar-fff" href=""><span>${followingCnt.following}</span>
									팔로잉</a>
							</div>
						</div>
					</div>
				</div>

				<div class="ufo-bar-col4">
					<div class="ufo-bar-col4-inner">
						<!-- 팔로우 버튼 교체 -->
						<button id="followButton" type="button"
							class="tw-inline-flex tw-items-center tw-justify-center tw-border tw-border-solid tw-bg-color-background-button-completed tw-text-color-text-button-completed tw-border-color-slate-200 tw-text-base tw-px-4 tw-py-3 tw-rounded-md tw-font-bold focus:tw-outline-none focus-visible:tw-outline-none focus-visible:tw-ring-2 focus-visible:tw-ring-offset-2 focus-visible:tw-ring-color-slate-500 tw-bg-color-background-button-primary-bold-enabled">
							<svg width="24" height="24" stroke-width="0" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg">
                                <g>
                                    <g id="style=outline">
                                        <path id="Vector (Stroke)"
									fill-rule="evenodd" clip-rule="evenodd"
									d="M19.669 6.25671C20.0795 6.62617 20.1128 7.25846 19.7433 7.66897L10.7433 17.669C10.5598 17.8729 10.3005 17.9925 10.0263 17.9997C9.75204 18.0069 9.48688 17.9011 9.29289 17.7071L4.29289 12.707C3.90237 12.3165 3.90237 11.6833 4.2929 11.2928C4.68343 10.9023 5.31659 10.9023 5.70711 11.2928L9.96181 15.5476L18.2567 6.33104C18.6262 5.92053 19.2585 5.88726 19.669 6.25671Z">
                                        </path>
                                    </g>
                                </g>
                            </svg>
							<span class="tw-text-ellipsis tw-line-clamp-1 tw-ml-1">팔로우</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Button Tabs -->
		<div class="user-info-bar2">
			<div class="ufo-bar2-col1"></div>
			<div id="ufo-home" class="ufo-bar2-col2 ufo-bar2-block">
				<div class="ufo-bar2-col2-inner flexbox">
					<span><i class="uil uil-trophy"></i></span>
					<h3>정보수정</h3>
				</div>
			</div>
			<div id="ufo-videos" class="ufo-bar2-col3 ufo-bar2-block">
				<div class="ufo-bar2-col3-inner flexbox">
					<span><i class="uil uil-star"></i></span>
					<h3>게시물</h3>
				</div>
			</div>
			<div id="ufo-images" class="ufo-bar2-col4 ufo-bar2-block">
				<div class="ufo-bar2-col4-inner flexbox">
					<span><i class="uil uil-comment-alt"></i></span>
					<h3>팔로워</h3>
				</div>
			</div>
			<div id="ufo-about" class="ufo-bar2-col6 ufo-bar2-block">
				<div class="ufo-bar2-col6-inner flexbox">
					<span><i class="uil uil-user"></i></span>
					<h3>팔로잉</h3>
				</div>
			</div>
		</div>

		<!-- feed-area -->
		<div id="Feed-area">
			<!-- Content for each section will be dynamically inserted here -->
			<div class="feed-container content-section">
				<form action="FeedService" method="post"
					enctype="multipart/form-data">
					<c:forEach items="${myFeedList}" var="feed">
						<a href="detailFeed" class="feed-move"> <!-- 반복되는 각 항목에 .feed-item 클래스를 추가 -->
							<div class="feed-item">
								<table>
									<tr>
										<td colspan="2">
											<span class="feed-title">${feed.feed_title}</span>
										</td>
									</tr>
									<tr class="feed-img-td">
										<td colspan="2"><img class="feed-img"
											src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${feed.feed_img}"
											alt="Feed Image"></td>
									</tr>
								</table>
							</div>
						</a>
					</c:forEach>
				</form>
			</div>
		</div>

		<!-- 팔로워 -->
		<div id="follower-area">
			<!-- Content for each section will be dynamically inserted here -->
			<c:forEach items="${follow}" var="follower">
				<div class="content-section">
					<table>
						<tr>
							<td>${follower.eruser_profile}</td>
							<td>${follower.eruser_nick}</td>
						</tr>
					</table>
					<br>
				</div>
			</c:forEach>
		</div>

		<!-- 팔로워 -->
		<div id="following-area">
			<!-- Content for each section will be dynamically inserted here -->
			<c:forEach items="${following}" var="following">
				<div class="content-section">
					<table>
						<tr>
							<td>${following.inguser_profile}</td>
							<td>${following.inguser_nick}</td>
						</tr>
					</table>
					<br>
				</div>
			</c:forEach>
		</div>
		<!-- 개인정보 수정 -->
		<div id="content-area"></div>
	</div>
	<script src="./assets/js/MyPage.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.js"></script>
</body>

</html>