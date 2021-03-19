const toggleSideMenu = () => {
  const menuModal = document.querySelector('.menu-modal');
  const burgerMenu = document.querySelector('.burger-menu');
  burgerMenu.addEventListener('click', () => {
    menuModal.style.transitionDuration = "0.5s";
    menuModal.style.right = '0';
  });
  
  const closeMenu = document.querySelector('.close-menu');
  closeMenu.addEventListener('click', () => {
    menuModal.style.right = '-300px';
  });
};

export { toggleSideMenu };