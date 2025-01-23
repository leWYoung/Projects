<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
@import url('./assets/css/chattingPage.css');
</style>
<style>
/* .menu-bar .blocks-menus {
	left: 11px;
    top: 8px;
	width: 100%;
	background: white;
	padding-top: 20px;
	text-align: center;
	display: inline-block;
	position: relative;
	z-index: 120;
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
} */

.toggle-button {
	border: none; /* 테두리 없애기 */
	background: none; /* 배경 없애기 (선택 사항) */
	padding: 5px; /* 원하는 패딩 설정 */
	cursor: pointer; /* 커서 모양을 포인터로 변경 */
}
</style>
</head>
<body>
	<jsp:include page="MenuBar.jsp" flush="true"/>
	<div class="main-center">
		<div class="new-chat-button">
			<form action="ChattingRoomService" method="post" id="roomDB">
				<input type="button" onclick="newRoom();" id="newChatButton"
					class="toggle-button ion-plus plus-b" value="+"> <input
					type="hidden" name="member">
			</form>
		</div>
		<div class="container">
			<div class="messenger">
				<div class="conversations-list toggle-target toggle-target-active">
					<div class="head">
						<div class="title">Messenger</div>
					</div>
					<div class="search">
						<i class="icon search-icon ion-ios-search"></i> <input
							type="search" placeholder="Search Messenger" class="search-input" />
					</div>

					<div class="conversations-list-items slimscroll"
						data-height="calc(100% - 96px)">
						<div class="conversations-list-item single">
							<c:forEach items="${chatRoom}" var="cr">
								<form action="CreateRoom" method="post" onsubmit="return false;">
									<div class='avatar-name' onclick="creatRoom(this)">
										<input type="hidden" name="user_id" value="${cr.user_id}">
										<div class='avatar-frame'>
											
										</div>
										<div class='name-frame'>${cr.room_title}</div>
										<input type="hidden" name="room_idx" value="${cr.room_idx}">
									</div>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="conversation">
					<div class="head">
						<div class="dashboard">
							<c:forEach items="${chatRoom}" var="cr">
								<div class="name">${cr.room_title}</div>
							</c:forEach>
						</div>
					</div>
					<!-- textarea -->
					<div class="messaging toggle-target">
						<div class="messages">
							<h4>지난 대화 내역</h4>
							<textarea rows="20" cols="50" readonly>
								<c:forEach items="${chatList}" var="msg">
									<c:if test="${! empty msg.chatting}">
	        							${msg.chatter} : ${msg.chatting}
									</c:if>
        							<c:if test="${! empty msg.emoticon}">
        								${msg.chatter} : ${msg.emoticon}
        							</c:if>
        							<c:if test="${! empty msg.chat_file}">
        								${msg.chatter} : ${msg.chat_file}
        							</c:if>
    							</c:forEach>	
						</textarea>
							<br>
							<h4>대화</h4>
							<textarea id="chatArea" rows="20" cols="50" readonly></textarea>
						</div>
						<br>
						<form action="CreateChat" method="post">
							<input type="text" class='message-input' id="message"
								name="message" placeholder='enter your messages' required>
							<input type="hidden" name="curoom_idx" id="currentRoomInput">
							<button onclick="sendMessage()" type="button"
								class="action send-button">Send</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="./assets/js/chattingPage.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.js"></script>
</body>
</html>