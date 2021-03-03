import { initMapbox } from './init_mapbox';

const callPlacesAPI = (coordinates) => {
  let lat = coordinates.lat;
  let long = coordinates.long;
  let itemCategory = document.querySelector('#item-category').innerText;
  fetch(`/places?category=${itemCategory}&lat=${lat}&long=${long}`)
  .then(response => response.json())
  .then(data => initMapbox(data.results, lat, long));
}

export { callPlacesAPI };