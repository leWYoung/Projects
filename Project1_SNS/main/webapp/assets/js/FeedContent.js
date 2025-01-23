document.addEventListener('DOMContentLoaded', () => {
  let likeCount = 0;
  const likeBtn = document.getElementById('likeBtn');
  const likeText = document.getElementById('likeText');
  const likeCountElem = document.getElementById('likeCount');
  const commentBtn = document.getElementById('commentBtn');
  const commentForm = document.getElementById('commentForm');
  const submitComment = document.getElementById('submitComment');
  const commentList = document.getElementById('comments');

  // 좋아요 버튼 클릭 이벤트
  likeBtn.addEventListener('click', () => {
    likeCount += 1;
    likeCountElem.textContent = likeCount;
    likeText.textContent = '좋아요 완료';
  });

  // 댓글 버튼 클릭 이벤트
  commentBtn.addEventListener('click', () => {
    commentForm.style.display = commentForm.style.display === 'none' ? 'block' : 'none';
  });

  // 댓글 등록 버튼 클릭 이벤트
  submitComment.addEventListener('click', () => {
    const commentInput = document.getElementById('commentInput');
    const commentText = commentInput.value.trim();
    
    if (commentText) {
      const li = document.createElement('li');
      li.textContent = commentText;
      commentList.appendChild(li);
      commentInput.value = ''; // 입력란 비우기
    }
  });
});
