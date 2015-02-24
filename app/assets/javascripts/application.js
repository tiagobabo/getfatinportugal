// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require script
//= require google.maps
//= require jquery.ui.all
//= require prettify

document.write("<script async src='http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js' type='text/javascript'></script>");
var projects = gon.projects;

$(document).ready(function() {
	prettyPrint();
	$(function() {
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/pt_PT/all.js#xfbml=1&appId=544436338959490";
			fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));

			$("#searchMain").autocomplete({
				source: projects,
				select: function( event, ui ) {
					window.location = "/products/" + ui.item.slug;
					return false;
				}
			}).data("autocomplete" )._renderItem = function( ul, item ) {
				return $("<li></li>")
				            .data("item.autocomplete", item)
				.append("<a href='/products/" + item.slug + "'>" + "<img style='width:25px;height:25px' src='" + item.icon + "' />" + "<span class='field'>" + item.value + "</span></a>")
				.appendTo( ul );
			};
		});	
	
	
		var c = $("#socialBar");
		    if (c.length) {
		        var n = $(window),
		            l = $("#footer-wrap"),
		            p = c.offset().top,
		            m = l.offset(),
		            d = m.top - c.height(),
		            g = 90;
		        c.fadeIn(400), n.scroll(function() {
		            n.scrollTop() > d ? c.stop().animate({
		                marginTop: d
		            }) : n.scrollTop() > p ? c.stop().animate({
		                marginTop: n.scrollTop() - p + g
		            }, 1e3) : c.stop().animate({
		                marginTop: 0
		            })
		        })
		    }
	});
	
	
	
	