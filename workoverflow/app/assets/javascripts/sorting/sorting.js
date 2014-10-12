$(function() {
	$('a[href$="/sort/popularity"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href^="/sort"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href^="/admin/sort"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href$="/admin/sort/popularity"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});
});