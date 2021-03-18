import { initMap } from './init_google_maps';

// Display names of nearby stores
// to the view
const displayNearbyStores = (results, lat, long) => {
  // Save nearby store locations to storeLocations
  // This will hold an array with hash values of the lat and long
  // retrieved via: storeLocations.lat or storeLocations.lng
  const storeLocations = results.map((result) => {
    return result.geometry.location;
  });
  // Check if nearby store is open
  // The resulting true/false determines if the icon
  // next to the store name shows as open (green) or closed (red)
  let icon;
  const storeNames = results.map((result) => {
    let openIcon = '<i class="fas fa-eye text-success"></i>';
    let closedIcon = '<i class="fas fa-eye-slash text-danger"></i>';
    // Checks if the nearby store has opening_hours available 
    if (result.hasOwnProperty("opening_hours")) {
      icon = result.opening_hours.open_now ? openIcon : closedIcon;
    }
    return result.name;
  });
  
  // Display store name in view
  const storeNameContainer = document.querySelector('.nearby-stores');
  if (results.length > 0) {
    storeNames.slice(-2).forEach((name) => {
      // Build link to Google Maps with user current location and nearby store name
      let element = `<a href="https://www.google.com/maps/dir/${lat},${long}/${name}/" target="_blank" class="store-name"><span class="open-icon">${icon}</span> ${name}</a>`;
      storeNameContainer.insertAdjacentHTML('afterbegin', element);
    });
  } else {
    let element = '<p class="store-name font-weight-bold">No stores nearby</p>';
    storeNameContainer.insertAdjacentHTML('afterbegin', element);
  }
  // Call the GoogleMaps API to display the users location
  // and the nearby stores location on the map
  // with markers
  const userLocation = {
    lat: lat,
    long: long
  }
  initMap(userLocation, storeLocations)
};

// Call places controller within controllers/places_controller.rb
// which then calls the Google Places API
// The Google Places API finds stores matching the 
// store description and returns the result
// This Result and the users current lat and long are then passed to
// displayNearbyStores() which displays the nearby stores to the view
const callPlacesAPI = (coordinates) => {
  let lat = coordinates.lat;
  let long = coordinates.long;
  let itemCategory = document.querySelector('#item-category').innerText;
  if (itemCategory == null) {
    alert('Something went wrong');
  } else {
    fetch(`/places?category=${itemCategory}&lat=${lat}&long=${long}`)
    .then(response => response.json())
    .then(data => displayNearbyStores(data.results, lat, long));
  }
}

export { callPlacesAPI, displayNearbyStores };
