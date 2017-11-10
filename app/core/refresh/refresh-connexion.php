<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	$BD = new BD('connecté');
	$BD->update('lastco',time()+5000,'iduser',$_SESSION['iduser']);

?>