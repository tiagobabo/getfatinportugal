var googleMaps = new GoogleMaps('map-canvas');
$(document).ready(function () {
   googleMaps.zoom=10;   
   googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
  
  google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeAtCurrentLocation()); 	
});

function findByAddress()
{
	googleMaps.showMapByAddress($("#map_search").val(),$("#product_longitude"),$("#product_latitude"));	
}