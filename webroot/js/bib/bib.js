/**
 * Created by sebsp on 12/03/2016.
 */

function ChargementBibPage() {
    $.ajax({
        url: window.ress.loader + 'load-cartes.php',
        success: function(data) {
            cartes = data;
            // on charge la frame centrale
            var template = $('#bib-general').html();
            Mustache.parse(template);   // optional, speeds up future uses
            var rendered = Mustache.render(template);
            $('.main').append(rendered);

            for (var i = cartes.length - 1; i >= 0; i--) {
               CardFrame(cartes[i]);
            };

        }
    });


}

function CardFrame(carte) {

    var classe = '';
    if (carte.type == 1) {
        classe = 'card card-attack';
    } else if (carte.type == 2) {
        classe = 'card card-defense';
    } else {
        classe = 'card card-speciale';
    }

    var icon_class = '';
    if (carte.type == 1) {
        icon_class = "icon icon-attaque";
    } else if (carte.type == 2) {
        if (carte.effet == 1 || carte.effet == 2) {
            // regen hp
            icon_class = "icon icon-pv";
        } else  {
            // regen shield
            icon_class = "icon icon-bouclier";
        }
    } else {
        if (carte.effet == 3 || carte.effet == 4 ||carte.effet == 1 ||carte.effet == 6) {
            // IEM ou sabotage ou breche ou destruction armes

            carte.valeur = '';
        } else {

        }

    }

    var card_faction = '';
    if (carte.idfaction == 1) {
        card_faction = 'alien.png';
    } else if (carte.idfaction == 2) {
        card_faction = 'pirate.png';
    } else {
        card_faction = 'federation.png';
    }
    var template = $('#bib-card').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            card_level : carte.level,
            card_nom : carte.nom + ' - N°' + carte.num,
            card_image : window.ress.cards + carte.image,
            card_class : classe,
            card_desc : carte.desc,
            card_icon_value : icon_class,
            card_value : carte.valeur,
            card_duree : carte.duree + ' tour(s)',
            card_faction : window.ress.faction + card_faction
        }
    );


    $('.bib-general').append(rendered);

}