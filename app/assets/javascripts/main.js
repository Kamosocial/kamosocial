console.log('Hey!');
const provider = new window.GeoSearch.OpenStreetMapProvider();

const searchControl = new window.GeoSearch.GeoSearchControl({
  provider: provider,
  style: 'bar',
  keepResult: true
});

var mymap = L.map('mapid').setView([51.505, -0.09], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1Ijoia2lsbGlhbmtlbXBzIiwiYSI6ImNpa2Zqcmp6dzAwMW91dGttMXZwaXVlOXoifQ.sM4Mivt3C4b8lPGKzNorxQ'
}).addTo(mymap);

//const map = new L.Map('map');
mymap.addControl(searchControl);

mymap.on('geosearch/showlocation', function(event){
  console.log('Got an event: ', event);
});
