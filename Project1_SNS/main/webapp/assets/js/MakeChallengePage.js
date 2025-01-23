document.addEventListener('DOMContentLoaded', function() {
	const myPageIcon = document.querySelector('.mypage-icon');
	const myPageDropdown = document.querySelector('.mypage-dropdown');

	myPageIcon.addEventListener('click', function() {
		myPageDropdown.style.display = myPageDropdown.style.display === 'flex' ? 'none' : 'flex';
	});

	window.addEventListener('click', function(event) {
		if (!myPageIcon.contains(event.target) && !myPageDropdown.contains(event.target)) {
			myPageDropdown.style.display = 'none';
		}
	});
});
