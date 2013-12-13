document.write("<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyCg38ejoS6k0WzzLIBM39H8gED-jUwDFrw&sensor=true' type='text/javascript'></script>");
// Constructor. _mapCanvas is the ID of the div where the google maps will be shown
function GoogleMaps(_mapCanvas) {
	// Add object properties like this
	this.latitude;
	this.longitude;
	this.mapCanvas=_mapCanvas;
	this.mapSearch;
	this.region;
	this.map;
	this.zoom;
	this.mapType;
	this.markersArray=[];
}

GoogleMaps.prototype.initializeCoordinates = function (latitude, longitude, removeMarkers) {
	var _this = this;
	this.latitude = latitude;
	this.longitude = longitude;   
	var myLatlng = new google.maps.LatLng(this.latitude, this.longitude);
	var mapOptions = {
		zoom: this.zoom,
		center: myLatlng,
		mapTypeId: this.mapType
	}
	_this.map = new google.maps.Map(document.getElementById(_this.mapCanvas), mapOptions);

	this.placeMarker(myLatlng, removeMarkers);

}

GoogleMaps.prototype.initializeWithRegion = function (region) {
	var _this = this;
	this.region = region;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address': _this.region
	}, function (results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var myOptions = {
				zoom: _this.zoom,
				center: results[0].geometry.location,
				mapTypeId: _this.mapType
			}
			_this.map = new google.maps.Map(document.getElementById(_this.mapCanvas), myOptions);

			var myLatlng = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			_this.latitude= results[0].geometry.location.lat();
			_this.longitude = results[0].geometry.location.lng();			
			_this.placeMarker(myLatlng, true);
		}
	});
}

GoogleMaps.prototype.initializeAtCurrentLocation = function () {
	var _this = this;
	var mapOptions = {
		zoom: _this.zoom,      
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	_this.map = new google.maps.Map(document.getElementById(_this.mapCanvas), mapOptions); 

	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function (position) {
			var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			_this.map.setCenter(myLatlng);
			_this.placeMarker(myLatlng,true);
		});
	}
}

GoogleMaps.prototype.clearOverlays = function() {
	for (var i = 0; i < this.markersArray.length; i++) {
		this.markersArray[i].setMap(null);
	}
	this.markersArray = [];
}

GoogleMaps.prototype.placeMarker = function(location, removeMarkers) {
	var _this = this;
	if(removeMarkers)
	this.clearOverlays();

	var marker = new google.maps.Marker({
		position: location,
		map: _this.map,
	});
	this.markersArray.push(marker);
}

GoogleMaps.prototype.showMapByAddress = function(address, longitude, latitude)
{	
	var _this = this;	
	geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address': address
	}, function (results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var myOptions = {
				zoom: _this.zoom,
				center: results[0].geometry.location,
				mapTypeId:_this.mapType
			}
			_this.map = new google.maps.Map(document.getElementById(_this.mapCanvas), myOptions);      

			var myLatlng = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			_this.latitude= results[0].geometry.location.lat();
			_this.longitude = results[0].geometry.location.lng();
			latitude.val(_this.latitude);
			longitude.val(_this.longitude);
			_this.placeMarker(myLatlng, true);
		}
	});
}

GoogleMaps.prototype.showCountries = function(countries)
{	
	var _this = this;	


	var myOptions = {
		zoom: _this.zoom,
		center: new google.maps.LatLng(38.571431,-7.913501999999994),
		mapTypeId:_this.mapType
	}
	_this.map = new google.maps.Map(document.getElementById(_this.mapCanvas), myOptions);
var counter=0;
	countries.forEach(function(entry) 
	{
		counter++;
		setTimeout(_this.getAddress(entry),150*counter)
	});
}
GoogleMaps.prototype.getAddress = function (entry)
{
	var _this = this;	
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address': entry.name
	}, function (results, status) {
		if (status == google.maps.GeocoderStatus.OK) {

			var myLatlng = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			_this.latitude= results[0].geometry.location.lat();
			_this.longitude = results[0].geometry.location.lng();

			_this.placeMarkerWithLabel(entry.name, myLatlng,entry.slug );   

		}
	});
	
}
GoogleMaps.prototype.placeMarkerWithLabel = function(countryName,latlng,linkCountry)
{
	var _this = this;
	var marker = new MarkerWithLabel({
		position: latlng,
		draggable: false,
		map: _this.map,      
	});

	var iw = new google.maps.InfoWindow({
		content: '<a href="/portuguese/'+linkCountry+'">Portuguese restaurants in '+countryName+'</a>'
	});

	this.markersArray.push(marker);
	google.maps.event.addListener(marker, "click", function (e) { iw.open(_this.map, marker); });
}