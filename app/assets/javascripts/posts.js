//$(function () {
//    $(window).scroll(function () {
//        return $(".blur").css("opacity", $(window).scrollTop() / 300);
//    });
//});

$(function () {
//    $(".like-btn").on({
//        mouseenter: function () {
//            $(this).find("span:first").hide();
//            $(this).append("<span><i class='fa fa-thumbs-up fa-2x'></i></span>");
//        },
//        mouseleave: function () {
//            $(this).find("span:first").show();
//            $(this).find("span:last").remove();
//        }
//    });
    $(document).on("mouseenter", ".like-btn",function (event) {
        $(this).find("span:first").hide();
        $(this).append("<span><i class='fa fa-thumbs-up fa-2x'></i></span>");
    });
    $(document).on("mouseleave", ".like-btn",function (event) {
        $(this).find("span:first").show();
        $(this).find("span:last").remove();
    });
//    $(".unlike-btn").on({
//        mouseenter: function () {
//        $(this).find("span:first").hide();
//        $(this).append("<span><i class='fa fa-times fa-2x'></i></span>");
//        },
//        mouseleave: function () {
//        $(this).find("span:first").show();
//        $(this).find("span:last").remove();
//        }
//    });
    $(document).on("mouseenter", ".unlike-btn",function (event) {
        $(this).find("span:first").hide();
        //$(this).append("<span><i class='fa fa-times fa-2x'></i></span>");
        $(this).append("<span><i class='fa fa-thumbs-down fa-2x'></i></span>");
    });
    $(document).on("mouseleave", ".unlike-btn",function (event) {
        $(this).find("span:first").show();
        $(this).find("span:last").remove();    }
    );


//        on("hover",function(){
//        $(this).find("span:first").hide();
//        $(this).append("<span><i class='fa fa-thumbs-up fa-2x'></i></span>");
//    }, function(){
//        $(this).find("span:first").show();
//        $(this).find("span:last").remove();
//    });
//    $(".unlike-btn").on("hover",function(){
//        $(this).find("span:first").hide();
//        $(this).append("<span><i class='fa fa-times fa-2x'></i></span>");
//    }, function(){
//        $(this).find("span:first").show();
//        $(this).find("span:last").remove();
//    });

});