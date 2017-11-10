/**
 * Created by sebsp on 30/01/2016.
 */

/*****************************************************
 Gestion du chargement du combat
 *****************************************************/
// Variable pour préparer la phase de combat
var ListeMissionsContent = new Array();
var selected_mission;
var selected_ship;
selected_equipement1 = null;
selected_equipement2 = null;

function launch_mission_click(mission_id) {
    var mission = ListeMissionsContent[mission_id];

    $.ajax({
        url: window.ress.loader + 'load-ressources-j.php',
        success: function(data) {
            energy = data.topaz;
            $('.js-topaz').html(energy);

            if (energy - mission.ress.energie >= 0) {
                // rajouter le changement de couleur au clique

                selected_mission = mission;
                // chargement selecteur vaisseau et equipement
                chargementSelecteurVaisseau();
            }  else {
                alert('Vous n\'avez pas assez d\'énergie :\'(');
            }
        }
    });


}

function ListeMissions(planeteid) {

    $.ajax({
        url: window.ress.loader + 'load-list-missions-planet.php',
        data: {
          idplanet : planeteid
        },
        success: function(data) {
            var ListeMissionsVal = data;

            // C'était tellement dur .....
            //alert(ListeMissionsVal[0].ress.aqua);

            // on vire l'ancien content
            $('.home-planet-content-old').remove();

            var content = $('<div>')
                .attr('class', 'panel panel-default home-planet-content-new');
            var content2 = $('<div>');
            // je met le nouveau content
            if (ListeMissionsVal == 0) {
                content.append($('<p>').html('Pas de missions disponible ici !'));
            } else {
                for (var i = 0; i < ListeMissionsVal.length; i++) {
                    content2.append(
                        Mission(ListeMissionsVal[i]));
                }
            }

            content.append(
                $('<div>')
                    .attr('class', 'panel-heading')
                    .html('<h2>Missions</h2>'),
                $('<div>')
                    .attr('class', 'panel-body')
                    .append(content2,
                        $('<a>')
                            .attr('class', 'btn2 blue2 left')
                            .html('Retour')
                            .click( function() {
                                home_map_selecteur(planeteid);
                            }))

            );

            $('.home-map-selecteur').append(content);
            // le nouveau deviens le vieux
            $('.home-planet-content-new').attr('class', 'panel panel-default home-planet-content-old');
        }
    });

}

function Mission(mission) {
    ListeMissionsContent[mission.idmission] = mission;

    var template = $('#mission').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            mission_level :  + mission.niveau,
            mission_nom : mission.nom,
            mission_energy : mission.ress.energie,
            mission_aqua : mission.ress.aqua,
            mission_emerald : mission.ress.emerald,
            mission_ruby : mission.ress.ruby,
            mission_topaz : mission.ress.topaz,
            mission_or : mission.ress.money,
            mission_xp : mission.ress.xp,
            mission_launch : mission.idmission
        }
    );
    return rendered;
}

function launch(mission_id) {
    var mission = ListeMissionsContent[mission_id];

    if (window.missionLaunch) {
        return;
    } else {
        window.missionLaunch = true;
        // Gestion lancement mission
        $('.main').append(LancementMission(mission));
        $('.js-to-menu-box').removeClass('icon-menu');
        $('.js-to-menu-box').addClass('icon-cancel');
        $('.js-center').center();
    }
}

function LancementMission(mission) {

    var template = $('#mission_lancement').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            mission_image : window.ress.mission + mission.image,
            mission_desc : mission.desc,
            mission_level :  + mission.niveau,
            mission_nom : mission.nom,
            mission_energy : mission.ress.energie,
            mission_aqua : mission.ress.aqua,
            mission_emerald : mission.ress.emerald,
            mission_ruby : mission.ress.ruby,
            mission_topaz : mission.ress.topaz,
            mission_or : mission.ress.money,
            mission_xp : mission.ress.xp,
            mission_bouton : mission.idmission
        }
    );

    return rendered;
}