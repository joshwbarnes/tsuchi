const buddyButtonTrigger = () => {
  const buddyButton = document.querySelector(".btn-share-buddy")
  const form = document.querySelector(".buddy-form")
  console.log(buddyButton)
  const container = document.querySelector(".container-item")

  if (!window.location.href.includes("list_id")) {
    form.classList.add("form-hidden")
    container.classList.add("container-item--hidden")

  }

  buddyButton.addEventListener('click', () => {

   if (form.classList.contains("form-hidden")) {
    form.classList.remove("form-hidden")
   }
   else{
    form.classList.add("form-hidden")
   }

      });
};

export { buddyButtonTrigger };
