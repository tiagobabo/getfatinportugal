$(document).ready(function () {
   var googleMaps = new GoogleMaps('map-canvas');
   googleMaps.zoom=10;   
   googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
  
  if(!gon.latitude && !gon.longitude)
   {	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeWithRegion(gon.region));
   }
   else {	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeCoordinates(gon.latitude, gon.longitude, true));
   }

//google ads
(adsbygoogle = window.adsbygoogle || []).push({});

//twitter
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

});
