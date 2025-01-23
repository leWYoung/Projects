<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" style="">
<head>
<meta charset="utf-8">
<title>FeedContents</title>
<link rel="preload" href="/_next/static/media/17e83dbff61c048c.p.woff2"
	as="font" type="font/woff2" crossorigin="anonymous">
<link rel="preload" href="/_next/static/media/2cfaf186eda0c132.p.woff2"
	as="font" type="font/woff2" crossorigin="anonymous">
<link rel="preload" href="/_next/static/media/430406a62c0d062d.p.woff2"
	as="font" type="font/woff2" crossorigin="anonymous">
<link rel="preload" href="/_next/static/media/62f2cc7c46d83665.p.woff2"
	as="font" type="font/woff2" crossorigin="anonymous">
<link rel="preload" href="/_next/static/css/6249e7ecdfa17830.css"
	as="style">
<link rel="stylesheet" href="/_next/static/css/6249e7ecdfa17830.css"
	data-n-g="">
<link rel="preload" href="/_next/static/css/9a9f3994aa3a61b7.css"
	as="style">
<link as="script" rel="prefetch"
	href="/_next/static/chunks/1344-41f24348b92a6348.js">
<link as="script" rel="prefetch"
	href="/_next/static/chunks/pages/notice/detail.html-4e8fc7159f52dd3c.js">
<link as="script" rel="prefetch"
	href="/_next/static/chunks/pages/policyV2-417305c51057b57d.js">
<link as="script" rel="prefetch"
	href="/_next/static/chunks/pages/privacyV2-a3bb0e3b154c0658.js">
<style data-n-href="/_next/static/css/12f6d34bc1f84336.css">
@import url("./assets/css/FeedContent.css");

.content-container {
	height: auto;
	width: 80%;
}

.content-main {
	width: 100%
}

.challenge-detail_image {
	width: 100%;
}
</style>

</head>
<body>
	<jsp:include page="MenuBar.jsp" />
	<div class="main-center">
		<!-- 상세 피드 내용  -->
		<div class="content-container">
			<div class="detail-challenge_content__Ggn9l">
				<div class="content-main">
					<img src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${chalDetail.img}" alt="challenge-detail_image"
						class="Main_template__image__OBRGn" loading="lazy"
						style="color: transparent;">
					<div class="Main_content__QSnMW">
						<a href="MyPage.jsp">
							<div class="ChallengeHostImage_host__ddIMk">
								<img alt="challengehost" src="https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/${chalDetail.user_profile}"
									width="50" height="50" decoding="async" data-nimg="1"
									class="ChallengeHostImage_host__image__dT0hM" loading="lazy"
									style="color: transparent;">
							</div>
							<div class="Main_content__host-name__ZVaSk">${chalDetail.user_nick}</div>
						</a>
					</div>
					<div class="Main_content__title__xS6_f">[${chalDetail.chal_title}]</div>
				</div>
				<div class="Commenter_introduce__URA1O">
					<div class="Commenter_introduce__content__03SRv">${chalDetail.chal_content}</div>
					<div class="Commenter_introduce__additional__KNK_K"
						aria-hidden="true">더보기</div>
				</div>
				<div class="Info_template__XuHUA">
					<div class="Info_member__zouhM">
						<div class="ChallengeHostImage_host__ddIMk"></div>
						</a>
					</div>
				</div>
				<div class="Info_notification__sdE9J">
					<div class="Info_notification__title__HZ925">안내사항</div>
					<div class="Info_notification__introduce__JJNE2">자세한 정보를
						알려드릴게요</div>
					<div class="Info_notification__detail__RdfMP">
						 <span
							class="Info_detail__kAjrp"><img alt="member"
							srcset="https://images.munto.kr/munto-web/ic_info_certification_24px.svg?s=32x32 1x, https://images.munto.kr/munto-web/ic_info_certification_24px.svg?s=48x48 2x"
							src="https://images.munto.kr/munto-web/ic_info_certification_24px.svg?s=48x48"
							width="24" height="24" decoding="async" data-nimg="1"
							class="Info_detail__image__CiTMF" loading="lazy"
							style="color: transparent;">
							<div class="Info_detail__info__lpAiz">주 1회 인증</div> </span> <span>
							<div>${chalDetail.chal_st_dt}~${chalDetail.chal_ed_dt}</div>
							<div>진행 기간</div>
						</span>
					</div>
				</div>
				<!-- 좋아요 및 댓글 기능 추가 -->
				<div class="like-comment-section"
					style="padding: 20px; text-align: center;">
					<div class="like-button"
						style="display: inline-block; margin-right: 20px;">
						<button id="likeBtn"
							style="background-color: #3498db; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
							<span id="likeText">좋아요</span> (<span id="likeCount">0</span>)
						</button>
					</div>
					<form action="parChalService" method="post">
						<input type="hidden" name="chal_idx"
							value="${chalDetail.chal_idx}">
						<!-- 챌린지 ID -->
						<input type="hidden" name="user_id" value="${chalDetail.user_id}">
						<!-- 사용자 ID -->
						<div class="par_chal">
							<input type="submit" value="참여하기" class="chal-par">
						</div>
					</form>
					<div class="comment-section" style="display: inline-block;">
						<button id="commentBtn"
							style="background-color: #2ecc71; position:relative; left:20px; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
							댓글 남기기</button>
					</div>
				</div>
					<!-- 댓글 작성 폼 -->
					<div id="commentList" style="margin-top: 20px;">
						<h3>댓글</h3>
						<ul id="comments" style="list-style: none; padding: 0;"></ul>
					</div>
					<div id="commentForm" style="display: none; margin-top: 20px;">
						<textarea id="commentInput" placeholder="댓글을 입력하세요"
							style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
						<button id="submitComment"
							style="background-color: #27ae60; color: white; border: none; padding: 10px 20px; margin-top: 10px; cursor: pointer;">댓글
							등록</button>
					</div>
					<!-- 댓글 목록 -->
			</div>
		</div>
	</div>
	<script src="./assets/js/FeedContent.js"></script>
</body>
</html>

