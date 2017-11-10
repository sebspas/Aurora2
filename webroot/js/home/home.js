var energy = 0;

function directoryShip(idfaction) {
    if (idfaction == 1) {
        return 'Alien/';
    } else if(idfaction == 2) {
        return 'Pirate/';
    } else {
        return 'Federation/';
    }
}
function ChargementHomePage() {
    // On charge les scripts correspondant
    // page home
    $.getScript(window.ress.JS + "home/home-mission.js");
    $.getScript(window.ress.JS + "home/home-starter.js");
    $.getScript(window.ress.JS + "home/home-factions.js");

    // lancement
    $.getScript(window.ress.JS + "launch/launch-vaisseau.js");
    $.getScript(window.ress.JS + "launch/launch-items.js");

	$.ajax({
		url: window.ress.loader + 'load-ressources-j.php',
		success: function(data) {
			ressources = data;
			$('.js-aqua').html(ressources.aqua);
            $('.js-emerald').html(ressources.emerald);
            $('.js-ruby').html(ressources.ruby);
            $('.js-topaz').html(ressources.topaz);
            $('.js-money').html(ressources.money);
			//$('.js-energie').html(energy + ' %');
		}
	});

	$.ajax({
		url: window.ress.check + 'check-fisrt.php',
		success: function(data) {
			if (data == 0) {
                // on vire le menu le temps de choisir
                $('.menu').hide();

				// selection de la faction
				chargementSelecteurFactions();

			} else if (data == 1) {

                // selection du vaisseau
                chargementSelecteurVaisseaux();
            } else {
				// chargement de la page home habituel
				//$('.main').append(cortana_dialog('Bon retour parmis nous voyageur !........'));
				chargementHomepage();
			}
		}
	});
}



function chargementHomepage() {

    var map = home_map();

    $('.main').append(map);
    // initialisation du tableau
    var tab_map = "";
    for (i =0; i < 11; i++) {
        tab_map +=  "<tr >";
        for (j =0; j < 11; j++) {
            tab_map +=" <td id='td-map-" + i + j + "' /td>";
        }
    }

    $('.planets-map').append(tab_map);

    // récupération est ajouts de toutes les plan étes
	$.ajax({
		url: window.ress.loader + 'load-planetes.php',
		success: function(data) {
			var listPlanetes = data;
			var planets;

			for(i = 0; i < listPlanetes.length; i++) {
				planets = planet_on_map(listPlanetes[i]);
				$('#td-map-' + listPlanetes[i].pos_x + listPlanetes[i].pos_y).append(planets);

			}

            // on charge le cadre de selection de la planet
            var template = $('#home-map-selecteur').html();
            Mustache.parse(template);   // optional, speeds up future uses
            $('.main').append(Mustache.render(template));


            // Peut-etre faire un curseur autour de la planete choisit
            // On cible comme planete le soleil
            home_map_selecteur(3);

		}
	});

}

function home_map() {

    var template = $('#home-map').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template);

    return rendered;
}

function home_map_selecteur(planet_id) {
    $.ajax({
        url: window.ress.loader + 'load-planet.php',
        data: {
          idplanet : planet_id
        },
        success: function(data) {

            var planet = data;
            var template = $('#home-map-selecteur-content').html();
            Mustache.parse(template);   // optional, speeds up future uses
            var rendered = Mustache.render(template,
                {
                    Planete_nom : planet.planete_nom,
                    Planete_image : window.ress.images + 'planets/' + planet.image,
                    Planete_desc : planet.desc,
                    Planete_class : "panel panel-default home-planet-content-new",
                    Planete_id : planet.idplanet
                }
            );
            // on vire l'ancien content
            $('.home-planet-content-old').remove();
            // je met le nouveau
            $('.home-map-selecteur').append(rendered);
            // le nouveau deviens le vieux
            $('.home-planet-content-new').attr('class', ' panel panel-default home-planet-content-old');


            $('.texte-planete').mCustomScrollbar({
                axis: "y",
                theme:"light-2"
            });
        }
    });
}


function planet_on_map(planet)  {
    var template = $('#planet-on-map').html();
    Mustache.parse(template);   // optional, speeds up future uses

    var message = '';
    if (planet.new) {
        message = 'New Mission';
    }
    var rendered = Mustache.render(template,
        {
            Planete_image : window.ress.images + 'planets/' + planet.image,
            Planete_id : planet.idplanet,
            Planete_msg : message
        }
    );

    return rendered;
}

function home_ship(vaisseau) {

	var template = $('#vaisseau-home').html();
	Mustache.parse(template);   // optional, speeds up future uses
	var rendered = Mustache.render(template,
		{
            nom_vaisseau : vaisseau.nom + '- Niv ' + vaisseau.level,
			vaisseau_image : window.ress.vaisseaux + vaisseau.image,
			vaisseau_pv : vaisseau.pv,
            vaisseau_defense : vaisseau.defense + ' DEF',
            vaisseau_attaque : vaisseau.attaque + ' ATK',
            vaisseau_xp : vaisseau.xp + '/' + vaisseau.nextlevel + ' Xp'
		}
	);
	$('.main').html(rendered);
} // home_ship()
