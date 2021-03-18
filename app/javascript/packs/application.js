// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { getLocation } from '../plugins/retrieve_user_location';
import { itemNotification } from '../plugins/notification';
import { init_flatpickr } from '../plugins/init_flatpickr';
import { buddyButtonTrigger } from '../plugins/buddy_button';



document.addEventListener('turbolinks:load', () => {
  getLocation();
  itemNotification();
  init_flatpickr();
  buddyButtonTrigger();

});
