<?php
	session_start();

	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);

	require_once '../../core/Bd.class.php';

	header('Cache-Control: no-cache, must-revalidate');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	header('Content-type: application/json');

	extract($_GET);

	$BD = new BD('user');

	if (!$BD->isInDb('pseudo',$pseudo)) {
		$BD->addUser($pseudo, $email, $password);

		$user = $BD->select('pseudo', $pseudo);

		$BD->setUsedTable('ressources_joueur');
		$BD->addRessUser($user->iduser);
	}


	echo json_encode("Sign");

?>