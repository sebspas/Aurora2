<div id="bg-login" class="bg"></div>

<?php require_once Config::$path['views'] . "login-box.php";?>
<div class="container">
    <div class="row">
        <a class="col-md-8" href="index.php?page=login">
            <img class="img-responsive" src="<?= Config::$path['images']?>aurora.png" alt="">
        </a>
    </div>

    <div class="col-md-8 padd-15">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1 class="c-white title1">Bienvenue sur Aurora !</h1>
            </div>
            <div class="panel-body">
                <div class="text-news">
                    <p class="c-white lead">
                        Aurora est un jeu aliant gestion et statégie : partez à la conquète de planètes pour rassembler
                        des ressources afin de personaliser vos équipements, acheter de nouveaux vaisseaux pour
                        renforcer votre arsenal lors des combats.
                        <br><br>
                    </p>
                </div>
                <div class="line">
                    <a class="btn2 blue2 right" href="index.php?page=inscription">PLAY</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-1"></div>
    <div class="col-md-3 padd-15">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="c-white title2"><?= $news->titre; ?></h2>
            </div>
            <div class="panel-body">
                    <blockquote class="lead">
                        <?= $news->desc; ?>
                    </blockquote>
                <h4 class="c-white title3"><?= date($news->date); ?></h4>
            </div>
        </div>
    </div>
</div>