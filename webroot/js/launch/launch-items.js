/**
 * Created by sebsp on 30/01/2016.
 */

function chargementSelecteurEquipement() {
    //alert(selected_mission.nom + selected_ship.nom);
    $.ajax({
        url: window.ress.loader + 'load-equipement.php',
        success: function(data) {
            listeEquipement = data;
            // Chargement du hangar
            $('.js-frame-m').fadeOut(400, function() {
                $(this).empty();
                $(this).append(
                    $('<h2>')
                        .attr('class', 'title1 c-white')
                        .html('Sélectionnez votre equipement :'));
                $(this).append(
                    $('<div>')
                        .attr('class', 'left cols5')
                        .append(
                            $('<h2>')
                                .attr('class', 'title2')
                                .html('Equipement disponible :'),
                            $('<div>')
                                .attr('class', 'contenu-left')));
                for (var i = listeEquipement.length - 1; i >= 0; i--) {
                    $('.contenu-left').append(item(listeEquipement[i]));
                };
                $(this).append(
                    $('<div>')
                        .attr('class', 'right cols5')
                        .append(
                            $('<h2>')
                                .attr('class', 'title2')
                                .html('Equipement Selectionné (Max.2) : '),
                            $('<div>')
                                .attr('class', 'contenu-right')));
                $(this).append(
                    $('<div>')
                        .attr('class', 'cols12')
                        .append(
                            $('<a>')
                                .attr('class', 'btn2 blue3 right')
                                .html('Lancer la mission !')
                                .click(function() {
                                    //Lancement de la mission...
                                    // retrait des points d'energies
                                    $.ajax({
                                        url: window.ress.traitement + 'lancement-mission.php',
                                        data: {
                                            energie: selected_mission.ress.energie,
                                            idmission: selected_mission.idmission
                                        },
                                        success: function(data) {
                                            $.ajax({
                                                url: window.ress.loader + 'load-ressources-j.php',
                                                success: function(data) {
                                                    ressources = data;
                                                    $('.js-aqua').html(ressources.aqua);
                                                    $('.js-emerald').html(ressources.emerald);
                                                    $('.js-ruby').html(ressources.ruby);
                                                    $('.js-topaz').html(ressources.topaz);
                                                    $('.js-money').html(ressources.money);

                                                    // on affiche un écran de chargement
                                                    apparitionChargement();
                                                    setTimeout(function(){
                                                        chargementCombat();
                                                    }, 2000);
                                                }
                                            });
                                        }
                                    });
                                })));
                $(this).fadeIn(300);
            });
        }
    });

}
var lastAdd = 0;

function item(item) {
    return $('<div>')
        .attr('class', 'frame0 t-black c-white cols4')
        .append(
            $('<div>')
                .attr('class', 'frame-content')
                .append(
                    $('<div>')
                        .attr('class', 'line')
                        .append(
                            $('<h4>')
                                .attr('class', 'title1 txt-center')
                                .html(item.nom)),
                    $('<div>')
                        .attr('class', 'row')
                        .append(
                            $('<img>')
                                .attr({
                                    src: window.ress.items + item.image,
                                    alt: item.nom
                                })),
                    $('<div>')
                        .attr('class', 'line3')
                        .append(
                            $('<p>')
                                .html(item.spec + ' : +' + item.bonus))))
        .click(function(event) {
            if ($(this).parent().attr('class') == 'contenu-left') {
                if (selected_equipement1 != null
                    && selected_equipement2 != null) {
                    alert('Maximum deux équipements !');
                } else {
                    if (selected_equipement1) {
                        selected_equipement2 = item;
                        lastAdd = 2;
                    } else {
                        selected_equipement1 = item;
                        lastAdd = 1;
                    }
                    $(this).fadeOut(500, function() {
                        $('.contenu-right').append(this);
                        $(this).fadeIn(500);
                    });
                }
            } else {
                if (selected_equipement1.nom == item.nom) {
                    selected_equipement1 = null;
                } else {
                    selected_equipement2 = null;
                }
                $(this).fadeOut(500, function() {
                    $('.contenu-left').append(this);
                    $(this).fadeIn(500);
                });
            }
        });;
}