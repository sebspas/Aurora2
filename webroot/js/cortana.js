/**
 * Created by lefou on 17/02/2016.
 */

function cortana_text(Texte){

    var template = $('#cortana-text').html();
    Mustache.parse(template);

    var rendered = Mustache.render(template,
        {
            cortana_img : window.ress.images + 'cortana.gif',
            cortana_alt : 'cortana',
            cortana_txt : Texte,
            cortana_name : 'Cortana'
        });

    $('.main').append(rendered);
}