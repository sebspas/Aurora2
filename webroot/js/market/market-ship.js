/**
 * Created by sebsp on 30/01/2016.
 */
function achat_vaisseau(idspaceship) {
    $.ajax({
        url: window.ress.loader + 'load-ressources-j.php',
        success: function(data) {
            money = data.money;
            $.ajax({
                url: window.ress.loader + 'load-spaceship.php',
                data: {
                    idspaceship : idspaceship
                },
                success: function(data) {
                    prix = data.prix;
                    if (money - prix >= 0) {
                        $.ajax({
                            url: window.ress.achat + 'achat-market-ship.php',
                            data: {
                                idship: idspaceship,
                                money: money
                            },
                            success: function(data) {
                                money = data;
                                $('.js-money').html(money);
                                alert('Achat effectué avec succés :D');
                                $('.js-to-menu-box').removeClass('icon-cancel');
                                $('.js-to-menu-box').addClass('icon-menu');
                                $('.fullframe').fadeOut(500, function() {
                                    $(this).empty();
                                });
                                $('.main').fadeOut(500, function() {
                                    $(this).empty();
                                    ChargementMarketPage();
                                    $('.main').fadeIn(500);
                                });
                            }
                        })
                    } else {
                        alert('Vous n\'avez pas assez d\'argent :\'(');
                    }
                }
            });
        }
    });
}

function pop_in_ship(idspaceship) {
    var vaisseau;
    $.ajax({
        url: window.ress.loader + 'load-spaceship.php',
        data: {
            idspaceship: idspaceship
        },
        success: function (data) {
            vaisseau = data;
            var template = $('#achat_vaisseau').html();
            Mustache.parse(template);   // optional, speeds up future uses
            var rendered = Mustache.render(template,
                {
                    vaisseau_nom : vaisseau.nom,
                    vaisseau_image : window.ress.vaisseaux + vaisseau.image,
                    vaisseau_desc : vaisseau.desc,
                    vaisseau_pv : vaisseau.pv,
                    vaisseau_defense : vaisseau.defense + ' DEF',
                    vaisseau_attaque : vaisseau.attaque + ' ATK',
                    vaisseau_xp : vaisseau.xp + '/' + vaisseau.nextlevel + ' Xp',
                    vaisseau_id : vaisseau.idspaceship
                }
            );

            $('.main').append(rendered);
            $('.js-to-menu-box').removeClass('icon-menu');
            $('.js-to-menu-box').addClass('icon-cancel');
            $('.js-center').center();
        }
    });
}

function chargement_ship() {
    $.ajax({
        url: window.ress.loader + 'load-market-ship.php',
        success: function(data) {
            ListeVaisseau = data;
            /*$('.main').append(cortana_dialog('Ici c\'est le marché vous pouvez '
             + 'y acheter des vaisseaux, cliquez sur le menu items pour'
             + ' choisir des équipements.'));*/
            // chargement des promos
            $.ajax({
                url: window.ress.loader + 'load-nom-vaisseaux.php',
                success: function(data) {
                    var cols = $('<div>').attr('class', 'col-lg-10');
                    for (var i = ListeVaisseau.length - 1; i >= 0; i--) {
                        if (-1 == $.inArray(ListeVaisseau[i].nom, data)) {
                            cols.append(sell_ship(ListeVaisseau[i], 0));
                        } else {
                            cols.append(sell_ship(ListeVaisseau[i], 1));
                        }
                    };
                    $('.market-general').append(cols);
                }
            });
        }
    });

}

function sell_ship(vaisseau, possede) {
    var desc = vaisseau.desc;
    var type = 'Leger';
    var btn_achat;
    var btn_achat_class;

    if(possede) {
        btn_achat_class = "btn-danger";
        btn_achat = '';
    } else {
        btn_achat_class = "btn-info";
        btn_achat = 'pop_in_ship(' + vaisseau.idspaceship + ')';
    }

    /*if (vaisseau.type == 2) {
        type = 'Moyen';
    }*/
    var template = $('#vaisseau_boutique').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            vaisseau_nom : vaisseau.nom,
            vaisseau_image : window.ress.vaisseaux + directoryShip(vaisseau.idfaction) + vaisseau.image,
            vaisseau_pv : vaisseau.pv,
            vaisseau_defense : vaisseau.defense + ' DEF',
            vaisseau_attaque : vaisseau.attaque + ' ATK',
            vaisseau_prix : vaisseau.prix,
            vaisseau_desc : vaisseau.desc,
            vaisseau_button : 'btn-primary btn-market right ' + btn_achat_class,
            vaisseau_click : btn_achat
        }
    );

    return rendered;
}