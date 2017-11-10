	</div><!-- #main -->
    <?php
        require_once Config::$path['template_html'];
        require_once Config::$path['template_combat'];
        require_once Config::$path['template_profil'];
    ?>
	<span class="scrollT"></span>
	<script type="text/javascript" src="<?php echo Config::$path['js-plug'] ?>jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js-plug'] ?>mustache.min.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js-plug'] ?>velocity.min.js"></script>

    <script type="text/javascript" src="<?php echo Config::$path['js-lib'] ?>fn.scrollT.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js-lib'] ?>fn.center.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>menu.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>chargement.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>pageLoader.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/bib/bib.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>main.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/market/market.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/market/market-item.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/market/market-ship.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/market/market-npc.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>profil.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>cortana.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/combat/combat.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>/home/home.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>hangar.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js'] ?>mission.js"></script>
    <script type="text/javascript" src="<?php echo Config::$path['js-plug'] ?>jquery.mCustomScrollbar.concat.min.js"></script>
    <?php
        // si on n'est pas sur la page login ou home
        if (isset($_GET['page']) && $_GET['page'] != 'login' && $_GET['page'] != 'inscription' && $_GET['page'] != 'home') {
            echo '<script type="text/javascript" src="' . Config::$path['js'] . 'connexion-secure.js"></script>';
            echo '<script type="text/javascript" src="' . Config::$path['js'] . 'refresh-co.js"></script>';
        }
        else if (isset($_GET['page']) && ($_GET['page'] == 'login' || $_GET['page'] == 'inscription')){
           echo '<script type="text/javascript" src="' . Config::$path['js'] . 'login.js"></script>';
        }
        else {
           echo '<script type="text/javascript" src="' . Config::$path['js'] . 'connexion-secure.js"></script>';
           echo '<script type="text/javascript" src="' . Config::$path['js'] . 'refresh-co.js"></script>';
        }
    ?>    
</body>
</html>
