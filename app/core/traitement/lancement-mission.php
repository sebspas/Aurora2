<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	extract($_GET);
	// on met a jour l'argent du joueur
	$BD = new BD('ressources_joueur');

    $ress = $BD->select('iduser', $_SESSION['iduser']);
    $topaz = $ress->topaz - $energie;
	$BD->update('topaz', $topaz,'iduser',$_SESSION['iduser']);
	
	// on met la mission comme courante

	echo json_encode($topaz);
?>
