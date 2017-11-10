/**
 * Created by sebsp on 30/01/2016.
 */

var listeShip;
var currentId = 0;

function chargementSelecteurVaisseau() {
    $.ajax({
        url: window.ress.loader + 'load-hangar-ship.php',
        success: function(data) {
            listeShip = data;
            var content =  '';
            for ( i = 0; i < listeShip.length; i++) {
                content += vaisseau_mission(listeShip[i], i);
            }
            $('.js-frame-m').fadeOut(400, function() {
                $(this).empty();
                var template = $('#vaisseau-selection-mission-container').html();
                Mustache.parse(template);   // optional, speeds up future uses
                var rendered = Mustache.render(template);

                $('.js-frame-m').append(rendered);
                $('.frame-vaisseau-selection') .append(content);
                $('.frame-vaisseau-selection').mCustomScrollbar({
                    axis: "y",
                    theme:"light-2"
                });
            });


            $('.js-frame-m').fadeIn();

        }
    });
}

function selection_vaisseau_mission(currentId) {
    selected_ship = listeShip[currentId];
    //chargement du choix de l'équipement du vaisseau
    chargementSelecteurEquipement();
}
function vaisseau_mission(vaisseau, idTabVaisseau) {

    var template = $('#vaisseau-selection-mission').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            nom_vaisseau : vaisseau.nom + '- Niv ' + vaisseau.level,
            vaisseau_image : window.ress.vaisseaux + directoryShip(vaisseau.idfaction) + vaisseau.image,
            vaisseau_pv : vaisseau.pv,
            vaisseau_defense : vaisseau.defense + ' DEF',
            vaisseau_attaque : vaisseau.attaque + ' ATK',
            vaisseau_xp : vaisseau.xp + '/' + vaisseau.nextlevel + ' Xp',
            vaisseau_id: idTabVaisseau
        }
    );

    return rendered;

}
