$('.loader-content').center();
function disparitionChargement() {
    $('#img-loader').delay(500).velocity({ opacity: 0.0 });
    $('.loader h2').delay(500).velocity({opacity: 0.0});
    $('#left').delay(700).velocity({ translateX: "-=1000px", opacity: 0.1 }, 800);
    $('#right').delay(700).velocity({ translateX: "+=1000px", opacity: 0.1 }, 800);
    $('.loader').delay(1200).velocity({ opacity: 0 }, { visibility: "hidden" });
}

function apparitionChargement() {
    $('.loader').velocity({ opacity: 1 }, { visibility: "visible" });
    $('#left').velocity({ translateX: "+=1000px", opacity: 1 }, 700);
    $('#right').velocity({ translateX: "-=1000px", opacity: 1 }, 700);
    $('#img-loader').velocity({ opacity: 1.0 });
    $('.loader h2').velocity({opacity: 1.0});
}
$(window).load(function() {
    disparitionChargement();
});

