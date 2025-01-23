<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Menu Bar</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Lato:400,700,400italic'
	rel='stylesheet' type='text/css'>
<head>
<style>
.main-center {
	width: 60%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	pointer-events: auto;
}

.blocks-menus {
	width: 100%;
	background: white;
	padding-top: 20px;
	text-align: center;
	display: inline-block;
	position: relative;
	z-index: 100;
}

.container {
	padding-left: 15px;
	padding-right: 15px;
}

.primary-menus {
	display: inline-block;
	margin: 0;
	padding: 0;
}

.primary-menus li {
	list-style: none;
	float: left;
	padding: 0 10px;
}

.primary-menus li a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: normal;
	color: #303030;
	font-size: 12px;
	font-weight: 600;
	transition: all 0.2s ease-in-out;
}

.primary-menus li a:hover {
	color: #D4B062;
}

/* 메뉴 드롭다운 스타일 */
.menus-megamenus:hover .mega-menus {
	opacity: 1;
	visibility: visible;
}

.mega-menus {
	display:flex;
	opacity: 0;
    visibility: hidden;
    position: absolute;
    left: 0;
    right: 0;
    height:150px;
    top: 75%;
    margin: 15px auto;
    width: 70%;
    border: 1px solid #ECECEC;
    padding: 0 15px;
    transition: all 0.2s ease-in-out;
    background-color: white;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    /* background-image: url(https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9e86dd30876159.5637811adc76c.jpg); */
    background-size: 100%;
    background-repeat: no-repeat;
}

.mega-menus li {
	float: none;
	text-align: left;
	padding: 0;
}

.section {
	float: left;
	margin: 35px 15px;
	width: 30% ;
	margin: 35px 15px;
}

.section h3 {
	font-family: Arial, sans-serif;
	position: relative;
	font-size: 16px;
	padding: 10px 0;
	text-transform: uppercase;
	border-bottom: 1px solid #d6d6d6;
}

.logo-container {
	display: inline-block;
	vertical-align: middle;
	margin-right: 30px; /* 메뉴와 로고 간격 */
}

.logo-image {
	height: 40px;
	width: auto;
	transition: transform 0.3s ease-in-out;
}

.logo-container a:hover .logo-image {
	transform: scale(1.1);
}

.search-container {
	width: 100%;
	display: inline-block;
	margin: 0px auto;
	left: -5%;
	position: relative;
	top: 15px;
}

.search-bar {
	margin: 0 auto;
	width: 80%;
	height: 20px;
	padding: 0 20px;
	font-size: 0.7rem;
	border-radius: 10px;
	border: 1px solid #D0CFCE;
	outline: none;
}

.search-bar:focus {
	border: 1px solid #008ABF;
	transition: 0.35s ease;
	color: #008ABF;
}

.search-icon {
	position: relative;
    float: right;
    width: 40px;
    height: 40px;
    top: -31px;
}

.mypage-container {
	position: relative;
	display: inline-block;
}

.mypage-icon {
	position: relative;
	top: 10px;
	width: 30px;
	height: auto;
	cursor: pointer;
}

.mypage-dropdown {
	display: none; /* 기본적으로 숨김 */
	position: absolute;
	top: 50px;
	left: -2px;
	background-color: white;
	box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 300;
	border-radius: 5px;
	padding: 10px;
	width: 200px;
	gap: 10px;
	flex-wrap: wrap;
}

.mypage-dropdown li {
	flex: 1 1 45%;
	margin: 5px 0;
	list-style: none;
}

