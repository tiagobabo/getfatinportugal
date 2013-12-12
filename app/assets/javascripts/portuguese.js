var googleMaps = new GoogleMaps('map-canvas-world');
$(document).ready(function() {
	googleMaps.zoom=2;   
	googleMaps.mapType = google.maps.MapTypeId.ROADMAP;

	google.maps.event.addDomListener($("#map-canvas-world"), 'load', googleMaps.showCountries(gon.countries));
});