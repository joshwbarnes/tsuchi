// import { initMapbox } from './init_mapbox';

// result.geometry.location.lat

// Display names of nearby stores
// to the view
const displayNearbyStores = (results, lat, long) => {
  let icon;
  let storeNames = results.map((result) => {
    let openIcon = '<i class="fas fa-eye text-success"></i>';
    let closedIcon = '<i class="fas fa-eye-slash text-danger"></i>';
    icon = result.opening_hours.open_now ? openIcon : closedIcon;
    return result.name;
  });
  // Display store name in HTML DOM
  const storeNameContainer = document.querySelector('.nearby-stores');
  storeNames.slice(-4).forEach((name) => {
<<<<<<< HEAD
    let element = `<p class="store-name"><span class="open-icon">${icon}</span> ${name}</p>`;
    storeNameContainer.insertAdjacentHTML('afterbegin', element);
=======

    let element = `<a href="https://www.google.com/maps/dir/${lat},${long}/${name}/" target="_blank" class="store-name">${name}</a>`;
    storeNameContainer.insertAdjacentHTML('afterbegin', element + icon);
>>>>>>> master
  });
}

// Call places controller
// which then calls the Google Places API
const callPlacesAPI = (coordinates) => {
  let lat = coordinates.lat;
  let long = coordinates.long;
  let itemCategory = document.querySelector('#item-category').innerText;
  fetch(`/places?category=${itemCategory}&lat=${lat}&long=${long}`)
  .then(response => response.json())
  .then(data => displayNearbyStores(data.results)); // Display user location on Mapbox
}

export { callPlacesAPI, displayNearbyStores };
