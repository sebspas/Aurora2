<!--

    Frame Market - DEBUT

 -->
<script type="x-tmpl-mustache" id="market-selection">
    <div class="col-lg-5 col-md-5 market-selection">
        <div class="col-lg-12 col-md-12">
            <a href="#" class="js-boutique-npc">
                <img class="frame-border js-market-npc" alt="boutique-npc" src="{{Market_npc}}"></img>
            </a>
        </div>
        <div class="col-lg-12 col-md-12">
            <a href="#" class="js-boutique-player">
                <img class="frame-border js-market-player" alt="boutique-player" src="{{Market_player}}"></img>
            </a>
        </div>
    </div>
</script>

<script type="x-tmpl-mustache" id="market-menu-npc">
    <div class="col-lg-10">
        <div class="frame0 frame-border t-black">
            <div class="col-lg-12">
                <a class="btn2 green2 center js-ship">Vaisseaux</a>
                <a class="btn2 green2 center js-items">Items</a>
                <a class="btn2 blue2 center js-market-npc"><- Retour</a>
            </div>
        </div>
    </div>
</script>

<script type="x-tmpl-mustache" id="market-general">
    <div class="market-general">
    </div>
</script>

<script type="x-tmpl-mustache" id="cortana-text">
    <div class="cortana">
        <div class="frame0 t-black c-white cortana-frame">
            <img class="cortana-img left" src="{{cortana_img}}" alt="{{cortana_alt}}"/>
            <div class="title2">{{cortana_name}}</div>
            <div class="title3">{{cortana_txt}}</div>
        </div>
    </div>
</script>

<!-- Frame vaisseau promo -->
<script type="x-tmpl-mustache" id="vaisseau-promo">
    <div class="col-lg-12 col-md-12 padd-15">
        <div class="panel panel-default c-white">
            <div class="panel-heading col-lg-12 col-md-12">
                <img src="{{vaisseau_image}}" alt="{{vaisseau_nom}}" class="img-responsive col-lg-2 col-md-2"/>
                <h2 class="col-lg-10 col-md-10">{{vaisseau_nom}}</h2>
            </div>
            <div class="panel-body">
                    <div class="icon icon-pv"></div>
                    <div class="icon-content">{{vaisseau_pv}}</div>
                    <div class="icon icon-defense"></div>
                    <div class="icon-content">{{vaisseau_defense}}</div>
                    <div class="icon icon-attaque"></div>
                    <div class="icon-content">{{vaisseau_attaque}}</div>
                    <div class="icon icon-xp"></div>
                    <div class="icon-content">{{vaisseau_xp}}</div>
                <div class="col-lg-12 col-md-12">
                    <h3 class="prix left" ><s>{{vaisseau_prix}}</s></h3>
                    <h3 class="prix title 1 c-white left" >- {{vaisseau_reduction}} % = </h3>
                    <h3 class="prix title3 c-green2 left" >{{vaisseau_prix_reduit}}</h3>
                    <a href="#" class="{{vaisseau_button}}" onClick="{{vaisseau_click}}">Acheter</a>
                </div>
            </div>
        </div>
    </div>
</script>

<!-- Frame Vaisseau Achat -->
<script type="x-tmpl-mustache" id="achat_vaisseau">
    <div class="fullframe">
        <div class="frame1 white cols6 js-center frame-mission">
            <div class="frame-content">
                <div class="line">
                    <h2 class="c-white title1">{{vaisseau_nom}}</h2>
                </div>

                <h2 class="title1">{{nom_vaisseau}}</h2>

                <img class="cols3" src="{{vaisseau_image}}" alt="{{nom_vaisseau}}"/>
                <div class="icon icon-pv"></div>
                <div class="icon-content">{{vaisseau_pv}}</div>
                <div class="icon icon-defense"></div>
                <div class="icon-content">{{vaisseau_defense}}</div>
                <div class="icon icon-attaque"></div>
                <div class="icon-content">{{vaisseau_attaque}}</div>
                <div class="line2" >
                    <h2 class="prix left">{{vaisseau_prix}}</h2>
                    <a href="#" class="btn2 blue3 right chooser" onClick="achat_vaisseau({{vaisseau_id}})" >Acheter</a>
                </div>

            </div>
        </div>
     </div>
