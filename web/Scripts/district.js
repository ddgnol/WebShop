$(document).on('change', '.form-control', function () {
    var district = [];
    var data =[];
    var province = $('.form-control option:selected').val();
    $.ajax({
        type: "get",
        url: "DistrictSer" + province,
        data: JSON.stringify(data),
        async: false,
        contentType: "application/json;charset=utf-8",
        success: function (response) {
            data = response ;
            $.each('select.form-control').append('<option value="'+item+'">'+item+'</option>');

        }
    });
});
                