function getCategoriesContent(url,element)
{
	set_active_class(element);

	$.get( url, function( data ) {
		$( "#list_products" ).html( data );  
	});
}

$(document).ready(function() {
	$('.delete_post').bind('ajax:success', function() {
		$(this).closest('div.row').fadeOut();
	});
});


function set_active_class(element)
{
	$(".sub-nav>dd.active").removeClass("active");
	$(element).parent().addClass("active");

}