</script>

<!-- Frame vaisseau market -->
<script type="x-tmpl-mustache" id="vaisseau_boutique">
    <div class="col-lg-12 col-md-12 padd-15">
        <div class="panel panel-default c-white">
            <div class="panel-heading ">
                <h2>{{vaisseau_nom}}</h2>
            </div>
            <div class="panel-body">
                <div class="col-lg-1">
                    <img src="{{vaisseau_image}}" alt="{{vaisseau_nom}}" class="market-ship"/>
                </div>
                <div class="col-lg-4">
                    <div class="icon icon-pv"></div>
                    <div class="icon-content">{{vaisseau_pv}}</div>
                    <div class="icon icon-defense"></div>
                    <div class="icon-content">{{vaisseau_defense}}</div>
                    <div class="icon icon-attaque"></div>
                    <div class="icon-content">{{vaisseau_attaque}}</div>
                 </div>
                <div class="col-lg-4">
                    <p>{{vaisseau_desc}}<p>
                </div>
                <div class="col-lg-3">
                    <h3 class="prix left" >
                        <div class="icon icon-coin"></div>
                        <div class="icon-content">{{vaisseau_prix}}</div>
                    </h3>
                    <a href="#" class="{{vaisseau_button}}" onClick="{{vaisseau_click}}">Acheter</a>
                </div>
            </div>
        </div>
    </div>
</script>

<!-------------------------------------------->

<!-- Frame Home Map -->
<script type="x-tmpl-mustache" id="home-map">
    <div class="col-lg-8 col-md-8">
        <div class="map-image">
            <table class="planets-map">
                <!-- ICI LES PLANETES -->
            </table>
        </div>
    </div>
</script>

<!-- Planet on map -->
<script type="x-tmpl-mustache" id="planet-on-map">
    <div class="planet">
        <a href="#" class="js-swap-planet" OnClick="home_map_selecteur({{Planete_id}})">
            <img src="{{Planete_image}}" alt="{{Planete_image}}"/>
            <p class="title3 c-white" >{{Planete_msg}}</p>
        </a>
    </div>
</script>

<!-- Frame Home Selecteur Map -->
<script type="x-tmpl-mustache" id="home-map-selecteur">
    <div class="col-lg-3 col-md-3 right frame-selecteur-map home-map-selecteur c-white">
    </div>
</script>

<!-- Frame Home Selecteur Content -->
<script type="x-tmpl-mustache" id="home-map-selecteur-content">
    <div class="{{Planete_class}}">
        <div class="panel-heading">
            <h2>{{Planete_nom}}</h2>
        </div>
        <div class="panel-body">
            <img src="{{Planete_image}}" alt="{{Planete_nom}}"/>
            <p class="lead texte-planete">{{Planete_desc}}</p>
            <a href="#" OnClick="ListeMissions({{Planete_id}})" class="center btn2 blue2">Missions</a>
        </div>
    </div>
</script>

<!--

    FRAME DEBUT DE JEUX

-->
<!-- Frame Faction -->
<script type="x-tmpl-mustache" id="faction-starter">
     <div class="col-lg-4 panel-faction faction{{faction_id}}">
        <div class="panel full-heigth c-white">
        <div class="panel-heading">
            <h2 class="title1 text-center">{{faction_nom}}</h2>
        </div>
        <div class="panel-body">
            <div class="img-faction">
                <img src="{{faction_image}}" alt="{{faction_nom}}"/>
            </div>

            <div class="line c-white  text-faction">
                    {{faction_desc}}
            </div>
            <div class="row center bottom" >
                <a href="#" class="btn-faction c-white blue2 right chooser" onClick="select_faction({{faction_id}})" >Choisir</a>
            </div>
        </div>
    </div>
</script>

