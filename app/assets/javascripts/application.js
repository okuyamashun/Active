// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


     // post-index  //

$(function(){
    $('.index-title').css({
        opacity: "0"
    });

    setTimeout(function() {
        $(".index-title").animate({
            opacity:"6.0"
        }, 3000);
    }, 1000);
});


$(function(){
    $('.cards').css({
        opacity: "0"
    });

    setTimeout(function() {
        $(".cards").animate({
            opacity:"4.5"
        }, 3000);
    }, 3500);
});

$(function(){
    $(".back-suraido").css("display", "none");//アニメーション中は非表示
    $("header").css("display", "none");
    $("footer").css("display", "none");
        setTimeout(function(){
            $('.ani1').slideUp();
        },10000);//約10秒数後
});

$(function(){
    $(".back-suraido").css({opacity:'0'});
        setTimeout(function(){
            $(".back-suraido").css("display", "block");
            $(".back-suraido").stop().animate({opacity:'1'},2000);//1秒かけてコンテンツを表示
        },10000);//約10秒後に
});

    $(function(){
    $("header").css({opacity:'0'});
        setTimeout(function(){
            $("header").css("display", "block");
            $("header").stop().animate({opacity:'1'},1500);//2秒かけてコンテンツを表示
        },1800);//約1.8秒後に
});

$(function(){
    $("footer").css({opacity:'0'});
        setTimeout(function(){
            $("footer").css("display", "block");
            $("footer").stop().animate({opacity:'1'},1500);//2秒かけてコンテンツを表示
        },1800);//約1.8秒後に
});

$(function(){
    $(".ani1-p").css({opacity:'0'});
        setTimeout(function(){
            $(".ani1-p").css("display", "block");
            $(".ani1-p").stop().animate({opacity:'1'},1000);//1秒かけてコンテンツを表示
        },4500);//約4.5秒後に
});

$(function(){
    $(".ani1-p2").css({opacity:'0'});
        setTimeout(function(){
            $(".ani1-p2").css("display", "block");
            $(".ani1-p2").stop().animate({opacity:'1'},1000);//1秒かけてコンテンツを表示
        },6500);//約6.5秒後に
});
















