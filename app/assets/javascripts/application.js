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
//= require foundation
//= require jquery.ui.all

$(function() {
   $(document).foundation();
    $("#searchMain").autocomplete({
      source: gon.projects,
      select: function( event, ui ) {
        window.location = "products/" + ui.item.id;
        return false;
      }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li>" )
      .append("<a href='products/" + item.id + "'>" + "<img style='width:40px;height:40px' src='" + item.icon + "' />" + "<span id='teste'>" + item.value + "</span></a>")
      .appendTo( ul );
    };
});
