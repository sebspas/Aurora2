<script type="x-tmpl-mustache" id="profil-perso">
    <div class="col-lg-7 col-md-8">
        <div class="panel panel-default c-white">
            <div class="panel-heading">
                <h2 class="title1">{{nom}}</h2>
            </div>
            <div class="panel-body">
                <div class="col-lg-5 col-md-5 padd-10">
                    <img class="js-avatar" src="{{avatar}}">
                </div>
                <div class="col-lg-6 col-md-6">
                    <h2 class="title1">Informations de Compte :</h2>
                    <p class="text-info">Email : {{mail}}</p>
                    <p class="text-info">Rang : {{rang}}</p>
                    <h2>Changer son avatar :</h2>
                    <form class="form form-horizontal Changement-avatar" method="GET" action="{{action}}">
                        <div class="form-group padd-15">
                            <label for="avatar" >Url de votre image (jpeg, jpg, gif)</label>
                            <input type="text" name="image" id="avatar" class="form-control"></input>
                        </div>
                        <input class="btn blue3 center" type="submit" value="Changer" name="Changer"></input>
                    </form>
                </div>
            </div>
        </div>
    </div>
</script>

<script type="x-tmpl-mustache" id="classement-joueurs">
    <div class="col-lg-3 col-md-3">
        <div class="panel panel-default c-white">
            <div class="panel-heading">
                <h2 class="title1">Classement : </h2>
            </div>
            <div class="panel-body">
                <table class="table table-responsive classement">
                </table>
            </div>
        </div>
    </div>
</script>

<script type="x-tmpl-mustache" id="ligne-joueur">
    <tr class="{{class}}">
        <td class="img-container col-lg-3">
            <img class="img-in-container" src="{{avatar}}" alt="{{nom}}" >
        </td>
        <td>
            {{nom}}
        </td>
        <td>
            {{points}}
        </td>
    </tr>
</script>