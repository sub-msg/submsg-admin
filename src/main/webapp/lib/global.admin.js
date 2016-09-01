$(function() {
    $(".signin .login-para input").live("focus",
    function() {
        $(this).parents(".login-para").css("background-color", "#e2e2e2"),
        $(this).parents(".login-para").find(".login-icon img").css("opacity", "1")
    }),
    $(".signin .login-para input").live("blur",
    function() {
        $(this).parents(".login-para").removeAttr("style"),
        $(this).parents(".login-para").find(".login-icon img").css("opacity", "0.5")
    }),
    $("input[name=resend]").live("click",
    function() {
        d.resend()
    }),
    d.backgroundInit(),
    $(window).resize(function() {
        d.backgroundInit()
    })
});