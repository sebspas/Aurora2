var profil;
var left_block;

function ChargementProfilPage() {
    $.ajax({
        url: window.ress.loader + 'load-profil.php',
        success: function(data) {
            left_block = $('<div>')
                .attr('class', 'cols8');
            var user = data;
            // Chargement du profil
            $('.main').append(infos(user));

            $('.Changement-avatar').submit(function(event) {
                event.preventDefault();
                $.ajax({
                    type: $(this).attr("method"),
                    url: $(this).attr("action"),
                    data: $(this).serialize(),
                    success: OnSuccessChange
                });
                return true;
            });

            $('.main').append(
                $('<div>')
                    .attr('class', 'g1'));

            //left_block.append(changement_avatar());
            classementJoueurs();
        }
    });
} // OnReady()

function infos(user) {
    var template = $('#profil-perso').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            nom: user.pseudo,
            mail: user.email,
            rang: user.rang,
            avatar: user.avatar,
            action: window.ress.traitement + 'changement_avatar.php'
        }
    );
    return rendered;
} // infos()

function OnSuccessChange(data) {
    if (data.error) {
        alert(data.error);
    } else {
        $('.js-avatar').attr('src', data.url);
    }
}

function classementJoueurs() {

    var template = $('#classement-joueurs').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var classement = Mustache.render(template);

    var players = $('<div>')
        .attr('id', 'players');

    $.ajax({
        url: window.ress.loader + 'load-classement.php',
        success: function(data) {
            $('.main').append(classement);

            for (var i = 0; i < data.length; i++) {
                $('.classement').append(
                    Joueur_classement(data[i], i)
                );
            }


        }
    });
}

function Joueur_classement(user, i) {
    i = parseInt(i + 1);
    var class_ligne = "";
    if (i%2 == 0) {
        class_ligne = "t-black";
    } else {
        class_ligne = "";
    }
    var template = $('#ligne-joueur').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            class: 'col-md-12 ' + class_ligne,
            nom: user.pseudo,
            avatar: user.avatar,
            points: user.points
        }
    );
    return rendered;
}