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

//= require rails-ujs

  //= require jquery
  //= require jquery_ujs
  //= require_tree ../../../app/assets/javascripts/.
  //= require bootstrap-sprockets
  //= require_tree .


$(function() {

  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

 });


$(document).ready(function () {
	$('.jquery').on('click', function(){
		$(this).css('color','red');
	});
});


$(function () {
      setInterval(function () {
        $('.star-1').fadeOut(150).delay(2000).fadeIn(300).fadeOut(150).delay(1254);
        $('.star-2').fadeOut(300).fadeIn(120).fadeOut(120).delay(1920);
        $('.star-3').fadeOut(150).delay(1200).fadeIn(300).fadeOut(150).delay(800);
        $('.star-4').fadeOut(700).fadeIn(300).fadeOut(160).delay(1350);
        $('.star-5').fadeOut(450).delay(1000).fadeIn(360).fadeOut(160).delay(254);
        $('.star-6').fadeOut(800).fadeIn(190).fadeOut(650).delay(1680);
        $('.star-7').fadeOut(450).delay(200).fadeIn(400).fadeOut(290).delay(900);
        $('.star-8').fadeOut(770).fadeIn(450).fadeOut(160).delay(1350);
        $('.star-9').fadeOut(100).delay(105).fadeIn(500).fadeOut(150).delay(700);
        $('.star-10').fadeOut(520).fadeIn(510).fadeOut(360).delay(1350);
      }, 1);
    });

API_KEY = "21bf352314ed4ed72ecc050ee66e8ecd";

$(function(){
  $('#btn').on('click', function() {
    // 入力された都市名でWebAPIに天気情報をリクエスト
    $.ajax({
      url: "http://api.openweathermap.org/data/2.5/weather?q=" + $('#cityname').val() + "&units=metric&appid=" + API_KEY,
      dataType : 'jsonp',

   }).done(function (data){
        //通信成功
         // 位置
        $('#place').text(data.name);
        // 最高気温
        $('#temp_max').text(data.main.temp_max);
        // 最低気温
        $('#temp_min').text(data.main.temp_min);
        //　湿度
        $('#humidity').text(data.main.humidity);
        //　風速
        $('#speed').text(data.wind.speed);
        // 天気
        $('#weather').text(data.weather[0].main);
        // 天気アイコン
    }).fail(function (data) {
       //通信失敗
       alert('通信に失敗しました。');
    });
  });
});

