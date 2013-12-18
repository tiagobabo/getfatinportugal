$(document).ready(function () {
   var googleMaps = new GoogleMaps('map-canvas');
   googleMaps.zoom=17;   
   googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
  
	   
	google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.showMapByAddress(gon.address,null,null));
  
	//twitter
	!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

});