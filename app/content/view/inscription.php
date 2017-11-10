<div id="bg-login" class="bg"></div>

<?php require_once Config::$path['views'] . "login-box.php";?>

<div class="container">
    <div class="row">
        <a class="col-md-8" href="index.php?page=login">
            <img class="img-responsive" src="<?= Config::$path['images']?>aurora.png" alt="">
        </a>
    </div>
    <div class="col-md-7 padd-15">
        <div class="panel panel-default c-white">
            <div class="panel-heading">
                <h1 class="c-white title1">Rejoins-nous !</h1>
            </div>
            <div class="panel-body">
                <!-- .login-form -->
                <form class="form form-horizontal col-md-12" method="GET" action="<?= Config::$path['model'] ?>inscription.php" class="center">
                    <div class="form-group">
                        <label for="pseudo" >Pseudo</label>
                        <input type="text" name="pseudo" id="pseudo1" class="form-control" autofocus />
                    </div>
                    <div class="form-group">
                        <label for="email" >Email</label>
                        <input type="email" name="email" id="email1" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="email2" >Email confirmation</label>
                        <input type="email" name="email2" id="email2" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password" >Password</label>
                        <input type="password" name="password" id="password1" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password2" >Password confirmation</label>
                        <input type="password" name="password2" id="password2" class="form-control" />
                    </div>
                    <div class="line3">
                        <input class="btn blue3 right" type="submit" value="Inscription" name="signup" id="send1" />
                    </div>
                </form><!-- .signup-form -->
            </div><!-- .frame-content -->
        </div>
    </div>
</div>