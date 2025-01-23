const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

function login() {
	const email = document.getElementById("email").value;
	const password = document.getElementById("password").value;

	if (email && password) {
		alert("로그인 성공!");
	} else {
		alert("이메일과 비밀번호를 입력하세요.");
	}
}
// 팝업 열기 및 닫기 요소 가져오기
const openPopupBtn = document.getElementById('openPopupBtn');
const closePopupBtn = document.getElementById('closePopupBtn');
const popup = document.getElementById('popup');

// 팝업 열기
openPopupBtn.addEventListener('click', function() {
	popup.style.display = 'flex';  // 팝업 보이기
});

// 팝업 닫기
closePopupBtn.addEventListener('click', function() {
	popup.style.display = 'none';  // 팝업 숨기기
});

// 로그인 처리 함수
function select_like() {
	popup.style.display = 'none';
}

function join_select_like() {
	// 모든 선택된 체크박스 가져오기
	const checkedBoxes = document.querySelectorAll('input[name="preference"]:checked');
	let selectedValues = [];

	// 선택된 체크박스 값 배열에 저장
	checkedBoxes.forEach((box) => {
		selectedValues.push(box.id); // box.value 또는 원하는 값을 넣을 수 있음
	});

	// 선택된 값을 부모 폼에 숨겨진 input에 추가
	const parentForm = document.querySelector('.sign-up-container form');
	const hiddenInput = document.createElement('input');
	hiddenInput.type = 'hidden';
	hiddenInput.name = 'preference';
	hiddenInput.value = selectedValues.join(','); // 콤마로 구분된 문자열로 연결

	parentForm.appendChild(hiddenInput);

	// 팝업 닫기
	document.getElementById('popup').style.display = 'none';
}