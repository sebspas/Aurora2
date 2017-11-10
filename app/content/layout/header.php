<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AURORA : <?php if (isset($_GET['page']) && !empty($_GET['page']) && is_file(Config::$path['controller'].$_GET['page'].'.php')) echo htmlentities($_GET['page']); else echo 'Home'; ?> </title>
    <link rel="stylesheet" href="<?php echo Config::$path['css'] ?>style.css" />
    <link rel="stylesheet" href="<?php echo Config::$path['css'] ?>jquery.mCustomScrollbar.min.css" />
    <link href="<?php echo Config::$path['images'] ?>favicon.ico" type="image/x-icon" rel="icon" />
    <link href="<?php echo Config::$path['images'] ?>favicon.ico" type="image/x-icon" rel="shortcut icon" />
</head>
<body>
	<div id="header">
       <?php if (isset($_SESSION['iduser'])) {?>
	   <div class="menu">
            <nav class="menu-navigation">
               <div class="icon icon-menu js-to-menu-box" ></div>
               <div class="inline-block right">
                   <div class="icon icon-aqua"></div>
                   <div class="icon-content js-aqua">0</div>
                   <div class="icon icon-emerald"></div>
                   <div class="icon-content js-emerald">0</div>
                   <div class="icon icon-ruby"></div>
                   <div class="icon-content js-ruby">0</div>
                   <div class="icon icon-topaz"></div>
                   <div class="icon-content js-topaz">0</div>
                   <div class="icon icon-coin"></div>
                   <div class="icon-content js-money">0</div>
                   <a class="icon icon-logout right" href="<?= Config::$path['model']?>logout.php" ></a>
                   <a id="menu-avatar" class="menu-avatar js-profil">
                       <!--<img class="js-avatar" src="" alt="avatar" />-->
                   </a>
               </div>
               
            </nav>
       </div><!-- .menu -->
       <<div class="menu-box">
              <div class="menu-bg frame-border">
                  <ul class="inline-block txt-center">
                    <li class="home">
                      <a class="menu-link js-home" href="#" title="Home">Home</a>
                    </li>
                    <li class="market">
                      <a class="menu-link js-market" href="#" title="market">Market</a>
                    </li>
                    <li class="hangar">
                      <a class="menu-link js-hangar" href="#" title="hangar">Hangar</a>
                    </li>
                    <li class="labo">
                      <a class="menu-link js-labo" href="#" title="labo">Laboratoire</a>
                    </li>
                      <li class="Bibliotheque">
                          <a class="menu-link js-bib" href="#" title="bib">Bibliothèque</a>
                      </li>
                    <li class="profil">
                        <a class="menu-link js-profil" href="#" title="profil">Profil</a>
                    </li>
                  </ul>
               </div>
       </div><!-- .menu-box -->
        <!-- Ecran de chargement -->

           <div class="loader">
               <div class="loader-content">
                   <img id="img-loader" src="<?php echo Config::$path['images'] ?>menu.png" alt="menu">
                   <h2 class="title3 center">Loading ...</h2>
               </div>
               <div id="left"></div>
               <div id="right"></div>
           </div>
        <?php } ?>
        <?php if (isset($_GET['page']) && ($_GET['page'] == 'login' || $_GET['page'] == 'inscription')) {?>
            <div class="menu">
                <nav class="menu-navigation">
                    <div class="icon icon-menu js-login left" ></div>

                    <div class="inline-block">
                        <a href="#" class="btn-login blue2 js-tologinbox">Login</a>
                        <a href="index.php?page=inscription" class="btn-login blue3">Inscription</a>
                    </div>

                </nav>
            </div><!-- .menu -->
        <?php } ?>
        <div class="alpha">
           <img src="<?= Config::$path['images']?>alpha.png" alt="alpha">
        </div>
        <div class="alert-msg">
            <!-- Div contenant les messages d'erreurs -->
        </div>
	</div><!-- #header -->
    <div id="main">