/**
 * Created by sebsp on 30/01/2016.
 */

function chargementSelecteurVaisseaux() {
    // chargement du selecteur du premier vaisseau
    $.ajax({
        url: window.ress.loader + 'load-starter.php',
        success: function(data) {
            home_starter(data);
        }
    });
}

function home_starter(listeVaisseau) {
    cortana_text('Bienvenue sur Aurora !'
        + ' Avant de pouvoir commencer l\'aventure merci de'
        + ' choisir votre premier vaisseau :)');
    for (var i = 0; i < listeVaisseau.length; i++) {
        $('.main').append(
            starter_Vaisseau(listeVaisseau[i]));
        $('.main').append(
            $('<div>')
                .attr('class', 'g1'));
    }
}

function select_starter(idSpaceShip) {

    $.ajax({
        type: 'GET',
        url: window.ress.traitement + 'addShip.php',
        data: {
            idship: idSpaceShip
        },
        success: function(data) {
            // On vide la div principale :)
            $('.main').fadeOut(500, function() {
                $(this).empty();
                //on ajoute la boite de dialog cortana
                cortana_text('Bien vous'
                + ' progresser ! C\'est votre page '
                + 'd\'accueil vous pourrez partir'
                + ' en mission d\'ici');
                // on recupere la page home par défaut
                chargementHomepage();
                $('.main').fadeIn(500);
            });
        }
    });
}
function starter_Vaisseau(vaisseau) {

    var template = $('#vaisseau-starter').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            nom_vaisseau : vaisseau.nom,
            vaisseau_image : window.ress.vaisseaux + directoryShip(vaisseau.idfaction) + vaisseau.image,
            vaisseau_pv : vaisseau.pv,
            vaisseau_defense : vaisseau.defense + ' DEF',
            vaisseau_attaque : vaisseau.attaque + ' ATK',
            vaisseau_xp : vaisseau.xp + '/' + vaisseau.nextlevel + ' Xp',
            vaisseau_id : vaisseau.idspaceship
        }
    );
    return rendered;
}