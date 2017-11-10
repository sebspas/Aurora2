<?php
session_start();
ini_set('error_reporting', E_ALL);
ini_set('display_errors',1);
require_once('../Bd.class.php');

header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');

extract($_GET);

$BD = new BD('planet');
$listPlanetes= $BD->selectAll();

$BD->setUsedTable('user');
$user = $BD->select('iduser', $_SESSION['iduser']);

// on ajoute l'info si il y a une mission nouvelles sur la planètes
$BD->setUsedTable('effectue');
$isNew = false;

foreach($listPlanetes as $p) {
    $BD->setUsedTable('mission');
    $listmissions = $BD->selectMult('idplanet', $p->idplanet);
    $BD->setUsedTable('effectue');
    foreach($listmissions as $m) {

        $ress = $BD->selectTwoParam('idmission', $m->idmission, 'iduser', $_SESSION['iduser'], 'iduser');

        if (!isset($ress[0]) && $user->levelquest >= $m->levelquest) {
            $isNew = true;
        } else {
            $isNew = false;
        }
    }

   if ($isNew) {
       $p->new = true;
   } else {
       $p->new = false;
   }
    $isNew = false;
}


echo json_encode($listPlanetes);
?>