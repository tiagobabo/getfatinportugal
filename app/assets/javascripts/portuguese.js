var googleMaps = new GoogleMaps('map-canvas-world');
$(document).ready(function() {
	googleMaps.zoom=2;   
	googleMaps.mapType = google.maps.MapTypeId.ROADMAP;

	google.maps.event.addDomListener($("#map-canvas-world"), 'load', googleMaps.showCountries(gon.countries));
	
		
		
		$( "#country_combo" ).change(function() {
			var id =$( "select option:selected" ).val();
		  googleMaps.zoom=5; 
		  googleMaps.clearOverlays();
			 
			$.get('/portuguese/'+id+".json", function (data) {
				gon.countries.forEach(function(entry){
					 if (entry.name == $( "select option:selected" ).text()) {
					        googleMaps.showRestaurant(data, entry.latitude,entry.longitude);
					    }
				});

				
				
						
		    });
		
		  
		});
	
});