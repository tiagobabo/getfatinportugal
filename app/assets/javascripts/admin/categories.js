$(document).ready(function() {
	$('.delete_category').bind('ajax:success', function() {
		$(this).closest('div.row').fadeOut();
	});
});