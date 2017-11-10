function chargementPage(pageVar, first) {
    $('.bg').attr('id', 'bg-' + pageVar);
    if (page != pageVar || first) {
        $('.main').fadeOut(0, function() {
            $(this).empty();
            if (pageVar == 'home') {
                ChargementHomePage();
            } else if (pageVar == 'market') {
                ChargementMarketPage();
            } else if (pageVar == 'profil') {
                ChargementProfilPage();
            } else if(pageVar == 'market-npc') {
                ChargementMarketNpc();
            } else if(pageVar == 'bib') {
                ChargementBibPage();
            } else {
                ChargementHangarPage();
            }
            $('.menu-box').fadeOut();
            $('.js-to-menu-box').removeClass('icon-cancel');
            $('.js-to-menu-box').addClass('icon-menu');
            $('.main').fadeIn(400);
            page = pageVar;
        });
    } else {
        $('.menu-box').fadeOut();
        $('.js-to-menu-box').removeClass('icon-cancel');
        $('.js-to-menu-box').addClass('icon-menu');
    }
    localStorage.setItem('page', page);
}

function addAlert(titre, msg, type) {
    $('.alert-msg').empty();
    $('.alert-msg').append(
        $('<div>')
            .attr('class', 'alert alert-' + type)
            .append(
                $('<h2>')
                    .attr('class', '')
                    .html(titre),
                msg,
                $('<a>')
                    .attr('class', 'close')
                    .html('Close')
                    .click(function() {
                        $(this).fadeOut(400, function() {
                            $('.alert-msg').empty();
                        });
                    })
            )

    );
}

$(document).ready(function() {

	// Variable de chemin global
    var CORE = 'app/core/';
    var IMG = 'webroot/images/';
    var VAISSEAUX = IMG + 'vaisseaux/';
	var JS = 'webroot/js/';

	ress = {
		images: IMG,
        traitement : CORE + 'traitement/',
		loader: CORE + 'loader/',
        refresh: CORE + 'refresh/',
        achat: CORE + 'achat/',
        check: CORE + 'check/',
		vaisseaux: IMG + 'vaisseaux/',
		ennemies: VAISSEAUX + '/bad/',
		model: 'app/content/model/',
		items: IMG + 'items/',
		profils: IMG + 'avatar/',
		mission: IMG + 'missions/',
		faction: IMG + 'factions/',
        JS : JS,
        cards : IMG + 'cartes/'
	};
    // on met le bon avatar
    $.ajax({
        url: window.ress.loader + 'load-profil.php',
        success: function(data) {
            var user = data;
            $('#menu-avatar').css('backgroundImage', 'url(' + user.avatar + ')');
            $('#menu-avatar').css('backgroundPosition', 'center');
            $('#menu-avatar').css('backgroundSize', 'cover');
        }
    });
    // *****************************************************************
    /*
     I I I I IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
     vvvvvvv ATTENTION C'est important ici vvvvv
     */
    // boolean pour le chargement et le changement de page
    // par défaut on est sur la page home
    page = localStorage.getItem('page');
    if (page == null) {
        page = 'home';
    }
    localStorage.setItem('page', page);
    chargementPage(page, 1);

	missionLaunch = false;

    /*******************************************************
     *			Gestion du menu
     * ******************************************************/
    $('.js-home').click(function() {
        chargementPage('home',0);
    });
    $('.js-market').click(function() {
        chargementPage('market',0);
    });
    $('.js-profil').click(function() {
        chargementPage('profil',0);
    });
    $('.js-hangar').click(function() {
        chargementPage('hangar', 0);
    });
	$('.js-bib').click(function() {
		chargementPage('bib', 0);
	});
	$('.icon-logout').click(function() {
		page = 'login';
        localStorage.setItem('page', page);
	});


	$(window).resize(function() {
		$('.js-center').center();
	});

	$(this).scrollT();

	$('#login-box')
		.animate({
			'opacity': '1',
			'margin-top': '15%'
		}, 800);

	$('.js-to-signup').click(function() {
		if ($('.login-form').is(':visible')) {
			$('.login-form').fadeOut(
				function() {
					$('.signup-form').fadeIn();
				}
			);
		} else {
			$('.forgot-form').fadeOut(
				function() {
					$('.signup-form').fadeIn();
				}
			);
		}

		$( "#pseudo1" ).parent().addClass('is-focused has-label');
	});


	$('.js-to-login').click(function() {
		if ($('.signup-form').is(':visible')) {
			$('.signup-form').fadeOut(
				function() {
					$('.login-form').fadeIn();
				}
			);
		} else {
			$('.forgot-form').fadeOut(
				function() {
					$('.login-form').fadeIn();
				}
			);
		}

		$( "#pseudo" ).parent().addClass('is-focused has-label');
	});

	$('.js-to-forgot').click(function() {
		if ($('.signup-form').is(':visible')) {
			$('.signup-form').fadeOut(
				function() {
					$('.forgot-form').fadeIn();
				}
			);
		} else {
			$('.login-form').fadeOut(
				function() {
					$('.forgot-form').fadeIn();
				}
			);
		}

		$( "#email3" ).parent().addClass('is-focused has-label');
	});

	/* FORM */

	$( "#pseudo" ).parent().addClass('is-focused has-label');

	$('.field-input').focus(function() {
		$(this).parent().addClass('is-focused has-label');
	});

	$('.field-input').blur(function() {
		$parent = $(this).parent();

		if ($(this).val() == '') {
			$parent.removeClass('has-label');
			$parent.removeClass('is-focused');
		} else
			$(this).addClass('is-full');

		$parent.removeClass('is-focused');
	});


	/********************************************
	 *
	 *  			KONAMI CODE
	 *
	 *
	 ********************************************/
	//Haut, haut, bas, bas, gauche, droite, gauche, droite, B, A
	var k = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65],
		n = 0;
	$(document).keydown(function (e) {
		if (e.keyCode === k[n++]) {
			if (n === k.length) {

				$('.main').append(
					$('<img>').attr({
						class: "fullframe",
						src : window.ress.images + 'Unicorn.gif',
						alt : 'unicorn'
					})
				);

				n = 0;
				return false;
			}
		}
		else {
			n = 0;
		}
	});

}); // ready()