function teste(teste)
{
$(".sub-nav>dd.active").removeClass("active");
var a= $(teste).parent();
a.addClass("active");
$.get( "/admin/products/2", function( data ) {
  $( "#list_products" ).html( data );  
});
}
$(document).ready(function() {
	$('.delete_post').bind('ajax:success', function() {
		$(this).closest('div.row').fadeOut();
	});
});
