
function get_product_categories_content(url, element) {
    set_active_class(element);

    $.get(url, function (data) {
        $("#list_products").html(data);
    });
}

$(document).ready(function () {
    $('.delete_product').bind('ajax:success', function () {
        $(this).closest('div.row').fadeOut();
    });
});


function set_active_class(element) {
    $(".sub-nav>dd.active").removeClass("active");
    $(element).parent().addClass("active");

}

var markersArray = [];

function initialize() {
    var myLatlng = new google.maps.LatLng(gon.latitude, gon.longitude);
    var mapOptions = {
        zoom: 10,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    if (navigator.geolocation && !gon.latitude && !gon.longitude) {
        navigator.geolocation.getCurrentPosition(function (position) {
            myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            map.setCenter(myLatlng);
            placeMarker(myLatlng);
        });
    }
    placeMarker(myLatlng);

}
$(document).ready(function () {
    google.maps.event.addDomListener(window, 'load', initialize);
});

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
