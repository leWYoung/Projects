console.log('JS Connetct');

// 1. moveLeft 함수 선언
// 1-1. id가 horse 인 tag을 js로 가져오기

// 1-2. moveLeft 함수가 호출될 때마다 말을 왼쪽으로 50px 씩 이동
let move = 0;

const moveLeft = () => {
    if (move < 1200) {
        move += 50;
        document.getElementById('horse').style.right = move + 'px';
    }
    console.log
}
// 단, 말이 배경을 벗어나지 않도록 함. 

// 2. moveRight 함수 선언
// 2-1. id가 horse 인 tag을 js로 가져오기
// 2-2. moveRight 함수가 호출될 때마다 말을 오른쪽으로 50px 씩 이동
const moveRight = () => {
    if (move > 0) {
        move -= 50;
        document.getElementById('horse').style.right = move + 'px';
    }
}
// 단, 말이 배경을 벗어나지 않도록 함. 

// 3. left 버튼 클릭시 moveLeft 함수 호출
let btnLeft = document.querySelector('.left');
btnLeft.addEventListener('click', moveLeft);

//    right 버튼 클릭시 moveRight 함수 호출
let btnRight = document.querySelector('.right');
btnRight.addEventListener('click', moveRight);
