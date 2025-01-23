document.addEventListener('DOMContentLoaded', function () {
      const likeButton = document.getElementById('likeButton');
      const likeIcon = document.getElementById('likeIcon');
      const likeCount = document.getElementById('likeCount');

      let isLiked = false; // 좋아요 상태를 추적하기 위한 변수
      let count = 0; // 좋아요 갯수 초기값

      likeButton.addEventListener('click', function () {
          // 좋아요 상태에 따라 아이콘 변경 및 갯수 증가
          if (isLiked) {
              likeIcon.src = 'https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/thumbUpBlank.png'; // 원래 아이콘으로 변경
              count--; // 좋아요 갯수 감소
          } else {
              likeIcon.src = 'https://raw.githubusercontent.com/2024-SMHRD-KDT-DataDesign-2/wooyoungwoo/master/img/thumbUp.png'; // 좋아요가 눌린 아이콘으로 변경
              count++; // 좋아요 갯수 증가
          }

          // 좋아요 상태 반전
          isLiked = !isLiked;
          likeCount.textContent = count; // 좋아요 갯수 업데이트
      });
  });