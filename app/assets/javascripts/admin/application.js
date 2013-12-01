//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery.ui.all
//= require admin/categories
//= require admin/configuration/service_modalities
//= require admin/configuration/client_types
//= require admin/clients
//= require admin/news

$(function() {
   $(document).foundation();
   
});

$(function() {
  $(document)
    .hide()  // hide it initially.
    .ajaxStart(function() {
      $(".ajax-loading").show(); // show on any Ajax event.
    })
    .ajaxStop(function() {
      $(".ajax-loading").fadeOut(); // hide it when it is done.
  });
});