import { callPlacesAPI } from './find_nearby_places';

// Global latLng required to add coordinates of users and 
// nearby locations from different functions
let latLng = [];
const centerMapAroundMarkers = (userLocation) => {
  // Initial LatLong with user coordinates
  // This is used to center the map around the shown markers
  latLng.push(new google.maps.LatLng(userLocation.lat, userLocation.long));
  // Create map bounds based on given markers
  var latlngbounds = new google.maps.LatLngBounds();
  for (var i = 0; i < latLng.length; i++) {
    latlngbounds.extend(latLng[i]);
  }
  return latlngbounds;
};

// coordinates is a hash of the user location
// results is the returned value from the GooglePlacesAPI
const initMap = (userLocation, storeLocations) => {
  let map;
  // Display map on view
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: userLocation.lat, lng: userLocation.long },
    zoom: 18,
  });
  // Get image of the user
  const userAvatar = { 
    url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601093115/bcenayp6675hooifnlij.jpg',
    // This marker is x pixels wide by x pixels high.
    size: new google.maps.Size(90, 90),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(0, 32),
  };
  // Add marker of the users current location to the map
  new google.maps.Marker({
    position: { lat: userLocation.lat, lng: userLocation.long },
    animation: google.maps.Animation.DROP,
    icon: userAvatar,
    map: map,
  });
  // Add the marker of nearby locations to GoogleMaps
  storeLocations.forEach((location) => {
    latLng.push(new google.maps.LatLng(location.lat, location.lng));
    new google.maps.Marker({
      position: { lat: location.lat, lng: location.lng },
      animation: google.maps.Animation.DROP,
      map: map,
    });
  });
  // Center the map around the given markers
  const bounds = centerMapAroundMarkers(userLocation);
  map.fitBounds(bounds);
};

export { initMap };