<!-- Frame Vaisseau starter -->
<script type="x-tmpl-mustache" id="vaisseau-starter">
    <div class="col-lg-4 col-md-4">
        <div class="panel panel-default c-white">
            <div class="panel-body">
                <div class="col-lg-2 col-md-2">
                    <div class="ship-container">
                        <img src="{{vaisseau_image}}" alt="{{nom_vaisseau}}" class="ship-img"/>
                    </div>
                </div>
                    <h2 class="col-lg-10 col-md-10">{{nom_vaisseau}}</h2>
                    <div class="icon icon-pv"></div>
                    <div class="icon-content">{{vaisseau_pv}}</div>
                    <div class="icon icon-defense"></div>
                    <div class="icon-content">{{vaisseau_defense}}</div>
                    <div class="icon icon-attaque"></div>
                    <div class="icon-content">{{vaisseau_attaque}}</div>
                    <div class="icon icon-xp"></div>
                    <div class="icon-content">{{vaisseau_xp}}</div>

                    <div class="line0" >
                        <a href="#" class="btn2 blue3 right chooser" onClick="select_starter({{vaisseau_id}})" >Choisir</a>
                    </div>
            </div>
        </div>
    </div>
</script>
<!--------------------------------------------------------------->
<script type="x-tmpl-mustache" id="vaisseau-selection-mission-container">
    <h2 class="title1 c-white padd-10">Sélectionnez votre vaisseau :</h2>
    <div class="frame-vaisseau-selection cols12">

    </div>
</script>

<!-- Frame Vaisseau Page Home -->
<script type="x-tmpl-mustache" id="vaisseau-selection-mission">
    <div class="frame-vaisseau-selection-mission">
        <div class="frame0 t-black c-white col-lg-12 col-md-12">
            <div class="frame-content">
                    <div class="col-lg-2 col-md-2">
                        <div class="ship-container">
                            <img src="{{vaisseau_image}}" alt="{{nom_vaisseau}}" class="ship-img"/>
                        </div>
                    </div>
                    <h2 class="col-lg-10 col-md-10">{{nom_vaisseau}}</h2>
                    <div>
                        <div class="icon icon-pv"></div>
                        <div class="icon-content">{{vaisseau_pv}}</div>
                        <div class="icon icon-defense"></div>
                        <div class="icon-content">{{vaisseau_defense}}</div>
                        <div class="icon icon-attaque"></div>
                        <div class="icon-content">{{vaisseau_attaque}}</div>
                        <div class="icon icon-xp"></div>
                        <div class="icon-content">{{vaisseau_xp}}</div>
                         <a class="btn2 blue2 right" href="#" OnClick="selection_vaisseau_mission({{vaisseau_id}})">Sélectionner</a>
                    </div>

            </div>
        </div>
    </div>
</script>

<!-- Frame Vaisseau Hangar -->
<script type="x-tmpl-mustache" id="vaisseau-hangar">
    <div class="col-lg-5 col-md-5">
        <div class="panel panel-default c-white">
            <div class="panel-body">
                <div class="col-lg-2 col-md-2">
                    <div class="ship-container">
                        <img src="{{vaisseau_image}}" alt="{{nom_vaisseau}}" class="ship-img"/>
                    </div>
                </div>
                    <h2 class="col-lg-10 col-md-10">{{nom_vaisseau}}</h2>
                    <div class="icon icon-pv"></div>
                    <div class="icon-content">{{vaisseau_pv}}</div>
                    <div class="icon icon-defense"></div>
                    <div class="icon-content">{{vaisseau_defense}}</div>
                    <div class="icon icon-attaque"></div>
                    <div class="icon-content">{{vaisseau_attaque}}</div>
                    <div class="icon icon-xp"></div>
                    <div class="icon-content">{{vaisseau_xp}}</div>
            </div>
        </div>
    </div>
</script>

