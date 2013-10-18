$(document).ready(function() {
    $(function() {
    	$('.left_tile1').css('background-image', 'url('+gon.urls[3]+')');
    	$('.right_tile1').css('background-image', 'url('+gon.urls[0]+')');
    	$('.left_tile2').css('background-image', 'url('+gon.urls[2] +')');
    	$('.right_tile2').css('background-image', 'url('+gon.urls[1]+')');
    $("#search").autocomplete({
      source: gon.projects,
      select: function( event, ui ) {
        window.location = "products/" + ui.item.id;
        return false;
      }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li>" )
        .append("<a href='products/" + item.id + "'>" + "<img style='width:40px;height:40px' src='" + item.icon + "' />" + "<span id='teste'>" + item.value + "</span></a>")
        .appendTo( ul );
    };

	});
  });