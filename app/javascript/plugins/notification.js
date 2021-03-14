const itemNotification = () => {
  const modalDiv = document.querySelector('.notification-modal');
  const notificationBell = document.querySelector('.notifiation-bell');
  const close = document.querySelector('.notification-close');
  if (modalDiv) {
    notificationBell.addEventListener('click', () => {
      modalDiv.style.right = "0";
    });
    close.addEventListener('click', () => {
      modalDiv.style.right = "-400px";
    })
  };
};

export { itemNotification };