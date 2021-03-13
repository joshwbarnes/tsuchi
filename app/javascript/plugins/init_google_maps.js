import { callPlacesAPI } from './find_nearby_places';

let map;

// coordinates is a hash of the user location
// results is the returned value from the GooglePlacesAPI
const initMap = (userLocation, storeLocations) => {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: userLocation.lat, lng: userLocation.long },
    zoom: 18,
  });
  // Add marker of the users current location to the map
  const userAvatar = { 
    url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601093115/bcenayp6675hooifnlij.jpg',
    // This marker is x pixels wide by x pixels high.
    size: new google.maps.Size(90, 90),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(0, 32),
  };
  new google.maps.Marker({
    position: { lat: userLocation.lat, lng: userLocation.long },
    animation: google.maps.Animation.DROP,
    icon: userAvatar,
    map: map,
  });
  
  // Add the marker of nearby locations to GoogleMaps
  storeLocations.forEach((location) => {
    new google.maps.Marker({
      position: { lat: location.lat, lng: location.lng },
      animation: google.maps.Animation.DROP,
      map: map,
    });
  });
}

export { initMap };
