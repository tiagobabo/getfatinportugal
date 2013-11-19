$(function () {
	 var pickerOpts = {dateFormat:"yy-mm-dd"}
	
    $('#btn_products').click(function () {
        if ($("#list_products").is(":visible"))
            $("#list_products").hide();
        else {
            $("#list_products").show();
            if ($("#list_products").html().trim().length <= 0) {
                $.get("/admin/products/list_all_products/1", function (data) {
                    $("#list_products").html(data);
                });
            }
        }
    });

  /*  $('#btn_payment').click(function () {
        if ($("#payments").is(":visible"))
            $("#payments").hide();
        else {
            $("#payments").show();
            if ($("#payments").html().trim().length <= 0) {
                $.get("/admin/payments/show_payment_plan", function (data) {
                    $("#payments").html(data);
                });
            }
        }
    });*/
    $('#btn_payment_plan').click(function () {
        if ($("#payment_plans").is(":visible"))
            $("#payment_plans").hide();
        else {
            $("#payment_plans").show();
            if ($("#payment_plans").html().trim().length <= 0) {
                $.get("/admin/payments/show_payment_plan", function (data) {
                    $("#payment_plans").html(data);				
					$(document).foundation();					 // hack to put the select box with the same style
					 $("#time-options").addClass("hideDivs");
					 $('#date_begin').datepicker(pickerOpts);
                    $("#modality_select").change(function () {
                        if ($(this).val() == "pay-per-view") {
                            $("#pay-per-view-options").removeClass("hideDivs");
                            $("#time-options").addClass("hideDivs");
							$('#date_begin').datepicker(pickerOpts);							
                        }
                        else {                           
                            $("#time-options").removeClass("hideDivs");
							$('#date_begin_time').datepicker(pickerOpts);	
							$('#date_end_time').datepicker(pickerOpts);	
							$("#pay-per-view-options").addClass("hideDivs");
                        }
                    });												
                });
            }
        }
    });
});

