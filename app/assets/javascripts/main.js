console.log('Hey!');

var addedPlaceEvent = document.createEvent('Event');
addedPlaceEvent.initEvent('custom/addedPlace', true, true);

const provider = new window.GeoSearch.OpenStreetMapProvider();

function addPlaceButton() {
  var event = new CustomEvent('custom/addedPlace');
  window.dispatchEvent(event);
}

function popupCallback({query, result}) {
  var event = new CustomEvent('custom/openedPopup', { detail: result });
  window.dispatchEvent(event);
  return `<div class="popup-label" data-place-label="${result}">${result.label}</div> <br /> <button id="add-place" onclick="${addPlaceButton} addPlaceButton();">Add</button>`
}

const searchControl = new window.GeoSearch.GeoSearchControl({
  provider: provider,
  showPopup: true,
  popupFormat: popupCallback,
  style: 'bar',
  maxMarkers: 5,
  keepResult: true
});

var mymap = L.map('mapid').setView([51.505, -0.09], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1Ijoia2lsbGlhbmtlbXBzIiwiYSI6ImNpa2Zqcmp6dzAwMW91dGttMXZwaXVlOXoifQ.sM4Mivt3C4b8lPGKzNorxQ'
}).addTo(mymap);

mymap.addControl(searchControl);

mymap.on('geosearch/showlocation', function(event){
  console.log('Got an event: ', event);
});

var latestPlace = {};

window.addEventListener('custom/openedPopup', function (e) {
  console.log('Receivd opened popup event: ', e);
  latestPlace = e.detail;
}, false);

window.addEventListener('custom/addedPlace', function (e) {
  console.log('Received add place event, going to add ', latestPlace);
  console.log(e);
}, false);
