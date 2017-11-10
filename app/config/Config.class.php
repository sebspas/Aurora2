<?php

class Config {
    public static $debug = true;

    public static $path = array(
        'header' => '',
        'template' => '',
        'footer' => '',
        'views' => VIEW,
        'controller' => CONTROLLER,
        'model' => MODEL,
        'css' => CSS,
        'images' => IMG,
        'videos' => VID,
        'js'    => JS,
        'js-lib' => '',
        'js-plug' => ''
        //'traitement' => 'asset/traitement/',
        //'vaisseau' => 'asset/images/vaisseaux/',
        //'items' => 'asset/images/items/'
    );

    public static function staticConstruct()
    {
        self::$path['header'] = LAYOUT . 'header.php';
        self::$path['template_html'] = LAYOUT . 'template_html.php';
        self::$path['template_combat'] = LAYOUT . 'template_combat.php';
        self::$path['template_profil'] = LAYOUT . 'template_profil.php';

        self::$path['footer'] = LAYOUT . 'footer.php';

        self::$path['js-lib'] = JS . 'lib' . DS;
        self::$path['js-plug'] = JS . 'plugins' . DS;
    }
}