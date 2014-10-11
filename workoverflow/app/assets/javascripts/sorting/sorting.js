$(function() {
	$('a[href$="/sort/popularity"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href$="/sort/category"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href$="/sort/location"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href$="/sort/remote"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});

	$('a[href$="/sort/recent"]').on('ajax:success', function(event, data){
		event.preventDefault();
		$("#projects").empty();
		$("#projects").append(data);
	});
});