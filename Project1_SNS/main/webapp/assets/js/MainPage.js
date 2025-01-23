let currentSlide = 0;
const slides = document.querySelectorAll('.carousel-item');

function showSlide(index) {
	slides.forEach((slide, i) => {
		slide.classList.remove('active');
		if (i === index) {
			slide.classList.add('active');
		}
	});
}

function nextSlide() {
	currentSlide = (currentSlide + 1) % slides.length;
	showSlide(currentSlide);
}

function prevSlide() {
	currentSlide = (currentSlide - 1 + slides.length) % slides.length;
	showSlide(currentSlide);
}

// 자동 슬라이드
setInterval(nextSlide, 5000); // 5초마다 슬라이드 넘김

