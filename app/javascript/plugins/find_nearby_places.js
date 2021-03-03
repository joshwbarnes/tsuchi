import { initMapbox } from './init_mapbox';

// Display names of nearby stores
// to the view
const displayNearbyStores = (results) => {
  let storeNames = results.map((result) => {
    return result.name;
  });

  const storeNameContainer = document.querySelector('.nearby-stores');
  storeNames.slice(-4).forEach((name) => {
    let element = `<p class="store-name">${name}</p>`;
    storeNameContainer.insertAdjacentHTML('beforeend', element);
  });
}

// Call places controller
// which then calls the Google PLaces API
const callPlacesAPI = (coordinates) => {
  let lat = coordinates.lat;
  let long = coordinates.long;
  let itemCategory = document.querySelector('#item-category').innerText;
  fetch(`/places?category=${itemCategory}&lat=${lat}&long=${long}`)
  .then(response => response.json())
  .then(data => initMapbox(data.results, lat, long));
}

export { callPlacesAPI, displayNearbyStores };