const initMap = (coordinates) => {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: coordinates.lat, lng: coordinates.long },
    zoom: 18,
  });
  // Add marker of the users current location to the map
  new google.maps.Marker({
    position: { lat: coordinates.lat, lng: coordinates.long },
    map: map,
  });
}

export { initMap };
