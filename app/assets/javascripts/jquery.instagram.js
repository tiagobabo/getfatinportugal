(function($){
	$.fn.instagram = function(options) {
		var that = this,
		apiEndpoint = "https://api.instagram.com/v1",
		settings = {
			hash: null,
			search: null,
			accessToken: null,
			clientId: String,
			show: null,
			onLoad: null,
			onComplete: null,
			maxId: null,
			minId: null
		};

		options && $.extend(settings, options);

		function createPhotoElement(photo) {
			if((photo.caption) !== null){        var photo_content = photo.caption.text + "  -  ";      }      else {        var photo_content = " "      }
			return $('<div>')
			.addClass('instagram-placeholder-gallery')
			.attr('id', photo.id)
			.append(
				$('<a>')
				// .attr('target', '_blank')
				.attr('href', photo.images.standard_resolution.url).attr('class','th radius')
				.attr('rel', 'lightbox-instagram')
				.attr('title', photo.caption.text + "&nbsp;&nbsp;/&nbsp;&nbsp;" + "<span>&hearts;</span>&nbsp;" + photo.likes.count + "&nbsp;likes" + "<br/><span> <a href = '"+photo.link+"'>view post on instagram</a></span>")  
				.append(
					$('<img>')
					.addClass('instagram-image')
					.attr('src', photo.images.low_resolution.url)
				)
			);
		}



		function composeRequestURL() {
			var url = apiEndpoint,
			params = {};

			if(settings.hash != null) {
				url += "/tags/" + settings.hash + "/media/recent";
			}
			else if(settings.search != null) {
				url += "/media/search";
				params.lat = settings.search.lat;
				params.lng = settings.search.lng;
				settings.search.max_timestamp != null && (params.max_timestamp = settings.search.max_timestamp);
				settings.search.min_timestamp != null && (params.min_timestamp = settings.search.min_timestamp);
				settings.search.distance != null && (params.distance = settings.search.distance);
			}
			else {
				url += "/media/popular";
			}

			settings.accessToken != null && (params.access_token = settings.accessToken);
			settings.clientId != null && (params.client_id = settings.clientId);

			url += "?" + $.param(params);

			return url;
		}

		settings.onLoad != null && typeof settings.onLoad == 'function' && settings.onLoad();

		$.ajax({
			type: "GET",
			dataType: "jsonp",
			cache: false,
			url: composeRequestURL(),
			success: function(res) {
				settings.onComplete != null && typeof settings.onComplete == 'function' && settings.onComplete(res.data);

				var limit = settings.show == null ? res.data.length : settings.show;

				if(res.data.length!=0){

					for(var i = 0; i < limit; i++) {
						that.append(createPhotoElement(res.data[i]));
					}
				}else{that.append("<div> <h5 class='red'> no instagram photos available</h5></div>")}
			}
		});

		return this;
	};
	$(document).ready(function() {
		$(".instagram-gallery").instagram({   
			hash: gon.hashtag.substring(1), 
			show: '4',
			clientId: '467ede5a6b9b48ae8e03f4e2582aeeb3'
		});
		$('div.instagram-placeholder-gallery').each( function(i) {
			if( i % 4 != 3 )
			return
			$(this).addClass('last-gallery')
		})
	});
	})(jQuery);



