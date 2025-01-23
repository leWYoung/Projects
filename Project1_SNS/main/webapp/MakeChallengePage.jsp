<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
url("./assets/css/MakeChallengePage.css")
</style>
</head>
<body>
<jsp:include page="MenuBar.jsp" />
	<div class="main-center">
		<div>
			<form action="WriteChallengeService" method="post"
				enctype="multipart/form-data">
				<table id="list">
					<tr>
						<th colspan="2">챌린지 작성</th>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>

					<tr>
						<td>파일 선택</td>
						<td><input type="file" name="img" style="float: right;">
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><select name="category"
							style="width: 100%; padding: 10px; border-radius: 4px;">
								<option value="">카테고리 선택</option>
								<option value="all">챌린지 전체</option>
								<option value="tak">타임어택</option>
								<option value="evn">친환경</option>
								<option value="wtc">세계테마요리</option>
								<option value="gsu">편의점</option>
								<option value="plt">가격제한</option>
								<option value="veg">비건</option>
								<option value="vsl">비쥬얼</option>
								<option value="asn">반려동물간식</option>
						</select></td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="2"><textarea name="content" rows="20"
								style="resize: none;"></textarea></td>
					</tr>

					<tr>
						<td colspan="2">시작 날짜<input type="date" name="chal_st"></td>
					</tr>

					<tr>
						<td colspan="2">종료 날짜<input type="date" name="chal_ed"></td>
					</tr>

					<tr>
						<td><input type="reset" value="초기화"></td>
						<td><input type="submit" value="작성하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
		<script type="text/javascript" src="./assets/js/MakeChallengePage.js"></script>
</body>
</html>