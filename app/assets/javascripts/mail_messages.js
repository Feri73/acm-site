$(function () {
$(document).ready(function () {
    $('select').chosen({width: '100%'});
    $("#send_to_all").change( function() {
        if ($(this).is(":checked"))
        {
            $("#user_mails_div").hide();
        }
        else
        {
            $("#user_mails_div").show();
        }
    });
});


});