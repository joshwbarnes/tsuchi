import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

// eslint-disable-next-line import/no-webpack-loader-syntax 
mapboxgl.workerClass = require('worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker').default;

const initMapbox = (coordinates) => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 15,
      center: [coordinates.long, coordinates.lat] // starting position [lng, lat]
    });
    let marker = new mapboxgl.Marker()
      .setLngLat([coordinates.long, coordinates.lat])
      .addTo(map)
  }

    // Call route to Google Place API in Places Controller
    fetch(`/places?lat=${coordinates.lat}&long=${coordinates.long}`)
    .then(response => response.json())
    .then(data => console.log(data)); // Log the API response from Google Places
};

export { initMapbox };