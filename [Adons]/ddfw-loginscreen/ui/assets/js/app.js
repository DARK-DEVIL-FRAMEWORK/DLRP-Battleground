
window.addEventListener('DOMContentLoaded', () => {
    if(window.nuiHandoverData.umloginscreen == "steam"){
        let getJson = JSON.parse(window.nuiHandoverData.json).response.players[0];
        $(".steamid").html(getJson.personaname);
        $(".steamimg").attr("src",getJson.avatarfull);
    }
});
// DDFW-General Settings //
if (DDFWLoadingScreen.AutoSnow) {
    $('#snow').show()
} else {
    $('#snow').hide()
}
  $('#stage').hide()
  var pointer = $('#cursor');
  $(document).on('mousemove', function (event) {
    pointer.css({
      top: event.pageY + 'px',
      left: event.pageX + 'px'
    });
  });
  
$.get(DDFWLoadingScreen.GithubRawUrl, function (data){$(".updatesinfo p").html(data);})
$.getJSON("https://api.ipify.org/?format=json", function(e) {$(".characterinfo p.userip").html('IP Address: '+e.ip);});
    $('body').css("background-image", "url(assets/img/bg/"+DDFWLoadingScreen.BackgroundImage+")");
    $(".background").css('background',DDFWLoadingScreen.TemplateColorHex);
    $(".logo img").attr("src","assets/img/"+DDFWLoadingScreen.Logo);
    $("audio").attr("src","assets/audio/"+DDFWLoadingScreen.Music);
    // DDFW-Lang Settings //
    $("span.welcometext").html(DDFWLoadingScreen.Text1);
    $("span.newuptext").html(DDFWLoadingScreen.Text2);
    $("h2.servernameh2").html(DDFWLoadingScreen.ServerName);
    $("p.copyright").html(DDFWLoadingScreen.Text3);

    // DDFW-Icon Settings //
    var myAudio = document.getElementById("music");    
    myAudio.volume = DDFWLoadingScreen.MusicVolume;
    var play = false
    var logo = false
    $(".fa-volume-up").click(function(){
        if (play) {
            $("#volumeup i").attr("class","fas fa-volume-mute background");
            myAudio.pause();
            play = false;
        } else {
            $("#volumeup i").attr("class","fas fa-volume-up background");
            myAudio.play();
            play = true;
        }
    });
    $(".fa-gamepad").click(function(){
        $("#stage").toggle("slow");
        if (logo == false) {
            $('.logo').hide();
            logo = true
        } else {
            $('.logo').show();
            logo = false
        }
    });
    $(".fa-snowflake").click(function(){
        $("#snow").toggle();
    });

    function RandomBackground() {
        var images  = DDFWLoadingScreen.RandomBackgroundImg
        var randomImage  = Math.floor((Math.random() * images.length) );
        $("body").css("background-image", "url('assets/img/bg/" + images[randomImage] + "')");
        }

    if (DDFWLoadingScreen.RandomBackground) {
    setInterval(RandomBackground, 3 * 1000);
    }
