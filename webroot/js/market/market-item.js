/**
 * Created by sebsp on 30/01/2016.
 */

function pop_in_item(item) {
    var bouton_achat = $('<a>')
        .attr({
            'href': '#',
            'class': 'btn2 red3 right'
        })
        .html('Acheter')
        .click(function(event) {
            alert('Vous n\'avez pas assez d\'argent :\'(');
        });
    if (money - item.prix >= 0) {
        bouton_achat = $('<a>')
            .attr({
                'href': '#',
                'class': item.idiitem + ' btn2 blue3 right'
            })
            .html('Acheter')
            .click(function(event) {
                $.ajax({
                    url: window.ress.achat + 'achat-market-item.php',
                    data: {
                        iditem: item.idiitem
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
                            $('.main').append(cortana_dialog('Ici c\'est le'
                                + ' marché vous pouvez y acheter des équipements,'
                                + ' cliquez sur le menu vaisseau pour'
                                + ' choisir des vaisseaux.'));
                            chargement_item(listeItems);
                            $('.main').fadeIn(500);
                        });
                    }
                })
            });
    }


    return $('<div>')
        .attr('class', 'fullframe')
        .append(
            $('<div>')
                .attr('class', 'frame1 white cols6 js-center')
                .append(
                    $('<div >')
                        .attr('class', 'frame-content')
                        .append(
                            $('<div>')
                                .attr('class', 'line')
                                .append(
                                    $('<h2 class="title1" >')
                                        .attr('class', 'title1')
                                        .html(item.nom)),
                            $('<div>')
                                .attr('class', 'row')
                                .append(
                                    $('<img>')
                                        .attr({
                                            src: window.ress.items + item.image,
                                            alt: '',
                                            'class': 'cols7'
                                        })),
                            $('<div>')
                                .attr('class', 'line3')
                                .append(
                                    $('<p>')
                                        .html(item.desc)),
                            $('<div>')
                                .attr('class', 'line')
                                .append(
                                    $('<h2>')
                                        .attr('class', 'prix left')
                                        .html(item.prix),
                                    bouton_achat))));
}

function chargement_item() {
    $.ajax({
        url: window.ress.loader + 'load-market-items.php',
        success: function(data) {
            ListeItems = data;
            $.ajax({
                url: window.ress.loader + 'load-nom-items.php',
                success: function(data) {
                    var cols = $('<div>').attr('class', 'row');
                    for (var i = ListeItems.length - 1; i >= 0; i--) {
                        if (-1 == $.inArray(ListeItems[i].nom, data)) {
                            cols.append(sell_item(ListeItems[i]));
                        } else {
                            cols.append(selled_item(ListeItems[i]));
                        }
                    };
                    $('.market-general').append(cols);
                }
            })
        }
    });

}

function selled_item(item) {
    return $('<div>')
        .attr('class', 'frame01 t-black c-white')
        .append(
            $('<div>')
                .attr('class', 'frame-content')
                .append(
                    $('<div>')
                        .attr('class', 'line')
                        .append(
                            $('<h2>')
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
                                .html(item.desc)),
                    $('<div>')
                        .attr('class', 'line')
                        .append(
                            $('<h2>')
                                .attr('class', 'prix left')
                                .html(item.prix + " $"),
                            $('<a>')
                                .attr({
                                    href: '#',
                                    'class': 'btn2 green1 right'
                                })
                                .html('Acheté'))));
}

function sell_item(item) {
    return $('<div>')
        .attr('class', 'frame01 t-black c-white')
        .append(
            $('<div>')
                .attr('class', 'frame-content')
                .append(
                    $('<div>')
                        .attr('class', 'line')
                        .append(
                            $('<h2>')
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
                                .html(item.desc)),
                    $('<div>')
                        .attr('class', 'line')
                        .append(
                            $('<h2>')
                                .attr('class', 'prix left')
                                .html(item.prix + " $"),
                            $('<a>')
                                .attr({
                                    href: '#',
                                    'class': item.idiitem + ' btn2 blue3 right js-buy-item'
                                })
                                .click(function() {
                                    // remplir la frame corectement
                                    $('.main').append(pop_in_item(item));
                                    $('.js-to-menu-box').removeClass('icon-menu');
                                    $('.js-to-menu-box').addClass('icon-cancel');
                                    $('.js-center').center();
                                })
                                .html('Acheter'))));
}
