<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	extract($_GET);

	$BD = new BD('spaceship');
	$spaceship = $BD->select('idspaceship',$idship);
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
	$BD->setUsedTable('user');
	$BD->update('rang',2,'iduser',$_SESSION['iduser']);
	$BD->setUsedTable('vaisseau');
	$idvaisseau = $BD->select('iduser',$_SESSION['iduser']);
	$BD->setUsedTable('user');
	$BD->update('idvaisseau',$idvaisseau->idvaisseau,'iduser',$_SESSION['iduser']);
	$_SESSION['rang'] = 1;
?>
