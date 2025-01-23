<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("./assets/css/MakeFeedPage.css");
.menu-bar .search-icon{
	position: relative;
    float: right;
    width: 40px;
    height: 40px;
    top: -9px;
    left: -37px;
}
</style>
</head>
<body>
<jsp:include page="MenuBar.jsp" />
	<div class="main-center">
		<div>
			<form action="WriteFeedService" method="post"
				enctype="multipart/form-data">
				<table id="list">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><input type="file" name="img"
							style="float: right;"> <textarea name="content" rows="10"
								style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="reset" value="초기화"> <input
							type="submit" value="작성하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>