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
  return `<div class="popup-label">${result.label}</div> <br /> <button id="add-place" onclick="addPlaceButton()" type=button>Add</button>`
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

var latestPlace = {};
var addedPlaces = [];
var places_form = document.getElementById('user_places_list');
var places_list = document.getElementById('added-places');

function deletePlaceButton(index) {
  addedPlaces.splice(index, 1);
  registerState();
}

function registerState() {
  places_form.value = JSON.stringify(addedPlaces);
  places_list.innerHTML = '';
  for (var i = 0; i < addedPlaces.length; i++) {
    var new_place_label = document.createElement('li');
    new_place_label.innerHTML = `${addedPlaces[i].label} <button type=button onclick="deletePlaceButton(${i})">X</button>`;
    places_list.appendChild(new_place_label);
  }
}

window.addEventListener('custom/openedPopup', function (e) {
  latestPlace = e.detail;
}, false);

window.addEventListener('custom/addedPlace', function (e) {
  addedPlaces.push(latestPlace);
  registerState();
  console.log(addedPlaces);
}, false);
