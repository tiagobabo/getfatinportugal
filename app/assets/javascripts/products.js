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

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_PT/all.js#xfbml=1&appId=544436338959490";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
   
});