$(document).ready(function () {
   var googleMaps = new GoogleMaps('map-canvas');
   googleMaps.zoom=17;   
   googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
  
	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.showMapByAddress(gon.address,null,null));
  
});