<?php
session_start();
ini_set('error_reporting', E_ALL);
ini_set('display_errors',1);
require_once('../Bd.class.php');

extract($_GET);
// on récupère l'ID du joueur
$BD = new BD('combat_player');
$idjoueur = $BD->selectTreeParam('iduser', $_SESSION['iduser'], 'idmission', $idmission, 'type_player', $typePlayer, 'iduser');
$idjoueur = $idjoueur[0]->idcombat_player;

// on récupère la carte a jouer
$BD->setUsedTable('carte');
$carte = $BD->select('idcarte', $idcarte);

// on l'ajoute a la main du joueur
$BD->setUsedTable('main_combat');
$BD->addCarteMain($idjoueur, $idcarte);

// on met a jour le nbr de carte restante
$BD->setUsedTable('deck_combat');
$deck = $BD->select('idcombat_player', $idjoueur);
$BD->update('nb_carte_courant', ($deck->nb_carte_courant-1), 'idcombat_player', $idjoueur);

echo json_encode($carte);
?>