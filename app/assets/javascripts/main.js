$(document).ready(function() {
  $(function() {

    $("#search").autocomplete({
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
});