<?php
	session_start();
	ini_set('error_reporting', E_ALL);
	ini_set('display_errors',1);
	require_once('../Bd.class.php');

	extract($_GET);

	$levelUp = false;

    // On recupere les récompenses de la mission
    $BD = new BD('ressources_mission');
    $ress_mission = $BD->select('idmission', $idmission);

	// on donne l'or recue en récompense
	$BD->setUsedTable('ressources_joueur');
	$ress_joueur = $BD->select('iduser',$_SESSION['iduser']);

    if ($res) {
        // si c'est une victoire on donne toute la récompense
        // update money
        $BD->update('money', ($ress_joueur->money+$ress_mission->money), 'iduser', $_SESSION['iduser']);
        // update aqua
        $BD->update('aqua', ($ress_joueur->aqua+$ress_mission->aqua), 'iduser', $_SESSION['iduser']);
        // update ruby
        $BD->update('ruby', ($ress_joueur->ruby+$ress_mission->ruby), 'iduser', $_SESSION['iduser']);
        // update emerald
        $BD->update('emerald', ($ress_joueur->emerald+$ress_mission->emerald), 'iduser', $_SESSION['iduser']);
        // update topaz
        $BD->update('topaz', ($ress_joueur->topaz+$ress_mission->topaz), 'iduser', $_SESSION['iduser']);
        // update point
        $BD->setUsedTable('user');
        $user = $BD->select('iduser', $_SESSION['iduser']);
        $BD->update('points',$user->points+$points,'iduser',$_SESSION['iduser']);
        // on incrmenete le niveau de ses quêtes si il à réussit et que celui-ci n'est pas inférieur
        // au sien (si il a déjà fait la quete, ou sil il en est plus loin dans l'histoire)
        if ($user->levelquest <= $levelquest) {
            $BD->update('levelquest',$user->levelquest+$levelquestreward,'iduser',$_SESSION['iduser']);
        }

        // on ajoute la mission à la liste des missions effectuées
        $BD->setUsedTable('effectue');
        // on test si la mission n'a pas déja été effectuée ?
        $nbFois = $BD->count2('iduser',$_SESSION['iduser'],'idmission',$idmission);
        if ($nbFois == 0) {
            $BD->addEffectue($_SESSION['iduser'],$idmission);
        }
    } else {
        // si c'est une défaite
        // update money
        $BD->update('money', ($ress_joueur->money+($ress_mission->money/2)), 'iduser', $_SESSION['iduser']);
        // update aqua
        $BD->update('aqua', ($ress_joueur->aqua+($ress_mission->aqua/2)), 'iduser', $_SESSION['iduser']);
        // update ruby
        $BD->update('ruby', ($ress_joueur->ruby+($ress_mission->ruby/2)), 'iduser', $_SESSION['iduser']);
        // update emerald
        $BD->update('emerald', ($ress_joueur->emerald+($ress_mission->emerald/2)), 'iduser', $_SESSION['iduser']);
        // update topaz
        $BD->update('topaz', ($ress_joueur->topaz+($ress_mission->topaz/2)), 'iduser', $_SESSION['iduser']);
        // update point
        $BD->setUsedTable('user');
        $user = $BD->select('iduser', $_SESSION['iduser']);
        $BD->update('points',$user->points+($points/4),'iduser',$_SESSION['iduser']);
    }

    $BD->setUsedTable('user');
	//on définit le vaisseau utilisé comme vaisseau courant
	$BD->update('idvaisseau',$idvaisseau,'iduser',$_SESSION['iduser']);

	// on met à jour l'xp du vaisseau
	$BD->setUsedTable('vaisseau');
	$vaisseau = $BD->select('idvaisseau',$idvaisseau);	
	$BD->update('xp',$vaisseau->xp+$ress_mission->xp,'idvaisseau',$idvaisseau);
	$vaisseau = $BD->select('idvaisseau',$idvaisseau);	
	// on verifie si le vaisseau à level up, si oui on augment ses stats de +5 atk, +2def, +20pv
	$newXp = $vaisseau->xp - $vaisseau->nextlevel;
	// si il a level up on le précise au js et on met à jour ses stats
	if ($newXp >= 0) {
		$levelUp = true;
		$BD->update('nextlevel',(($vaisseau->nextlevel+50)*1.55),'idvaisseau',$idvaisseau);
		$BD->update('level',$vaisseau->level+1,'idvaisseau',$idvaisseau);
		$BD->update('xp',$newXp,'idvaisseau',$idvaisseau);
		$BD->update('pv',$vaisseau->pv+20,'idvaisseau',$idvaisseau);
		$BD->update('defense',$vaisseau->defense+2,'idvaisseau',$idvaisseau);
		$BD->update('attaque',$vaisseau->attaque+5,'idvaisseau',$idvaisseau);
	}
	echo json_encode($levelUp);
?>
