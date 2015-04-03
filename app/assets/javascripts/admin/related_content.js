$(function() {
    $('#btn_related_products').click(function() {
        if ($("#list_related_products").is(":visible"))
            $("#list_related_products").hide();
        else {
            $("#list_related_products").show();
            if ($("#list_related_products").html().trim().length <= 0) {
                $.get("/admin/products/list_all_products/1", function(data) {
                    $("#list_related_products").html(data);
                });
            }
        }
    });

  

	var obj = $("#search_products").autocomplete({
		source: gon.projects,
		select: function( event, ui ) {
			$("#selected_product_id").val(ui.item.slug);
	get_products_related("/admin/related_content/products_related/"+ui.item.slug)
		}
	}).data("autocomplete" );
	obj && (obj._renderItem = function( ul, item ) {
		return $("<li></li>")
		            .data("item.autocomplete", item)
		.append("<a href='/products/" + item.slug + "'>" + "<img style='width:25px;height:25px' src='" + item.icon + "' />" + "<span class='field'>" + item.value + "</span></a>")
		.appendTo( ul );
	});

})

function get_products_related(url) {

    $.get(url, function (data) {

	 $("#teste").html(data);
	
	$("#add_items_btn").click(function(event) {

	      $.each($('#products_ option:selected'), function(i, item) {

	          $('#selected_products_').append($('<option>', {
	              value: item.value,
	              text: item.text
	          }));

	      })
		  event.preventDefault();
		  event.stopPropagation();
	      $("#products_ option:selected").remove();
	  })
	  $("#rem_items_btn").click(function(event) {

	      $.each($('#selected_products_ option:selected'), function(i, item) {

	          $('#products_').append($('<option>', {
	              value: item.value,
	              text: item.text
	          }));

	      })
		  event.preventDefault();
		  event.stopPropagation();
	      $("#selected_products_ option:selected").remove();
	  })
	
	
	
    });
}
