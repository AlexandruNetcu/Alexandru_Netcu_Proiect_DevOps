/* Galaxy Theme */
const navLinks = document.querySelectorAll('nav ul li a');
const loginBtn = document.querySelector('button');

navLinks.forEach(link => {
  link.addEventListener('mouseover', () => {
    link.style.color = 'var(--accent-color)';
  });
  link.addEventListener('mouseout', () => {
    link.style.color = 'var(--secondary-color)';
  });
  link.addEventListener('click', e => {
    e.preventDefault();
    const redirect = link.getAttribute('href');
    window.location.href = redirect;
  });
});

loginBtn.addEventListener('mouseover', () => {
  loginBtn.style.backgroundColor = 'var(--text-color)';
  loginBtn.style.color = 'var(--primary-color)';
});

loginBtn.addEventListener('mouseout', () => {
  loginBtn.style.backgroundColor = 'var(--accent-color)';
  loginBtn.style.color = 'var(--secondary-color)';
});

loginBtn.addEventListener('click', () => {
  window.location.href = 'https://youtu.be/zBBjYy7VHFM';
});

