<?php
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);

    $db = new PDO('mysql:dbname=Aurora;host=127.0.0.1', 'root', 'aqwEDCtgb7;');
    $db->exec('SET CHARACTER SET utf8');

    $req = $db->prepare("UPDATE `ressources_joueur` SET `topaz` = `topaz` + 20 WHERE (`topaz`+20) <= 150");
    $req->execute();

    $req->closeCursor();

?>