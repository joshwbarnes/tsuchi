// When the side menu is opened, this function blurs all 
// Elements except the menu that is opened. 
// When the menu is closed, they are set to normal
const toggleBodyBlur = (blurValue) => {
  const blur = document.querySelectorAll('.notification-modal, .notification-close, .container-item, div > *:not(section, div, button, span)');
  blur.forEach((element) => {
    element.style.transitionDuration = "0.5s";
    element.style.filter = `blur(${blurValue}px)`;
  });
};

// This function holds an event listener which waits for the user 
// to click on the 'burger menu' icon. 
// When this happens the side menu slides in from the right and blurs the background
// elements behind the menu
const toggleSideMenu = () => {
  const menuModal = document.querySelector('.menu-modal');
  const burgerMenu = document.querySelector('.burger-menu');
  if (menuModal) {
    burgerMenu.addEventListener('click', () => {
      menuModal.style.transitionDuration = "0.5s";
      menuModal.style.right = '0';
      toggleBodyBlur(10);
    });
    // Move the side menu off screen when user clicks
    // the close button
    const closeMenu = document.querySelector('.close-menu');
    closeMenu.addEventListener('click', () => {
      menuModal.style.right = '-300px';
      toggleBodyBlur(0);
    });
  }
};

export { toggleSideMenu };