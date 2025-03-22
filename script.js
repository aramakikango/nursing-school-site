window.addEventListener('DOMContentLoaded', () => {
    const fadeInElements = document.querySelectorAll('.fade-in');
    fadeInElements.forEach(element => {
        element.classList.add('visible');
    });
});
