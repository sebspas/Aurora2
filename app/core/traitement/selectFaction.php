<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	extract($_GET);

	$BD = new BD('user');
	$BD->update('idfaction',$idfaction,'iduser',$_SESSION['iduser']);
	$BD->update('rang', 1, 'iduser', $_SESSION['iduser']);

	$_SESSION['rang'] = 1;
?>
