function chargementCombat() {
    // on charge l'interface de combat
    chargementCombatUI();

    // on crée les infos dans la base de données
    creationCombatBD();



    // on fait disparaitre lécran de chargement
    disparitionChargement();
}

function chargementCombatUI() {
    // on vide le main
    $('#main').empty();
    // on vire le menu le temps du combat
    $('.menu').hide();

    // on change le fond par celui correspondant à la planéte de la mission
    $.ajax({
        url: window.ress.loader + 'load-planet.php',
        data :{
          idplanet: selected_mission.idplanet
        },
        success: function(data) {
            // fond de la mission
            $('#main').append(
                $('<div>')
                    .attr({
                        'class': 'bg',
                        id: 'bg-combat'
                    }),
                $('<div>')
                    .attr({
                        'class': 'bg',
                        id: 'bg-planet'
                    })
            );
            $('#bg-planet').css('backgroundImage', 'url(./webroot/images/planets/' + data.image + ')');
        }
    });

    // on charge le template de la page combat
    var template = $('#page-combat').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template);

    $('#main').append(rendered);

    $('.scroll-bar').mCustomScrollbar({
        axis: "y",
        theme:"light-2"
    });

}
var tabCartesJoueur;
var cptCartesJoueur = 0;
var tabCartesIA;
var cptCartesIA = 0;


function creationCombatBD() {

    /* données renseigné
        selected_mission
        selected_ship
        selected_equipement1
        selected_equipement1
    */

    $.ajax({
        url: window.ress.traitement + 'init-combat.php',
        data :{
            idmission : selected_mission.idmission,
            vaisseau : selected_ship
        },
        success: function(data) {
            // on charge les infos des vaisseau et on actualise l'affichage
            refreshShip();

            var tmp = JSON.parse(data);
            tabCartesJoueur = tmp.tabCartesJoueur;
            tabCartesIA = tmp.tabCartesIA;

            // piocher 3 carte
            piocher(0);
            piocher(0);
            piocher(0);
            piocher(0);
            addMessageEcranCombat("Fin pioche Joueur1.", 'c-green2');
            // IA pioche
            piocher(1);
            piocher(1);
            piocher(1);
            piocher(1);


        }
    });
}

function piocher(joueur) {
    if (joueur == 0) {
        // alors c'est le joueur qui pioche
        cptCartesJoueur++;
        // on met a jour la carte courante dans le deck et
        // le nbr de carte et la main, on recupère la carte
        $.ajax({
            url: window.ress.traitement + 'piocher-carte.php',
            data :{
                idcarte : tabCartesJoueur[cptCartesJoueur],
                nbCarteCourante : cptCartesJoueur,
                idmission : selected_mission.idmission,
                typePlayer : 0 // joueur
            },
            success: function(data) {

                var tmp = JSON.parse(data);

                // on ajoute la carte graphiquement
                $('.js-block-carte-J').append(carteCombat(tmp));

                // on met a jour l'affichage du deck

            }
        });

    } else {
        // alors c'est le joueur qui pioche
        cptCartesIA++;
        // on met a jour la carte courante dans le deck et
        // le nbr de carte et la main, on recupère la carte
        $.ajax({
            url: window.ress.traitement + 'piocher-carte.php',
            data :{
                idcarte : tabCartesIA[cptCartesIA],
                nbCarteCourante : cptCartesJoueur,
                idmission : selected_mission.idmission,
                typePlayer : 1 // IA
            },
            success: function(data) {

                var tmp = JSON.parse(data);

                // on ajoute la carte graphiquement, dos de carte uniquement

                $('.js-block-carte-I').append(carteCombatDos());

                // on met a jour l'affichage du deck

            }
        });
    }

}

function refreshShip() {
    var shipJoueur;
    var shipIA;
    $.ajax({
        url: window.ress.refresh + 'refresh-combat.php',
        data :{
            idmission : selected_mission.idmission
        },
        success: function(data) {
            ships = JSON.parse(data);

            shipJoueur = ships.Joueur;
            shipIA = ships.IA;

            // on actualise le joueur
            $('.js-nom-j').html(shipJoueur.nom);
            $('.js-pv-j').html(shipJoueur.pv);
            $('.js-def-j').html(shipJoueur.defense);
            $('.js-att-j').html(shipJoueur.attaque);
            $('.js-shield-j').html(shipJoueur.bouclier);
            $('.js-image-j').attr('src', window.ress.vaisseaux + directoryShip(shipJoueur.idfaction) + shipJoueur.image);

            // on actualise l'IA
            $('.js-nom-I').html(shipIA.nom);
            $('.js-pv-I').html(shipIA.pv);
            $('.js-def-I').html(shipIA.defense);
            $('.js-att-I').html(shipIA.attaque);
            $('.js-shield-I').html(shipIA.bouclier);
            $('.js-image-I').attr('src', window.ress.vaisseaux + directoryShip(shipIA.idfaction) + shipIA.image);
        }
    });
}

function carteCombatDos() {
    var template = $('#combat-card-dos').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            card_class : 'card-combat card-dos'
        }
    );

    return rendered;
}

function carteCombat(carte) {

    var classe = '';
    if (carte.type == 1) {
        classe = 'card-combat card-attack';
    } else if (carte.type == 2) {
        classe = 'card-combat card-defense';
    } else {
        classe = 'card-combat card-speciale';
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
    var template = $('#combat-card').html();
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


    return rendered;

}

function addMessageEcranCombat(msg, couleur) {
    $('.ecran-block-text').append(
        $('<p>')
            .attr('class', couleur)
            .html(msg)

    );
}