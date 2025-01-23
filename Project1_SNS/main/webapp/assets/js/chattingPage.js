let ws;
let currentRoom = "";
var userId = "";


function sendMessage() {

	let message = document.querySelector('input[name="message"]').value;
	let room_num = document.querySelector('input[name="curoom_idx"]');

	let chatArea = document.getElementById("chatArea");

	console.log("room_num btn : " + room_num);
	console.log("room_num 에 currentRoom 넣기 전 : " + currentRoom);

	room_num.value = currentRoom;
	console.log("currentRoom : " + room_num.value);

	if (currentRoom) {
		$.ajax({
			type: 'POST',
			url: 'CreateChat', // 서버에서 메시지를 처리할 서블릿
			data: {
				message: message, // 입력된 메시지
				curoom_idx: currentRoom // 현재 방 번호
			},
			success: function(response) {
				console.log("서버 응답: " + response);
				// 서버 응답 후 필요한 추가 동작 수행
				if (response === "메시지 저장 성공") {
					// 성공적으로 메시지를 저장한 경우 UI 업데이트 등 추가 작업
					chatArea.value += "나 : " + message + "\n";
				} else {
					// 실패 시 처리
					alert("메시지 저장 실패");
				}
			},
			error: function(xhr, status, error) {
				console.error("Error: " + error);
			}
		});
	} else {
		alert("Please join a room first.");
	}

	document.getElementById("message").value = ''; // 메시지 입력란 초기화
}



function creatRoom(element) {
	if (ws) {
		ws.close();
		console.log("방 연결 끊기");
	}

	// 클릭한 요소의 부모 <form>에서 input 값을 찾아오기
	let form = element.closest('form');
	let roomIdx = form.querySelector('input[name="room_idx"]').value;
	let userId = form.querySelector('input[name="user_id"]').value;

	console.log("Room Index:", roomIdx);
	console.log("User ID:", userId);

	// WebSocket URL에 방 이름과 사용자 ID를 포함
	ws = new WebSocket("ws://" + location.host + "/WhyAlawaysMe/chat/" + roomIdx + "/" + userId);

	ws.onopen = function() {
		currentRoom = roomIdx; // WebSocket 연결이 완료된 후 currentRoom 설정
		localStorage.setItem("userId", userId); // currentRoom을 로컬 스토리지에 저장
		localStorage.setItem("currentRoom", currentRoom); // currentRoom을 로컬 스토리지에 저장

		console.log("Connected to room:", currentRoom);
		console.log("userId:", userId);
	};

	ws.onmessage = function(event) {
		var chatArea = document.getElementById("chatArea");
		chatArea.value += event.data + "\n";
	};

	ws.onclose = function() {
		console.log("Disconnected from server.");
	};

	form.submit();
}

// 페이지 로드 시 currentRoom을 복원
window.onload = function() {
	currentRoom = localStorage.getItem("currentRoom");
	userId = localStorage.getItem("userId");
	console.log("Restored currentRoom: " + currentRoom);
};

function newRoom() {
	let member = prompt("초대할 회원 아이디를 입력하시오");

	let inputtag = document.querySelector("input[name='member']");
	inputtag.value = member;

	console.log("inputtag : " + inputtag.value);
	
	document.getElementById("roomDB").submit();
}

document.getElementById("message").addEventListener("keypress",
	function(event) {
		if (event.key === "Enter") {
			sendMessage();
		}
	});