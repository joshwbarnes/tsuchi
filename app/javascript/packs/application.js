// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { getLocation } from '../plugins/retrieve_user_location';
import { init_flatpickr } from '../plugins/init_flatpickr';
document.addEventListener('turbolinks:load', () => {
  getLocation();
  init_flatpickr();
  
  let ping = document.querySelector("#pingers");
  ping.addEventListener("click", () => {
    Notification.requestPermission()
    .then((result) => {
      var img = 'https://picsum.photos/50';
      var text = 'Check out this notification!';
      var notification = new Notification('Notification', { body: text, icon: img });
    });
  });
});
