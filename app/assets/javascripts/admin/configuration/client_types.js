$(document).ready(function() {
	$('.delete_client_type').bind('ajax:success', function() {
		$(this).closest('tr').fadeOut();
	});
});