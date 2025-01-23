<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main_01</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Lato:400,700,400italic'
	rel='stylesheet' type='text/css'>
</head>
<style>
@import url('./assets/css/MainPage.css');

.chal-po {
	display: flex;
}

.ran-body {
	border: 1px solid #e0e0e0; /* 테두리 색상 및 두께 설정 */
	border-radius: 8px; /* 테두리 모서리를 둥글게 설정 */
	margin: 10px 0; /* 각 랭크 아이템 사이 간격 설정 */
	padding: 10px; /* 내부 패딩 설정 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 추가 */
	transition: all 0.3s ease-in-out; /* 애니메이션 효과 */
}

.ran-body:hover, .main-feed:hover {
	border-color: #3498db; /* 마우스를 올렸을 때 테두리 색상 변경 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 마우스를 올렸을 때 그림자 강도 증가 */
}

.carousel {
	position: absolute;
	width: 100%;
	height: 100%;
	transition: transform 1s ease-in-out;
	/* 전환 시 부드럽게 */
}

.carousel-item {
	display: none;
}

.carousel-item.active {
	display: block;
}

.carousel-control {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	font-size: 2em;
	color: #fff;
	text-decoration: none;
}

.carousel-control.left {
	left: 35px;
}

.carousel-control.right {
	right: 35px;
}

.feed-body {
	object-fit: cover;
    left: 35px;
    position: relative;
    width: 100px;
    height: 150px;
    padding: 10px;
}
</style>
<body>
<jsp:include page="MenuBar.jsp" />
	<div class="main-center">
		<!-- 오늘의 챌린지 움직이게 -->
		<div class="hero-images">
			<div class="carousel">
				<div class="carousel-item active">
					<img
						src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/env.png"
						alt="Image 1">
				</div>
				<div class="carousel-item">
					<img
						src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/price.png"
						alt="Image 2">
				</div>
				<div class="carousel-item">
					<img
						src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/veg.png"
						alt="Image 3">
				</div>
				<div class="carousel-item">
					<img
						src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/wt.png"
						alt="Image 4">
				</div>
				<div class="carousel-item">
					<img
						src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/conv.png"
						alt="Image 5">
				</div>
			</div>
			<a class="carousel-control left" href="#" onclick="prevSlide()">&#10094;</a>
			<a class="carousel-control right" href="#" onclick="nextSlide()">&#10095;</a>
		</div>

		<!-- 미니 카테고리 -> 선택시 피드로 이동 -->
		<form action="orderByService" method="post">
			<div class="mini-cate-bar">
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img all-chal"
						type="submit" name="ob" value="all"> <span>모든 챌린지</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img tak-chal"
						type="submit" name="ob" value="tak"> <span>타임 어택</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img plt-chal"
						type="submit" name="ob" value="plt"> <span>가격 제한</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img evn-chal"
						type="submit" name="ob" value="evn"> <span>친환경 요리</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img wtc-chal"
						type="submit" name="ob" value="wtc"> <span>세계 테마</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img gsu-chal"
						type="submit" name="ob" value="gsu"> <span>편의점 재료</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img veg-chal"
						type="submit" name="ob" value="veg"> <span>비건 요리</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img vsl-chal"
						type="submit" name="ob" value="vsl"> <span>비쥬얼 요리</span>
					</a>
				</div>
				<div class="mini-cate">
					<a form="ChalService"> <input class="cate-img asn-chal"
						type="submit" name="ob" value="asn"> <span>반려동물 간식</span>
					</a>
				</div>

			</div>
		</form>

		<!-- 하단 전체 -->
		<div class="bottom-total">
			<!-- 챌린지 기능 -->
			<div class="chal-par">
				<!-- 아랫 부분 영역 차지 -->
				<div class="content-container">
					<!-- 컨텐츠 영역 -->
					<c:forEach items="${feedList}" var="feed">
						<div class="main-feed">
							<form action="WriteFeedService" method="post"
								enctype="multipart/form-data">
								<a class="chal-po" href="detailFeed?id=${feed.feed_idx}"> <!-- 컨텐츠1 -->
									<!-- 각 컨텐츠영역 --> <!-- 카테고리로 연결 -->
									<div class="img-container">
										<img
											src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${feed.feed_img}"
											alt="error" accept="image/*" class="feed-img">
									</div>
									<div class="feed-body">
										<div class="feed-title">${feed.feed_title}</div>
										<div class="feed-con">${feed.feed_content}</div>
										<div class="profile-part">
											<img class="user-pro"
												src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${feed.user_profile}"
												alt=""><span class="user-nick">${feed.user_nick}</span>
										</div>
									</div>
								</a>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 랭크 기능 -->
			<div class="ranking-part">
				<!-- 랭크 감싸는 영역 -->
				<h3>주간 인기 챌린지</h3>
				<div>
					<!-- 랭크1 -->
					<form action="detailChal" method="post"
						enctype="multipart/form-data">
						<c:forEach items="${resultCppList}" var="rank" varStatus="status">
							<a href="detailChal?id=${rank.chal_idx}" class="rank-body">
								<div class="ran-body">
									<!-- 랭크 감싸는 영역 -->
									<div class="ran-num-part">
										<!-- 숫자 부분 -->
										<span class="ran-num">${status.count}</span>
									</div>
									<div class="ran-con-part">
										<!-- 내용 감싸는 부분 -->
										<div class="ran-con-top">
											<!-- 작성자 미니프로필,닉네임 -->
											<div class="ran-pro">
												<!-- 작성자 미니프로필 -->
												<img class="mini-pro"
													src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${rank.user_profile}"
													alt="">
											</div>
											<div>
												<!-- 작성자 닉네임 -->
												<p class="ran-nick">
													<span>${rank.user_nick}</span>
												</p>
											</div>
										</div>
										<p class="ran-cal-con">${rank.chal_title}</p>
									</div>
								</div>
							</a>
						</c:forEach>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="./assets/js/MainPage.js"></script>
</body>
</html>