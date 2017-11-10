<?php
session_start();
ini_set('error_reporting', E_ALL);
ini_set('display_errors',1);
require_once('../Bd.class.php');

extract($_GET);
// on crée le "combat_player"
$BD = new BD('combat_player');

// On verifie si il n'existe pas déjà un combat
$idjoueur = $BD->selectTreeParam('iduser', $_SESSION['iduser'], 'idmission', $idmission, 'type_player', 1, 'iduser');
if (isset($idjoueur) && !empty($idjoueur)) {

    // si oui on supprime tout
    $idjoueur = $idjoueur[0]->idcombat_player;

    $BD->setUsedTable('adversaire_combat');
    $idIA = $BD->select('idcombat_player1', $idjoueur);
    $idIA = $idIA->idcombat_player2;

    // on suppr les vaisseaux
    $BD->setUsedTable('vaisseau_combat');
    $BD->delete('idcombat_player', $idjoueur);
    $BD->delete('idcombat_player', $idIA);
    // on suppr les decks
    $BD->setUsedTable('deck_combat');
    $BD->delete('idcombat_player', $idjoueur);
    $BD->delete('idcombat_player', $idIA);
    // on suppr les effets
    $BD->setUsedTable('effet');
    $BD->delete('idcombat_player', $idjoueur);
    $BD->delete('idcombat_player', $idIA);
    // on suppr les mains
    $BD->setUsedTable('main_combat');
    $BD->delete('idcombat_player', $idjoueur);
    $BD->delete('idcombat_player', $idIA);
    // on supr les adversaires
    $BD->setUsedTable('adversaire_combat');
    $BD->delete('idcombat_player1', $idjoueur);
    // on suppr les joueur
    $BD->setUsedTable('combat_player');
    $BD->delete('idcombat_player', $idjoueur);
    $BD->delete('idcombat_player', $idIA);
}
// sinon on crée le combat normalement

/************************************
 *
 *  INITIALISATION IA ET JOUEUR
 *
 *
 */

// on crée l'IA
$BD->creeCombatPlayer(
    0 /* Tour de l'IA */,
    1 /* type de combat */,
    0 /* IA */,
    0,
    $idmission,
    $_SESSION['iduser']);

// on selectionne l'IA précedement crée, idmission + iduser
$idennemi = $BD->selectTwoParam('iduser', $_SESSION['iduser'], 'idmission', $idmission, 'iduser');
$idennemi = $idennemi[0]->idcombat_player;

// on crée le joueur
$BD->creeCombatPlayer(
    1,
    1 /* IA */,
    1 /* joueur */,
    0,
    $idmission,
    $_SESSION['iduser']);

$idjoueur = $BD->selectTreeParam('iduser', $_SESSION['iduser'], 'idmission', $idmission, 'type_player', 1, 'iduser');
$idjoueur = $idjoueur[0]->idcombat_player;


// on met à jour l'adversaire de l'IA et du joueur
$BD->setUsedTable('adversaire_combat');
$BD->addAdversaire($idjoueur, $idennemi);

/************************************
 *
 *  INITIALISATION VAISSEAUX
 *
 *
 */
// création du vaisseau du joueur
$BD->setUsedTable('vaisseau_combat');

$BD->creeCombatVaisseau(
    $vaisseau['nom'],
    $vaisseau['pv'],
    $vaisseau['attaque'],
    $vaisseau['defense'],
    $vaisseau['type'],
    $vaisseau['image'],
    $vaisseau['level'],
    $vaisseau['bouclier'],
    $vaisseau['idfaction'],
    $idjoueur
);

// création du vaisseau ennemie
//on récupère les infos du vaisseau dans la db correspondant à la mission
$BD->setUsedTable('ennemi');
$idIA = $BD->select('idmission', $idmission);
$BD->setUsedTable('IA');
$ennemi = $BD->select('idIA', $idIA->idIA);

$BD->creeCombatVaisseau(
    $ennemi->nom,
    $ennemi->pv,
    $ennemi->attaque,
    $ennemi->defense,
    $ennemi->type,
    $ennemi->image,
    $ennemi->level,
    $ennemi->bouclier,
    $ennemi->idfaction,
    $idennemi
);
/************************************
 *
 *  INITIALISATION DECK
 *
 *
 */
$BD->setUsedTable('deck_combat');
// deck joueur
$BD->creeCombatDeckComabt(
    20,
    20,
    0,
    $idjoueur,
    1
);

// deck IA
$BD->creeCombatDeckComabt(
    20,
    20,
    0,
    $idennemi,
    1
);
// on récupére tout les id des cartes du deck dans le tableau
$tabCartesJoueur = array();
$tabCartesIA = array();

// A MODIFIER LORSQUE PLUISIEURS DECK
// Joueur
$BD->setUsedTable('carte_has_deck');
$tabCartesTmp = $BD->selectMult('iddeck', 1);

foreach ($tabCartesTmp as $c) {
    array_push($tabCartesJoueur, $c->idcarte);
}
// IA
$tabCartesTmp = $BD->selectMult('iddeck', 1);

foreach ($tabCartesTmp as $c) {
    array_push($tabCartesIA, $c->idcarte);
}
// on mélange le deck
// on récupére le tableau de numéro de carte
shuffle($tabCartesJoueur);
shuffle($tabCartesIA);

$tabCombat['idcombatJoueur'] = $idjoueur;
$tabCombat['idcombatIa'] = $idIA;
$tabCombat['tabCartesJoueur'] = $tabCartesJoueur;
$tabCombat['tabCartesIA'] = $tabCartesIA;

echo json_encode($tabCombat);

?>