$(document).ready(function() {
	$('.delete_news').bind('ajax:success', function() {
		$(this).closest('tr').fadeOut();
	});
});