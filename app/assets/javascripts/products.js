$(document).ready(function () {
   var googleMaps = new GoogleMaps('map-canvas');
   googleMaps.zoom=10;   
   googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
  
  if(!gon.latitude && !gon.longitude)
   {	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeWithRegion(gon.region));
   }
   else {	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeCoordinates(gon.latitude, gon.longitude));
   }  	
});
