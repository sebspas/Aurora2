var listeShip;
var currentId = 0;

function ChargementHangarPage() {
		$.ajax({
			url: window.ress.loader + 'load-hangar-ship.php',
			success: function(data) {
				listeShip = data;
				// Chargement du hangar
                var content;
                for (i = 0; i < listeShip.length; i++) {
                    content += vaisseau_hangar(listeShip[i]);
                }
				$('.main').append(content);
			}
		})
	} // OnReady()

function vaisseau_hangar(vaisseau) {
    var template = $('#vaisseau-hangar').html();
    Mustache.parse(template);   // optional, speeds up future uses
    var rendered = Mustache.render(template,
        {
            nom_vaisseau : vaisseau.nom + '- Niv ' + vaisseau.level,
            vaisseau_image : window.ress.vaisseaux + directoryShip(vaisseau.idfaction) + vaisseau.image,
            vaisseau_pv : vaisseau.pv,
            vaisseau_defense : vaisseau.defense + ' DEF',
            vaisseau_attaque : vaisseau.attaque + ' ATK',
            vaisseau_xp : vaisseau.xp + '/' + vaisseau.nextlevel + ' Xp'
        }
    );

    return rendered;
}