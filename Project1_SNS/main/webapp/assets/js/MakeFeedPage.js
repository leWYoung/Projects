/* // 제목 클릭 시 입력 필드로 전환
 document.getElementById("title-area").addEventListener("click", function () {
    var titleDisplay = document.getElementById("title-display");
    var titleInput = document.getElementById("title-input");

    titleDisplay.style.display = "none";
    titleInput.style.display = "block";
    titleInput.focus();
});

// 내용 클릭 시 입력 필드로 전환
document.getElementById("content-area").addEventListener("click", function () {
    var contentDisplay = document.getElementById("content-display");
    var contentInput = document.getElementById("content-input");

    contentDisplay.style.display = "none";
    contentInput.style.display = "block";
    contentInput.focus();
});

// 제목 입력 후 외부 클릭 시 저장
document.addEventListener('click', function (e) {
    var titleArea = document.getElementById("title-area");
    var titleDisplay = document.getElementById("title-display");
    var titleInput = document.getElementById("title-input");

    if (!titleArea.contains(e.target) && titleInput.style.display === "block") {
        // 입력된 값이 없을 경우 기본 텍스트로 설정
        if (titleInput.value.trim() === "") {
            titleDisplay.textContent = "제목 추가";
        } else {
            titleDisplay.textContent = titleInput.value;  // 입력된 제목을 표시
        }
        titleInput.style.display = "none";
        titleDisplay.style.display = "block";
    }

    // 내용 입력 후 외부 클릭 시 저장
    var contentArea = document.getElementById("content-area");
    var contentDisplay = document.getElementById("content-display");
    var contentInput = document.getElementById("content-input");

    if (!contentArea.contains(e.target) && contentInput.style.display === "block") {
        // 입력된 값이 없을 경우 기본 텍스트로 설정
        if (contentInput.value.trim() === "") {
            contentDisplay.innerHTML = "내용을 입력하세요";
        } else {
            contentDisplay.innerHTML = contentInput.value.replace(/\n/g, '<br>');  // 입력된 내용을 표시
        }
        contentInput.style.display = "none";
        contentDisplay.style.display = "block";
    }
});

document.getElementById('content-display').addEventListener('click', function() {
    // 내용 표시(span) 숨기고 textarea 보이기
    this.style.display = 'none';
    var textarea = document.getElementById('content-input');
    textarea.style.display = 'block';
    textarea.value = this.innerText; // 기존 내용을 textarea에 설정
    textarea.style.height = this.offsetHeight + 'px'; // span의 높이로 설정
    textarea.focus();
});

// textarea가 포커스를 잃으면 다시 span 보이게 하고 textarea 숨기기
document.getElementById('content-input').addEventListener('blur', function() {
    if (this.value.trim() === '') {
        document.getElementById('content-display').style.display = 'block';
        this.style.display = 'none';
    } else {
        document.getElementById('content-display').innerText = this.value; // span에 내용 설정
        this.style.display = 'none';
    }
});

// textarea의 값이 변경될 때마다 span을 숨기기
document.getElementById('content-input').addEventListener('input', function() {
    document.getElementById('content-display').style.display = 'none';
});

function editField(inputId) {
    const inputField = document.getElementById(inputId);
    const displayField = document.getElementById(inputId).previousElementSibling;

    // 플레이스홀더 텍스트 숨기기
    displayField.style.display = 'none';
    inputField.style.display = 'block';
    
    // 부모 요소에 active 클래스 추가
    displayField.parentElement.classList.add('active');

    inputField.focus(); // 입력 필드에 포커스
}

function saveField(inputId) {
    const inputField = document.getElementById(inputId);
    const displayField = document.getElementById(inputId).previousElementSibling;

    // 입력값이 없으면 플레이스홀더 표시
    if (inputField.value.trim() === '') {
        inputField.style.display = 'none';
        displayField.style.display = 'block';
        // 부모 요소에서 active 클래스 제거
        displayField.parentElement.classList.remove('active');
    } else {
        displayField.textContent = inputField.value; // 입력값으로 업데이트
    }
}*/