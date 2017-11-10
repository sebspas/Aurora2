<?php
//session_name("Aurora");
session_start();

/* GLOBAL */
define ('DS', DIRECTORY_SEPARATOR);
define ('ROOT', dirname (__FILE__) . DS);

/* APP */
define ('APP', 'app' . DS);
define ('CORE', APP . 'core' . DS);

require_once  ROOT . CORE . 'bootstrap.php';

ini_set('error_reporting', E_ALL);
ini_set('display_errors',1);

require_once  ROOT . CONFIG . 'Config.class.php';
require_once ROOT . CORE . 'Bd.class.php';

// Nécessaire pour la concatenation des path :)
Config::staticConstruct();

// attention aux headers à faire avant cette merde ....
require_once  ROOT . Config::$path['header'];


if (!empty($_GET['page']) && is_file(Config::$path['controller'].$_GET['page'].'.php'))
	require_once Config::$path['controller'].$_GET['page'].'.php';
else
	require_once Config::$path['controller'].'home.php';

require_once Config::$path['footer'];