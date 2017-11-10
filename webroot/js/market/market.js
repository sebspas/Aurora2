var currentPage = "Ship";
var listeShip;
var listeItems;
var money;

function ChargementMarketPage() {
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

	$.ajax({
		url: window.ress.loader + 'load-nom-vaisseaux.php',
		success: function(data) {
			//listeShip = data;
			/*$('.main').append(cortana_dialog('Ici c\'est le marché vous pouvez '
				+ 'y acheter des vaisseaux, cliquez sur le menu items pour'
				+ ' choisir des équipements.'));*/
            // chargement des promos
			chargementPromo(data);
			
		}
	});

    // on charge la frame centrale
    var template = $('#market-general').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template);
    $('.main').append(rendered);
}

function chargementMarketSelection() {
    var template = $('#market-selection').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            Market_npc : window.ress.images + 'market_npc.jpg',
            Market_player : window.ress.images + 'market_player.jpg'
        }
    );

    $('.market-general').append(rendered);
    $('.js-market-npc').click(function() {
        chargementPage('market-npc', 0);
    });
	
}

function chargementPromo(ListeVaisseau) {
    var contentPromo = $('<div>')
        .attr('class', 'col-lg-6 col-md-6')
        .append($('<h1>').attr('class', 'title3 c-white').html('Promotion du jour :'));

    $.ajax({
        url: window.ress.loader + 'load-promo-vaisseau.php',
        success: function(data) {
            listePromo = data;

            for (i = 0; i < listePromo.length; i++) {

                if(-1 != $.inArray(listePromo[i].vaisseau.nom, ListeVaisseau)) {
                    btn_achat_class = "red3";
                    btn_achat = '';
                } else {
                    btn_achat_class = "blue3";
                    btn_achat = 'pop_in_ship(' + listePromo[i].vaisseau.idspaceship + ')';
                }

                var template = $('#vaisseau-promo').html();
                Mustache.parse(template);   // optional, speeds up future uses

                var rendered = Mustache.render(template,
                    {
                        vaisseau_nom : listePromo[i].vaisseau.nom,
                        vaisseau_image : window.ress.vaisseaux + directoryShip(listePromo[i].vaisseau.idfaction) + listePromo[i].vaisseau.image,
                        vaisseau_pv : listePromo[i].vaisseau.pv,
                        vaisseau_defense : listePromo[i].vaisseau.defense + ' DEF',
                        vaisseau_attaque : listePromo[i].vaisseau.attaque + ' ATK',
                        vaisseau_xp : listePromo[i].vaisseau.xp + '/' + listePromo[i].vaisseau.nextlevel + ' Xp',
                        vaisseau_id : listePromo[i].vaisseau.idspaceship,
						vaisseau_prix: listePromo[i].vaisseau.prix,
						vaisseau_prix_reduit : listePromo[i].vaisseau.prix- (listePromo[i].vaisseau.prix/100 * listePromo[i].reduction),
						vaisseau_reduction : listePromo[i].reduction,
                        vaisseau_button : 'btn2 right ' + btn_achat_class,
                        vaisseau_click : btn_achat
                    }
                );

                contentPromo.append(rendered);
            }

            $('.market-general').append(contentPromo);
            // chargement du marché
            chargementMarketSelection();
        }
    });
}

function menuMarket() {
	/*return $('<div>')
		.attr({
			'class': 'layout-left t-black',
			'id': 'm-market'
		})
		.append(
			$('<div>')
			.attr('class', 'menu-market')
			.append(
				$('<a>')
				.attr({
					class: 'btn4 center blue3 js-ship',
					href: '#'
				})
				.html('Vaisseau')
				.click(function(event) {
					market_swap_content("js-ship");
				}),
				$('<div>')
				.attr({
					'class': 'line00',
					id: 'ship-option'
				})
				.append(
					$('<p>')
					.attr('class', 'c-white')
					.html('Mes options pour le choix des vaisseaux ici')),
				$('<a>')
				.attr({
					class: 'btn4 center blue3 js-items',
					href: '#'
				})
				.click(function(event) {
					market_swap_content("js-items");
				})
				.html('Equipement'),
				$('<div>')
				.attr({
					'class': 'line00',
					id: 'item-option'
				})
				.append(
					$('<p>')
					.attr('class', 'c-white')
					.html('Mes options pour le choix des items ici'))));*/
}

function market_swap_content(button) {
	if (button === "js-ship" && currentPage != "Ship") {
		currentPage = "Ship";

		$('.main').fadeOut(500, function() {
			$(this).empty();
			/*$('.main').append(cortana_dialog('Ici c\'est le marché vous pouvez'
				+ 'y acheter des vaisseaux, cliquez sur le menu items pour'
				+ 'choisir des équipements.'));*/
			chargement_ship(listeShip);
			$('.main').fadeIn(500);
		});


		// Animation du menu
		$('#item-option').animate({
			height: "0"
		}, 500, function() {
			$('#ship-option').animate({
				height: "+=100"
			}, 500);
		});
	} else if (button === "js-items" && currentPage != "Items") {
		currentPage = "Items";

		$('.main').fadeOut(500, function() {
			$(this).empty();
			/*$('.main').append(cortana_dialog('Ici c\'est le marché vous'
				+ ' pouvez y acheter des équipements, cliquez sur'
				+ 'le menu vaisseau pour choisir des vaisseaux.'));*/
			chargement_item(listeItems);
			$('.main').fadeIn(500);
		});

		// Animation du menu
		$('#ship-option').animate({
			height: "0"
		}, 500, function() {
			$('#item-option').animate({
				height: "+=100"
			}, 500);
		});
	} else {
		return;
	}

};

