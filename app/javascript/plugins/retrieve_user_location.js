// // watchPosition locates the users current position
// // It registers a handler function that will be called automatically
// // each time the position of the device changes, returning the updated function
import { initMapbox } from './init_mapbox';
import { callPlacesAPI } from './find_nearby_places';

function success(pos) {
  var crd = pos.coords;
  let lat = crd.latitude;
  let long = crd.longitude;
  let coordinates = {
    lat: lat,
    long: long
  }
  callPlacesAPI(coordinates);
  // initMapbox(coordinates);
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