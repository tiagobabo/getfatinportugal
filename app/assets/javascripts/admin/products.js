
function get_product_categories_content(url, element) {
    set_active_class(element);

    $.get(url, function (data) {
        $("#list_products").html(data);
    });
}

$(document).ready(function () {
    $('.ajax_actions').bind('ajax:success', function () {
        $(this).closest('div.row').fadeOut();
    });
});


function set_active_class(element) {
    $(".sub-nav>dd.active").removeClass("active");
    $(element).parent().addClass("active");

}

var googleMaps = new GoogleMaps('map-canvas');
$(document).ready(function () {
    googleMaps.zoom = 12;
    googleMaps.mapType = google.maps.MapTypeId.ROADMAP;
	if(typeof gon !== 'undefined'){
    if (!gon.latitude && !gon.longitude) {
        google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeAtCurrentLocation());
    }
    else {

        google.maps.event.addDomListener($("#map-canvas"), 'load', googleMaps.initializeCoordinates(gon.latitude, gon.longitude));
    }
}
});

function findByAddress()
{
	googleMaps.showMapByAddress($("#map_search").val(),$("#product_longitude"),$("#product_latitude"));
}


