<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	extract($_GET);
	// recupération du vaisseau
	$BD = new BD('spaceship');
	$spaceship = $BD->select('idspaceship',$idship);
	// ajout du vaisseau
	$BD->setUsedTable('vaisseau');
	$BD->addVaisseau($spaceship->nom,
		$spaceship->desc,
		$spaceship->pv,
		$spaceship->attaque,
		$spaceship->defense,
		$spaceship->xp,
		$spaceship->nextlevel,
		$spaceship->type,
		$spaceship->image,
		$spaceship->idfaction,
		$_SESSION['iduser']);
	//retrait de l'or
	$BD->setUsedTable('ressources_joueur');
    $money = $money-$spaceship->prix;
	$BD->update('money',$money,'iduser',$_SESSION['iduser']);

	// vaisseau définit comme vaisseau courant
	$BD->setUsedTable('vaisseau');
	$idvaisseau = $BD->select('iduser',$_SESSION['iduser']);
	$BD->setUsedTable('user');
	$BD->update('idvaisseau',$idvaisseau->idvaisseau,'iduser',$_SESSION['iduser']);

	echo json_encode($money);

?>