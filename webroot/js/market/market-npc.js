function ChargementMarketNpc() {
    $.ajax({
        url: window.ress.loader + 'load-ressources-j.php',
        success: function(data) {
            ressources = data;
            money = ressources.money;

            $('.js-aqua').html(ressources.aqua);
            $('.js-emerald').html(ressources.emerald);
            $('.js-ruby').html(ressources.ruby);
            $('.js-topaz').html(ressources.topaz);
            $('.js-money').html(ressources.money);
        }
    });
    var template = $('#market-general').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template);
    $('.main').append(rendered);


    chargement_ship();

    // ajout menu-market
    chargementMarketMenuNPC();
}

function chargementMarketMenuNPC() {
    var template = $('#market-menu-npc').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            Market_ship : window.ress.images + 'market_npc.jpg',
            Market_item : window.ress.images + 'market_player.jpg'
        }
    );

    $('.market-general').append(rendered);
    $('.js-ship').click(function() {
        $('.market-general').empty();
        chargementMarketMenuNPC();
        chargement_ship();
    }) ;
    $('.js-items').click(function() {
        $('.market-general').empty();
        chargementMarketMenuNPC();
        chargement_item();
    })
    $('.js-market-npc').click(function() {
        chargementPage('market', 0);
    });
}