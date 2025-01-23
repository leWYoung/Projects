// 프로필 사진 클릭 시 파일 선택 창 열기
document.getElementById('profile-pic').addEventListener('click', function() {
	document.getElementById('upload-profile-pic').click();
});

// 파일 선택 후 미리보기 이미지 변경
document.getElementById('upload-profile-pic').addEventListener('change', function(event) {
	const file = event.target.files[0];
	const reader = new FileReader();

	reader.onload = function(e) {
		document.getElementById('profile-pic').src = e.target.result;

		// FormData 객체 생성
		const formData = new FormData();
		formData.append('user_profile', file); // 'user_profile'이라는 키로 파일 추가

		// AJAX 요청
		$.ajax({
			url: 'ProfileUpdate',
			type: 'POST',
			data: formData, // FormData 객체를 data로 전송
			processData: false, // jQuery가 데이터를 처리하지 않도록 설정
			contentType: false, // jQuery가 콘텐츠 유형을 설정하지 않도록 설정
			success: function(response) {
				console.log('파일 업로드 성공:', response);
			},
			error: function(xhr, status, error) {
				console.error('파일 업로드 실패:', error);
			}
		});
	};

	if (file) {
		reader.readAsDataURL(file); // 파일 읽기
	}
});

// 각 버튼 클릭 시 하단에 텍스트가 표시되도록 하는 함수
function showTabContent(buttonId, contentHTML) {
	// 기존에 표시된 내용 삭제
	document.getElementById('content-area').innerHTML = '';

	// 새로운 내용을 표시
	const contentDiv = document.createElement('div');
	contentDiv.classList.add('content-section'); // content-section 클래스를 추가
	contentDiv.innerHTML = contentHTML;
	document.getElementById('content-area').appendChild(contentDiv);
}

// 각 버튼에 클릭 이벤트 추가
document.getElementById('ufo-home').addEventListener('click', function() {
	const followingArea = document.getElementById('following-area');
	const followerArea = document.getElementById('follower-area');
	const feedArea = document.getElementById('Feed-area');
	const contentArea = document.getElementById("content-area");

	followerArea.style.display = "none";
	followingArea.style.display = "none";
	feedArea.style.display = "none";
	contentArea.style.display = "block";


	const editContent = `
	<form action="updateService" method="post" id="updateForm">
	        <!-- 버튼에 edit-button 클래스를 추가 -->
	        <button type="button" id="edit-password" class="edit-button">
	            <span>비밀번호 수정</span>
	        </button>
	        <button type="button" id="edit-username" class="edit-button">
	            <span>닉네임 수정</span>
	        </button>
	        <div id="edit-fields" class="edit-button"></div>
	    </form>
        `;
	showTabContent('ufo-home', editContent);

	// 비밀번호 수정 버튼 클릭 이벤트
	document.getElementById('edit-password').addEventListener('click', function() {
		document.getElementById('edit-fields').innerHTML = `
                <input type="password" name="newPw" placeholder="새 비밀번호 입력" class="input-field">
				<input type="submit" value="비밀번호 변경" class="submit-button">
            `;
	});

	// 닉네임 수정 버튼 클릭 이벤트
	document.getElementById('edit-username').addEventListener('click', function() {
		document.getElementById('edit-fields').innerHTML = `
                <input type="text" name="newNick" placeholder="새 닉네임 입력" class="input-field">
				<input type="submit" value="닉네임 변경" class="submit-button">
            `;
	});

	document.getElementById('updateForm').addEventListener('submit', function(event) {
		event.preventDefault(); // 기본 제출 이벤트 방지 (디버깅 시 사용할 수 있음)
		this.submit(); // 폼 제출
	});
});

document.getElementById('ufo-videos').addEventListener('click', function() {
	const followingArea = document.getElementById('following-area');
	const followerArea = document.getElementById('follower-area');
	const feedArea = document.getElementById('Feed-area');
	const contentArea = document.getElementById("content-area");

	// content-area의 display 속성을 토글
	if (feedArea.style.display === 'none' || feedArea.style.display === '') {
		feedArea.style.display = 'block'; // 콘텐츠를 표시
		followingArea.style.display = "none";
		followerArea.style.display = "none";
		contentArea.style.display = "none";
	} else {
		feedArea.style.display = 'none'; // 콘텐츠를 숨김
	}
});

document.getElementById('ufo-images').addEventListener('click', function() {
	const followingArea = document.getElementById('following-area');
	const followerArea = document.getElementById('follower-area');
	const feedArea = document.getElementById('Feed-area');
	const contentArea = document.getElementById("content-area");

	// content-area의 display 속성을 토글
	if (followerArea.style.display === 'none' || followerArea.style.display === '') {
		followerArea.style.display = 'block'; // 콘텐츠를 표시
		followingArea.style.display = "none";
		feedArea.style.display = "none";
		contentArea.style.display = "none";
	} else {
		followerArea.style.display = 'none'; // 콘텐츠를 숨김
	}
});

document.getElementById('ufo-about').addEventListener('click', function() {
	const followingArea = document.getElementById('following-area');
	const followerArea = document.getElementById('follower-area');
	const feedArea = document.getElementById('Feed-area');
	const contentArea = document.getElementById("content-area");

	// content-area의 display 속성을 토글
	if (followingArea.style.display === 'none' || followingArea.style.display === '') {
		followingArea.style.display = 'block'; // 콘텐츠를 표시
		feedArea.style.display = "none";
		followerArea.style.display = "none";
		contentArea.style.display = "none";
	} else {
		followingArea.style.display = 'none'; // 콘텐츠를 숨김
	}
});

document.addEventListener("DOMContentLoaded", () => {
	const svg = document.getElementById('followButton').querySelector('svg');
	svg.setAttribute('class', 'tw-w-5 tw-h-5 tw-fill-white');
});


// 팔로우 버튼 스크립트
document.getElementById('followButton').addEventListener('click', function() {
	console.log('184 line addListen')
	const buttonText = this.querySelector('span');
	const svg = this.querySelector('svg');

	if (buttonText.textContent === '팔로잉') {
		console.log('if1')
		buttonText.textContent = '팔로우';
		svg.setAttribute('class', 'tw-w-5 tw-h-5 tw-fill-white'); // 팔로우 상태의 SVG 색상
		this.classList.remove('tw-bg-color-background-button-completed'); // 배경 색상 변경
		this.classList.add('tw-bg-color-background-button-primary-bold-enabled'); // 팔로우 색상
	} else {
		console.log('else')
		buttonText.textContent = '팔로잉';

		svg.setAttribute('class', 'tw-w-5 tw-h-5 tw-fill-slate-700'); // 팔로잉 상태의 SVG 색상
		this.classList.remove('tw-bg-color-background-button-primary-bold-enabled'); // 배경 색상 변경
		this.classList.add('tw-bg-color-background-button-completed'); // 팔로잉 색상
	}
});

// 파일 선택 후 미리보기 이미지 변경
document.getElementById('upload-profile-pic').addEventListener('change', function(event) {
	const file = event.target.files[0];
	if (file) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('profile-pic').src = e.target.result;
		};
		reader.readAsDataURL(file);
	}
});