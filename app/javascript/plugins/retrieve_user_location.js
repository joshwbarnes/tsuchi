// watchPosition locates the users current position
// It registers a handler function that will be called automatically
// each time the position of the device changes, returning the updated function
// getCurrentPosition finds the user location but does not listen for changes
import { callPlacesAPI } from './find_nearby_places';
import { initMap } from './init_google_maps';

function success(pos) {
  var crd = pos.coords;
  let lat = crd.latitude;
  let long = crd.longitude;
  let coordinates = {
    lat: lat,
    long: long
  }
  // Coordinates is an object
  // access lat & long by calling coordinates.lat and
  // coordinates.long  *** callPlacesAPI(coordinates);
  initMap(coordinates);
}

function error(err) {
  console.log('err');
}

function getLocation() {
  var options = {
    enableHighAccuracy: true,
  }
  navigator.geolocation.getCurrentPosition(success, error, options);
}

export { getLocation, success };