// This displays a notification on the page to the user
// The notification itself is a div which is placed off-screen to start with. 
// After a delay, it is brought into view
const itemNotification = () => {
  const modalDiv = document.querySelector('.notification-modal');
  // const notificationBell = document.querySelector('.notifiation-bell');
  const close = document.querySelector('.notification-close');
  if (modalDiv) {
    window.addEventListener('load', () => {
      modalDiv.style.transitionDelay = "2s";
      modalDiv.style.right = "0";
    });
    close.addEventListener('click', () => {
      modalDiv.style.right = "-400px";
    });
  };
};

export { itemNotification };