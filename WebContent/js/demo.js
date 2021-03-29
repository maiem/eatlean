$(document).ready(function () {
    $('.click1').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $('#services').offset().top
        }, 1000)
    });
    $('.click2').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $('#statistics').offset().top
        }, 1000)
    });
    $('.click3').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $('#partners').offset().top
        }, 1000)
    });
    $('.click4').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $('#why').offset().top
        }, 1000)
    });
    $('.click5').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: $('#team').offset().top
        }, 1000)
    });
    $('.click-top').click(function (e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 1000)
    });
    $('.drop1').click(function (e) {
        e.preventDefault();
        // $('.txt2').slideToggle(700);
        // $('.txt3').slideToggle(700);
        // $('.txt4').slideToggle(700);
        // $('.txt2').slideUp(700);
        // $('.txt3').slideUp(700);
        // $('.txt4').slideUp(700);
        $('.txt1').slideToggle(300);
    });
    $('.drop2').click(function (e) {
        e.preventDefault();
        $('.txt2').slideToggle(300);
    });
    $('.drop3').click(function (e) {
        e.preventDefault();
        $('.txt3').slideToggle(300);
    });
    $('.drop4').click(function (e) {
        e.preventDefault();
        $('.txt4').slideToggle(300);
    });
    $('#sua').click(function (e) {
        e.preventDefault();
        $('.add').addClass('none');
        $('.update').removeClass('none');
        $('.update').addClass('block');
    });
});