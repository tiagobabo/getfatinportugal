
function get_product_categories_content(url,element)
{
	set_active_class(element);

	$.get( url, function( data ) {
		$( "#list_products" ).html( data );  
	});
}

$(document).ready(function() {
	$('.delete_product').bind('ajax:success', function() {
		$(this).closest('div.row').fadeOut();
	});
});


function set_active_class(element)
{
	$(".sub-nav>dd.active").removeClass("active");
	$(element).parent().addClass("active");

}

	
  var markersArray = [];	
	 function codeAddress() {
        address = $("#map_search").val();
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            'address': address
        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var myOptions = {
                    zoom: 12,
                    center: results[0].geometry.location,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);


                google.maps.event.addListener(map, 'click', function (event) {

                    $(product_longitude).val(event.latLng.lng());
                    $(product_latitude).val(event.latLng.lat())
                    //alert(event.latLng);
                    placeMarker(event.latLng);
                });


            }
        });
    }
	
	    function placeMarker(location) {
        clearOverlays();
        var marker = new google.maps.Marker({
            position: location,
            map: map,
        });
        markersArray.push(marker);


    }
	
	 function clearOverlays() {
        for (var i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = [];
    }
	