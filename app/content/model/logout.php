<?php
	session_start();

	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);

	require_once '../../core/Bd.class.php';

	$BD = new BD('connecté');
	$BD->delete('iduser',$_SESSION['iduser']);

	$_SESSION = array();
	if (isset($_COOKIE[session_name()]))
	{setcookie(session_name(),'',time()-4200,'/');}

	session_destroy();
	header('Location: /Aurora2/index.php?page=login');
?>