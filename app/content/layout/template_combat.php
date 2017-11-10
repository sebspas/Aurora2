<!-- Frame Vaisseau Page Home -->
<script type="x-tmpl-mustache" id="page-combat">
    <div class="full-combat">
        <div class="haut-combat combat-block">
            <div class="deck-block t-black col-lg-3">
                <div class="info-deck col-lg-7 c-white">
                    <h2 class="text-center title1">Mon Deck :</h2>
                    <p>Carte : 15/20</p>
                </div>
                <div class="img-container-deck col-lg-5">
                    <img src="./webroot/images/deck.png" alt="deck-ennemi">
                </div>
            </div>
            <div class="carte-block js-block-carte-I col-lg-6 t-black">
                <!-- les cartes de l'IA -->
            </div>
            <div class="player-block t-black c-white col-lg-3">
                <div class="info-ship-player col-lg-7 scroll-bar">
                    <h2 class="title1 js-nom-I" >Mon Vaisseaux</h2>
                    <table class="table table-responsive">
                        <tr>
                            <td class="col-lg-5">
                                <div class="icon icon-pv "></div>
                                <div class="icon-content js-pv-I">25/250</div>
                            </td>
                            <td class="col-lg-5">
                                <div class="icon icon-defense"></div>
                                <div class="icon-content js-def-I">25/250</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-5">
                                <div class="icon icon-attaque"></div>
                                <div class="icon-content js-att-I">25/250</div>
                            </td>
                            <td class="col-lg-5">
                                <div class="icon icon-bouclier"></div>
                                <div class="icon-content js-shield-I">25/250</div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="img-ship-player col-lg-5">
                    <img class="js-image-I" src="./webroot/images/vaisseaux/Federation/blue1.png" alt="deck-ennemi">
                </div>
            </div>
        </div>

         <div class="milieu-combat combat-block">
                <div class="ecran-block col-lg-3 t-black c-white">
                    <h2>Ecran de contrôle</h2>
                    <div class="ecran-block-text scroll-bar">

                    </div>
                </div>
        </div>

        <div class="bas-combat combat-block">
            <div class="player-block t-black c-white col-lg-3">
                <div class="img-ship-player col-lg-5">
                    <img class="js-image-j" src="./webroot/images/vaisseaux/Federation/blue1.png" alt="deck-ennemi">
                </div>
                <div class="info-ship-player col-lg-7 scroll-bar">
                    <h2 class="title1 js-nom-j" >Mon Vaisseaux</h2>
                    <table class="table table-responsive">
                        <tr>
                            <td class="col-lg-5">
                                <div class="icon icon-pv "></div>
                                <div class="icon-content js-pv-j">25/250</div>
                            </td>
                            <td class="col-lg-5">
                                <div class="icon icon-defense"></div>
                                <div class="icon-content js-def-j">25/250</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-5">
                                <div class="icon icon-attaque"></div>
                                <div class="icon-content js-att-j">25/250</div>
                            </td>
                            <td class="col-lg-5">
                                <div class="icon icon-bouclier"></div>
                                <div class="icon-content js-shield-j">25/250</div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="block-carte-player col-lg-6">
                <div class="carte-block-player js-block-carte-J  t-black">
                    <!-- les cartes du Joueur -->
                </div>
            </div>
             <div class="deck-block t-black col-lg-3">
                <div class="img-container-deck col-lg-5">
                    <img src="./webroot/images/deck.png" alt="deck-ennemi">
                </div>
                <div class="info-deck col-lg-7 c-white">
                    <h2 class="text-center title1">Mon Deck :</h2>
                    <p>Carte : 15/20</p>
                </div>
            </div>
        </div>
    </div>
</script>

<script type="x-tmpl-mustache" id="combat-card">
    <div class="{{card_class}}">
        <div class="col-lg-12">
            <h1 class="title3 c-white card-combat-level">{{card_level}}</h1>
            <h1 class="title3 c-white card-combat-title">{{card_nom}}</h1>
        </div>
        <div class="col-lg-12">
             <img class="card-combat-img" src="{{card_image}}" alt="img">
             <div class="{{card_icon_value}}"></div>
             <div class="icon-content">{{card_value}}</div>
             <div class="icon icon-duree"></div>
             <div class="icon-content">{{card_duree}}</div>
             <p class="card-combat-desc c-white" >{{card_desc}}</p>
        </div>

    </div>
</script>

<script type="x-tmpl-mustache" id="combat-card-dos">
    <div class="{{card_class}}">

    </div>
</script>