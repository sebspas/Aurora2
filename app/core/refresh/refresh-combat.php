<?php
session_start();
ini_set('error_reporting', E_ALL);
ini_set('display_errors',1);
require_once('../Bd.class.php');

extract($_GET);
// on recupère toutes les infos du combat
$BD = new BD('combat_player');
$idjoueur = $BD->selectTreeParam('iduser', $_SESSION['iduser'], 'idmission', $idmission, 'type_player', 1, 'iduser');
// on selectionne l'IA précedement crée, idmission + iduser
$idennemi = $BD->selectTreeParam('iduser', $_SESSION['iduser'], 'idmission', $idmission,  'type_player', 0, 'iduser');

$idjoueur = $idjoueur[0]->idcombat_player;
$idennemi = $idennemi[0]->idcombat_player;

// on récupère les deux vaisseaux
$BD->setUsedTable('vaisseau_combat');
$vaisseauIA = $BD->select('idcombat_player', $idennemi);

$vaisseauJoueur = $BD->select('idcombat_player', $idjoueur);

$tabVaisseau['IA'] = $vaisseauIA;
$tabVaisseau['Joueur'] = $vaisseauJoueur;


echo json_encode($tabVaisseau);

?>




