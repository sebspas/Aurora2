<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	header('Cache-Control: no-cache, must-revalidate');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	header('Content-type: application/json');

	$BD = new BD('user');
	$user = $BD->select('iduser', $_SESSION['iduser']);

	$return = $user->rang;

	echo json_encode($return);
?>