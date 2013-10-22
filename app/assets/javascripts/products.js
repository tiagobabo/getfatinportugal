document.write("<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyCg38ejoS6k0WzzLIBM39H8gED-jUwDFrw&sensor=true' type='text/javascript'></script>");

$(document).ready(function() {
	var map;
	var geocoder;  	
  	function initialize() {
  		geocoder = new google.maps.Geocoder();
  		geocoder.geocode({
  			'address': gon.region
  		}, function(results, status) {
  			if (status == google.maps.GeocoderStatus.OK) {
  				var myOptions = {
  					zoom: 12,  					
  					center: results[0].geometry.location,
  					mapTypeId: google.maps.MapTypeId.ROADMAP
  				}
  				map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
  	}});
	}
  	google.maps.event.addDomListener(window, 'load', initialize);
});