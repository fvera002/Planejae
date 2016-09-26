$(function () {
    $(".sortable").sortable({
        stop: function (event, ui) {

            $(".sortable tr").each(function (index, element) {
                // find the hidden input in each <li> and set it to its current index, according to the DOM
                var hiddenInput = $(element).find("input[name*='Order']").first();
                hiddenInput.val(index);
            });
        }
    });
    $(".sortable").disableSelection();
    //$("#submit").click(saveOrder);
});

function saveOrder() {
    var atividades = new Array();
    $(".sortable tr").each(function (index) {
        var atv = new Object();
        atv.Id = parseInt($(this).attr('Id'));
        atv.Order = index;
        atividades.push(atv);
    });
    $.ajax({
        type: 'POST',
        url: '/Processo/Order',
        data: JSON.stringify(atividades),
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function () {
            window.location.href('/Processo/Order');
        }
    });
}