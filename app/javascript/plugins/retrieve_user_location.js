// // watchPosition locates the users current position
// // It registers a handler function that will be called automatically
// // each time the position of the device changes, returning the updated function
import { initMapbox } from './init_mapbox';

function success(pos) {
  var crd = pos.coords;
  let lat = crd.latitude;
  let long = crd.longitude;
  let coordinates = {
    lat: lat,
    long: long
  }
  // console.log(`Latitude: ${lat} Longitude: ${long}`);
  initMapbox(coordinates);

  // Call Google Places API

  const url = `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${long}&radius=500&types=book_store&key=PLACES_API_KEY`;

  fetch(url)
  .then(response => response.json())
  .then(data => console.log(data));
}

function error(err) {
  console.warn('ya buggered up');
}

function getLocation() {
  var options = {
    enableHighAccuracy: true,
  }
  let id = navigator.geolocation.getCurrentPosition(success, error, options);
}

export { getLocation, success };