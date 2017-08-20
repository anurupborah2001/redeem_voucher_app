/**
 * 
 */
 $(function() {
    // Setting focus
    $('input[name="email"]').focus();

    // Setting width of the alert box
    var alert = $('.alert');
    var formWidth = $('.bootstrap-admin-login-form').innerWidth();
    var alertPadding = parseInt($('.alert').css('padding'));

    if(isNaN(alertPadding)){
        alertPadding = parseInt($(alert).css('padding-left'));
    }

    $('.alert').width(formWidth - 2 * alertPadding);
});