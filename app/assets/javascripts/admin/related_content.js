$(function () {	
    $('#btn_related_products').click(function () {
        if ($("#list_related_products").is(":visible"))
            $("#list_related_products").hide();
        else {
            $("#list_related_products").show();
            if ($("#list_related_products").html().trim().length <= 0) {
                $.get("/admin/products/list_all_products/1", function (data) {
                    $("#list_related_products").html(data);
                });
            }
        }
    });
})