<!-- Frame Missions dans la box de listing -->
<script type="x-tmpl-mustache" id="mission">
    <div class="row panel panel-primary mission-selecteur">
        <div class="panel-heading">
            <div class="icon3 left icon-rank{{mission_level}}"></div>
            <h4 class="title1 c-white" >{{mission_nom}}</h4>
        </div>
        <div class="panel-body">
            <div class="col-lg-12">
                <p>Cout en topaze :</p>
                <div class="icon3 icon-topaz"></div>
                <div class="icon-content" >{{mission_energy}}</div>
            </div>
            <div class="col-lg-12">
                <p>Récompenses en ressources :</p>
                <div class="icon3 icon-aqua"></div>
                <div class="icon-content">{{mission_aqua}}</div>

                <div class="icon3 icon-emerald"></div>
                <div class="icon-content">{{mission_emerald}}</div>

                <div class="icon3 icon-ruby"></div>
                <div class="icon-content">{{mission_ruby}}</div>

                <div class="icon3 icon-topaz"></div>
                <div class="icon-content">{{mission_topaz}}</div>
            </div>
            <div class="col-lg-12">
                <p>Autres :</p>
                <div class="icon3 icon-coin"></div>
                <div class="icon-content">{{mission_or}}</div>

                <div class="icon3 icon-xp"></div>
                <div class="icon-content" >{{mission_xp}}</div>
            </div>
            <div class="col-lg-12">
                <a class="btn2 blue3 right js-to-mission" href="#" onClick="launch({{mission_launch}})">Lancer</a>
            </div>
        </div>
    </div>
</script>

<!-- Frame Lancement Mission -->
<script type="x-tmpl-mustache" id="mission_lancement">
    <div class="fullframe">
        <div class="frame1 white col-lg-7 col-md-7 js-center frame-mission">
            <div class="frame-content js-frame-m">
                <br>
                <div class="icon3 left icon-rank{{mission_level}}"></div>

                <h2 class="title1 c-white">{{mission_nom}}</h2>
                <div class="left padd-10">
                    <img src="{{mission_image}}" width="400px" />
                </div>

                <div class="col-lg-5 col-md-5 rigth c-white padd-10">
                    <div class="line c-white  text-mission">
                        {{mission_desc}}
                    </div>

                    <div class="col-lg-12 col-md-12">
                        <p>Cout en topaze :</p>
                        <div class="icon3 icon-topaz"></div>
                        <div class="icon-content" >{{mission_energy}}</div>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <p>Récompenses en ressources :</p>
                        <div class="icon3 icon-aqua"></div>
                        <div class="icon-content">{{mission_aqua}}</div>

                        <div class="icon3 icon-emerald"></div>
                        <div class="icon-content">{{mission_emerald}}</div>

                        <div class="icon3 icon-ruby"></div>
                        <div class="icon-content">{{mission_ruby}}</div>

                        <div class="icon3 icon-topaz"></div>
                        <div class="icon-content">{{mission_topaz}}</div>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <p>Autres :</p>
                        <div class="icon3 icon-coin"></div>
                        <div class="icon-content">{{mission_or}}</div>

                        <div class="icon3 icon-xp"></div>
                        <div class="icon-content" >{{mission_xp}}</div>
                    </div>
                    <a href="#" class="btn2 blue3 right padd-10" onClick="launch_mission_click({{mission_bouton}})">Lancer</a>
                </div>

            </div>
        </div>
     </div>
</script>

<!-- BIB FRAME -->
<script type="x-tmpl-mustache" id="bib-general">
    <div class="bib-general cols-lg-10 center">
    </div>
</script>

<script type="x-tmpl-mustache" id="bib-card">
    <div class="{{card_class}}">
         <h1 class="title3 c-white card-level">{{card_level}}</h1>
         <h1 class="title3 c-white card-title">{{card_nom}}</h1>
         <img class="card-img" src="{{card_image}}" alt="img">
         <div class="{{card_icon_value}}"></div>
         <div class="icon-content">{{card_value}}</div>
         <div class="icon icon-duree"></div>
         <div class="icon-content">{{card_duree}}</div>
         <img class="card-icon-faction" src="{{card_faction}}" alt="faction">
         <p class="card-desc c-white" >{{card_desc}}</p>
    </div>
</script>