.mypage-dropdown li a {
	text-decoration: none;
	color: black;
	display: block;
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.mypage-dropdown li a:hover {
	background-color: #f1f1f1;
}

.login-con {
	position: relative;
	top: 15px;
}

.writeButton {
	top: 5px;
	position: relative;
	padding: 10px 20px;
	background-color: #FF6F61;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: auto;
}

.write-dropdown {
	top: 70px;
	left: 74.3%;
	display: none;
	position: absolute;
	background-color: white;
	box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 300;
	border-radius: 5px;
	padding: 10px;
	width: 200px;
	gap: 10px;
	flex-wrap: wrap;
}

.write-dropdown li {
	flex: 1 1 45%;
	margin: 5px 0;
	list-style: none;
}

.write-dropdown li a {
	text-decoration: none;
	color: black;
	display: block;
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.write-dropdown li a:hover {
	background-color: #f1f1f1;
}

.line {
	width:80%;
	border-top: 1px solid #000;
	margin-top: 0;
	margin-bottom: 0;
	
.cate-name{
	font-size:20px;
	font-weight:bold;
}
}
</style>
</head>
<body>
	<div class="main-center">
		<div class="menu-bar blocks-menus">
			<div class="container">
				<ul class="primary-menus">
					<li>
						<!-- 로고와 메뉴를 담는 전체 컨테이너 -->
						<div class="logo-container">
							<!-- 로고 이미지가 위치한 링크 -->
							<a href="MainFeedService"> <img
								src=https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/littleLogo2.png
								alt="" class="logo-image">
							</a>
						</div>
					</li>
					<li class="search">
						<form action="searchService" class="search-container"
							method="post">
							<input type="text" name="search" class="search-bar" 
								placeholder="챌린지를 검색하세요"> <input type="image"
								class="menu-bar search-icon"
								src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"
								alt="Submit" />
						</form>
					</li>
					<li><a href="FeedService" class="menu-bar search-container">피드</a></li>
					<li><a href="ChalService" class="menu-bar search-container">챌린지</a></li>
					<li><a href="ChattingRoomService" class="menu-bar search-container">
							메세지</a></li>
					<li class="menus-megamenus"><a href="#"
						class="menu-bar search-container">카테고리 <i class="fa fa-angle-down"></i></a>
						<ul class="mega-menus">
							<div class="section">
								<li><a href="ChalService"><span class="cate-name">모든 챌린지</span></a></li>
								<li><a href="ChalService"><span class="cate-name">타임 어택</span></a></li>
								<li><a href="ChalService"><span class="cate-name">가격 제한</span></a></li>
							</div>
							<div class="section">
								<li><a href="ChalService"><span class="cate-name">친환경 요리</span></a></li>
								<li><a href="ChalService"><span class="cate-name">세계테마 요리</span></a></li>
								<li><a href="ChalService"><span class="cate-name">편의점 재료</span></a></li>
							</div>
							<div class="section">
								<li><a href="ChalService"><span class="cate-name">비건 요리</span></a></li>
								<li><a href="ChalService"><span class="cate-name">비쥬얼 요리</span></a></li>
								<li><a href="ChalService"><span class="cate-name">반려동물 간식</span></a></li>
							</div>
						</ul></li>
					<li><c:if test="${!empty info}">
							<div class="mypage-container">
								<img class="mypage-icon"
									src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/%EC%9D%B4%EC%9A%B0%EC%98%81/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80.png"
									alt="MyPageIcon">
								<ul class="mypage-dropdown">
									<li><a href="followListService">마이 페이지</a></li>
									<li><a href="LogoutService">로그아웃</a></li>
								</ul>
							</div>
						</c:if> <c:if test="${empty info}">
							<a href="LoginAndJoinPage.jsp" class="login-con">로그인</a>
						</c:if></li>
					<li>
						<div class="write">
							<button class="write-page writeButton">작성하기</button>
							<!-- 작성하기 버튼 클릭 시 나타나는 옵션 리스트 -->
							<ul class="write-dropdown">
								<li id="writeFeed"><a href="MakeFeedPage.jsp">피드작성</a></li>
								<li id="writeChallenge"><a href="MakeChallengePage.jsp">챌린지작성</a></li>
							</ul>
						</div> </a>
					</li>
				</ul>
				<hr class="line">
			</div>
		</div>
	</div>
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const myPageIcon = document
									.querySelector('.mypage-icon');
							const myPageDropdown = document
									.querySelector('.mypage-dropdown');

							myPageIcon
									.addEventListener(
											'click',
											function() {
												myPageDropdown.style.display = myPageDropdown.style.display === 'flex' ? 'none'
														: 'flex';
											});

							window.addEventListener('click', function(event) {
								if (!myPageIcon.contains(event.target)
										&& !myPageDropdown
												.contains(event.target)) {
									myPageDropdown.style.display = 'none';
								}
							});
						});
	</script>
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const writePageIcon = document
									.querySelector('.writeButton');
							const writePageDropdown = document
									.querySelector('.write-dropdown');

							writePageIcon
									.addEventListener(
											'click',
											function() {
												writePageDropdown.style.display = writePageDropdown.style.display === 'flex' ? 'none'
														: 'flex';
											});

							window.addEventListener('click', function(event) {
								if (!writePageIcon.contains(event.target)
										&& !writePageDropdown
												.contains(event.target)) {
									writePageDropdown.style.display = 'none';
								}
							});
						});
	</script>
</body>
</html>
