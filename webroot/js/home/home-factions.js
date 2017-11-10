/**
 * Created by sebsp on 03/02/2016.
 */

function chargementSelecteurFactions() {
    // chargement du selecteur de faction
    $.ajax({
        url: window.ress.loader + 'load-factions.php',
        success: function(data) {
            home_factions(data);
        }
    });
}

function home_factions(listeFaction) {
    /*cortana_text('Bienvenue sur Aurora !'
        + ' Avant de pouvoir commencer l\'aventure merci de'
        + ' choisir votre faction.');*/
    var fullframe = $('<div>')
                        .attr('class', 'fullframe');
    for (var i = 0; i < listeFaction.length; i++) {
        fullframe.append(
                    faction(listeFaction[i]));
    }
    $('.main').append(fullframe);
}
function faction(faction) {

    var template = $('#faction-starter').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            faction_nom : faction.nom,
            faction_image : window.ress.faction + faction.image,
            faction_desc : faction.desc,
            faction_id : faction.idfaction
        }
    );
    return rendered;
}

function select_faction(idFaction) {

    $.ajax({
        type: 'GET',
        url: window.ress.traitement + 'selectFaction.php',
        data: {
            idfaction : idFaction
        },
        success: function(data) {
            // On vide la div principale :)
            $('.main').fadeOut(500, function() {
                $(this).empty();
                // on remet le menu
                $('.menu').show();

                // on recupere la page home par défaut
                chargementSelecteurVaisseaux();
                $('.main').fadeIn(500);
            });
        }
    });
}