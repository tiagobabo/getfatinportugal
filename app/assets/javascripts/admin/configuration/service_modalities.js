$(document).ready(function() {
	$('.delete_service_modality').bind('ajax:success', function() {
		$(this).closest('tr').fadeOut();
	});
});