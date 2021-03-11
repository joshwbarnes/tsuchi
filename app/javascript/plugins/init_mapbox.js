import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import { displayNearbyStores } from './find_nearby_places';


// eslint-disable-next-line import/no-webpack-loader-syntax
mapboxgl.workerClass = require('worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker').default;

// results is an array
const initMapbox = (results, lat, long) => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 15,
      center: [long, lat] // starting position [lng, lat]
    });
    // Nearby shops related to item category
    results.forEach((marker) => {
      new mapboxgl.Marker()
      .setLngLat([marker.geometry.location.lng, marker.geometry.location.lat])
      .addTo(map)
    });
    // Users current location
    new mapboxgl.Marker()
    .setLngLat([long, lat])
    .addTo(map)
  }
  displayNearbyStores(results, lat, long);
};

export { initMapbox };
