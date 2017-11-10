<?php
/**
 * Class bd()
 *
 * Classe permetant de se connecter et d'effectuer des opérations sur la base de donnée
 * @package Core
 * @subpackage Class
 * @author Team
 */
class BD {
    /** @var PDO Connexion a la base de donner */
    private static $db = null;
    /** @var string Nom de la table a laquelle est connecter la classe bd */
    var $table;
    
    /**
     * Function __construct()
     *
     * Constructeur par défaut de la class bd
     * @param string $table Le nom de la table a laquel se connecter.
     */
    public function __construct($table){
        if (self::$db == null) {
            try {
                self::$db = new PDO('mysql:host=127.0.0.1;dbname=Aurora', 'root', 'aqwEDCtgb7;');
                self::$db->exec('SET CHARACTER SET utf8');
                if(true)
                    self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
            } catch(Exception $e) {
                exit('Error to DB connection : ' . $e->getMessage());
            }
        }
        $this->table = $table;
    }

    /**
     * Function checkPassword()
     * Vérifie que password entré par l'utilisateur correspond au password hashé en BD concernant cet utilisateur.
     *
     * @param String $password     : mot de passe à tester
     * @param String $salt         : salt de l'utilisateur enregistré en BD ($user->salt)
     * @param String $userPassword : mot de passe hashé en BD de l'utilisateur ($user->password)
     *
     * @return bool
     */
    function checkPassword ($password, $salt, $userPassword) {

        $sha512Password = hash ("sha512", $password . $salt);

        return $sha512Password === $userPassword;
    }

    /**
     * Function getUsedTable()
     *
     * Permet de connaitre la table sur laquel on travail
     */
    function getUsedTable() {
        return $this->table;
    } // getusedTable()

    /**
     * Function setUsedTable()
     *
     * Permet de modifier la table sur laquel on effectue les opérations
     * @param string $table Le nom de la nouvelle table a laquel se connecter
     */
    function setUsedTable($table) {
        $this->table = $table;
    }// setUsedTable()


    /**
     * Function select()
     *
     * Effectue une simple requete sur la table et recupere le tuple concerner, pour acceder
     * a un element de resultat il suffit de faire $result->ID_U par exemple
     * @param string $cond_att Le nom de la colonne (ex: NOM)
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: Jean)
     */
    function select($cond_att,$cond_val) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();
        
        return $donnees;
    } // select()

    function selectLastNews() {
        $req = self::$db->prepare("SELECT * FROM $this->table ORDER BY date DESC LIMIT 1");

        $req->execute();
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    }

    function selectNumber($orderatt, $start, $number,$order = 'DESC') {
    	$stop = $number;
        $req = self::$db->prepare("SELECT * FROM $this->table ORDER BY $orderatt $order LIMIT $start,$stop");

        $req->execute();
        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();
        
        return $donnees;
    } // selectNumber()

    function selectNumberWhere($orderatt, $start, $number, $cond_att, $cond_val, $order = 'DESC') {
    	$stop = $number;
        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ? ORDER BY $orderatt $order LIMIT $start,$stop");

        $req->execute(array($cond_val));
        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();
        
        return $donnees;
    } // selectNumberWhere()

    /**
     * Function count()
     *
     * Effectue une simple requete sur la table, 
     * elle renvoie le nbr d'element
     * @param string $cond_att Le nom de la colonne (ex: NOM)
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: Jean)
     */
    function count($cond_att,$cond_val) {

        $req = self::$db->prepare("SELECT COUNT(*) as nb FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->nb;
    } // count()

    function count2($cond_att,$cond_val,$cond_att2,$cond_val2) {

        $req = self::$db->prepare("SELECT COUNT(*) as nb FROM $this->table WHERE $cond_att = ? AND $cond_att2 = ?");

        $req->execute(array($cond_val,$cond_val2));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->nb;
    } // count()

    function countAll() {

        $req = self::$db->prepare("SELECT COUNT(*) as nb FROM $this->table");

        $req->execute();
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->nb;
    } // count()

    function selectEnergie($cond_att, $cond_val) {
        $req = self::$db->prepare("SELECT `energie` FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->energie;  
    }

    function selectMoney($cond_att, $cond_val) {
        $req = self::$db->prepare("SELECT `money` FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->money;  
    }
    /**
     * Function selectAttribut()
     *
     * Effectue une simple requete sur la table et recupere l'attribut choisi du tuple concerné
     * @param string $att_select Le nom de l'attribut selectionné (ex: NOM)
     * @param string $cond_att Le nom de la colonne (ex: NOM)
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: Jean)
     */
    function selectAttribut($att_select, $cond_att, $cond_val) {

        $req = self::$db->prepare("SELECT ? FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($att_select, $cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // select()

    function selectAllWithInfo($cond_att, $cond_val, $cond_att_t, $cond_val_t, $contenu_link) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ? OR $cond_att_t = ? ORDER BY $contenu_link DESC");

        $req->execute(array($cond_val, $cond_val_t));
        $donnees = $req->fetchAll(PDO::FETCH_OBJ);
        $req->closeCursor();

        return $donnees;
    } // select()

    /**
     * Function selectAll()
     *
     * Recupere tout les tuples de la table sur laquel on effectue les operations,les renvoie dans 
     * un tableau ou chaque case et un tuple
     */
    function selectAll($orderatt = 'DESC') {

        $req = self::$db->prepare("SELECT * FROM $this->table ORDER BY ? ");

        $req->execute(array($orderatt));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectAll()

    function selectAllClass() {

        $req = self::$db->prepare("SELECT * FROM `user` ORDER BY `user`.`points` DESC LIMIT 0,10");

        $req->execute();

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectAllClass()

    function selectAllAsc($orderatt) {
        if (isset($orderatt)) {
            $req = self::$db->prepare("SELECT * FROM $this->table ORDER BY $orderatt ASC"); 
            $req->execute();

            $donnees = $req->fetchAll(PDO::FETCH_OBJ);

            $req->closeCursor();

            return $donnees;
        }

        $req = self::$db->prepare("SELECT * FROM $this->table");

        $req->execute();

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectAll()

    function selectAllDesc($orderatt) {
        if (isset($orderatt)) {
            $req = self::$db->prepare("SELECT * FROM $this->table ORDER BY $orderatt DESC");
            $req->execute();

            $donnees = $req->fetchAll(PDO::FETCH_OBJ);

            $req->closeCursor();

            return $donnees;
        }

        $req = self::$db->prepare("SELECT * FROM $this->table");

        $req->execute();

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectAll()

    function selectAmis($iduser) {
        $req = self::$db->prepare("SELECT A1.iduser2 FROM amis A1
                            WHERE A1.iduser1 = ? AND A1.iduser1 IN ( SELECT A2.iduser2
                                                                     FROM amis A2
                                                                     WHERE A2.iduser2 = ? ) ");
        $req->execute(array($iduser,$iduser));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    }
    /**
     * Function selectMult()
     *
     * Recupere tout les tuples de la table sur laquel on effectue les operations,les renvoie dans 
     * un tableau ou chaque case et un tuple
     */
    function selectMult($cond_att,$cond_val) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectMult()

    function selectMultLimit($cond_att,$cond_val, $limit) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ? LIMIT $limit");

        $req->execute(array($cond_val));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectMult()

    function selectMissionUser($cond_att,$cond_val,$levelquest) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE ($cond_att = ? AND levelquest <= ?)");

        $req->execute(array($cond_val, $levelquest));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectMult()
    /**
     * Function selectTwoParam()
     *
     * Recupere tout les tuples de la table sur laquel on effectue les operations,les renvoie dans 
     * un tableau ou chaque case et un tuple depuis la table trajet correspondant aux parametres
     */
    function selectTwoParam($cond_att,$cond_val,$cond_att2,$cond_val2,$orderatt) {

            $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ? AND $cond_att2 = ? ORDER BY $orderatt ASC");

            $req->execute(array($cond_val,$cond_val2));

            $donnees = $req->fetchAll(PDO::FETCH_OBJ);

            $req->closeCursor();

            return $donnees;
    } // selectTwoParam()

    /**
     * Function selectTreeParam()
     *
     * Recupere tout les tuples de la table sur laquel on effectue les operations,les renvoie dans
     * un tableau ou chaque case et un tuple depuis la table trajet correspondant aux parametres
     */
    function selectTreeParam($cond_att,$cond_val,$cond_att2,$cond_val2, $cond_att3,$cond_val3,$orderatt) {

        $req = self::$db->prepare("SELECT * FROM $this->table WHERE $cond_att = ? AND $cond_att2 = ? AND $cond_att3 = ? ORDER BY $orderatt ASC");

        $req->execute(array($cond_val,$cond_val2,$cond_val3));

        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    } // selectTwoParam()


    /**
     * Function addUser()
     *
     * Ajoute un utilisateur dans la base de donnees a l'aide des infos fournis
     * @param string $Nom Le nom de l'utilisateur
     * @param string $Nom Le prenom de l'utilisateur
     * @param int $Age L'age de l'utilisateur
     * @param int $Tel Le tel de l'utilisateur
     * @param string $Mail L'adresse mail de l'utilisateur
     * @param string $Pass Le mot de passe non hasher
     */
    function addUser($Pseudo, $email, $Pass) {
        $req = self::$db->prepare("INSERT INTO `user`
            (pseudo, email, passwd, salt, avatar)
             VALUES (?,?,?,?, ?)");


        $salt = hash("sha256", uniqid("dfvghbjn", true));
        $Pass = hash ("sha512", $Pass . $salt);

        $req->execute(array($Pseudo,$email,$Pass, $salt,'http://51.255.41.18/Aurora/asset/images/avatar/default.png'));

        $req->closeCursor();
    } // addUser()

    function creeCombatPlayer($tour, $type_combat, $type_player, $pioche, $idmission, $iduser) {
        $req = self::$db->prepare("INSERT INTO `combat_player`
            (tour, type_combat, type_player, pioche, idmission, iduser)
             VALUES (?,?,?,?,?,?)");

        $req->execute(array($tour, $type_combat, $type_player, $pioche, $idmission, $iduser));

        $req->closeCursor();
    } // creeCombatPlayer()

    function creeCombatVaisseau($nom, $pv, $attaque, $defense, $type, $image, $level, $bouclier, $idfaction, $idcombat_player) {
        $req = self::$db->prepare("INSERT INTO `vaisseau_combat`
            (nom, pv, attaque, defense, type, image, level, bouclier, idfaction, idcombat_player)
             VALUES (?,?,?,?,?,?,?, ?,?,?)");

        $req->execute(array($nom, $pv, $attaque, $defense, $type, $image, $level, $bouclier, $idfaction, $idcombat_player));

        $req->closeCursor();
    } // creeCombatVaisseau()

    function creeCombatDeckComabt($nb_carte_max, $nb_carte_courant, $nb_carte_joue, $idcombat_player, $iddeck) {
        $req = self::$db->prepare("INSERT INTO `deck_combat`
            (nb_carte_max, nb_carte_courant, nb_carte_joue, idcombat_player, iddeck)
             VALUES (?,?,?,?,?)");

        $req->execute(array($nb_carte_max, $nb_carte_courant, $nb_carte_joue, $idcombat_player, $iddeck));

        $req->closeCursor();
    } // creeCombatVaisseau()

    // création et ajout d'un champ ressources pour l'utilisateur
    function addRessUser($iduser) {
        $req = self::$db->prepare("INSERT INTO `ressources_joueur`
            (aqua, ruby, emerald, topaz, money, iduser)
             VALUES (?,?,?,?,?, ?)");

        $req->execute(array(100, 100, 100, 100, 1000, $iduser));

        $req->closeCursor();
    }

    function addCo($iduser) {
        $req = self::$db->prepare("INSERT INTO `connecté` 
            (iduser, lastco)
            VALUES (? , CURRENT_TIMESTAMP)");

        $req->execute(array($iduser));

        $req->closeCursor();
    }

    function addAdversaire($idcombat1, $idcombat2) {
        $req = self::$db->prepare("INSERT INTO `adversaire_combat`
            (idcombat_player1, idcombat_player2)
            VALUES (? , ?)");

        $req->execute(array($idcombat1, $idcombat2));

        $req->closeCursor();
    }

    function addCarteMain($idcombat_player, $idcarte) {
        $req = self::$db->prepare("INSERT INTO `main_combat`
            (idcombat_player, idcarte)
            VALUES (? , ?)");

        $req->execute(array($idcombat_player, $idcarte));

        $req->closeCursor();
    }

    function addVaisseau($nom,$description,$pv,$attaque,$defense,$xp,$nextlevel,$type,$image,$idfaction,$iduser) {
        $req = self::$db->prepare("INSERT INTO `vaisseau`
            (nom, `desc`, pv, attaque, defense, xp, nextlevel, type, image, idfaction, iduser)
             VALUES (?,?,?,?,?,?,?,?,?,?,?)");
        $req->execute(array($nom,$description,$pv,$attaque,$defense,$xp,$nextlevel,$type,$image,$idfaction,$iduser));

        $req->closeCursor();
    }


    function addItem($iduser,$iditem) {
        $req = self::$db->prepare("INSERT INTO `equipement`
            (iduser, idiitem)
             VALUES (?,?)");
        $req->execute(array($iduser,$iditem));
        $req->closeCursor();
    }
    
    function addEffectue($iduser,$idmission) {
        $req = self::$db->prepare("INSERT INTO `effectue`
            (iduser, idmission)
             VALUES (?,?)");
        $req->execute(array($iduser,$idmission));
        $req->closeCursor();
    }
    /**
     * Function update()
     *
     * Met a jour la valeur de l'attribut passer en parametre, pour le tuple respectant la condition
     * elle aussi donnee en parametre
     * @param string $att Le nom de l'attribut a modifier (ex: "Age")
     * @param mixed $att_val La valeur de l'attribut a modifier' (ex: 19)
     * @param string $cond_att Le nom de la colonne (ex: "NOM")
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: "Jean")
     */
    function update($att,$att_val,$cond_att,$cond_val) {
        
        $req = self::$db->prepare("UPDATE $this->table SET $att = ? WHERE $cond_att = ?");

        $req->execute(array($att_val,$cond_val));

        $req->closeCursor();
    } // update()

    function updateOr($val) {
        $req = self::$db->prepare("UPDATE $this->table SET `or` = ? WHERE 'iduser' = ? ");

        $req->execute(array($val,$_SESSION['iduser']));

        $req->closeCursor();      
    }
    /**
     * Function inc()
     *
     * Met a jour la valeur de l'attribut passer en parametre, pour le tuple respectant la condition
     * elle aussi donnee en parametre
     * @param string $att Le nom de l'attribut a modifier (ex: "Age")
     * @param string $cond_att Le nom de la colonne (ex: "NOM")
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: "Jean")
     */
    function inc($att,$cond_att,$cond_val) {
        
        $req = self::$db->prepare("UPDATE $this->table SET $att = $att + 1 WHERE $cond_att = ?");

        $req->execute(array($cond_val));

        $req->closeCursor();
    } // inc()

    /**
     * Function decr()
     *
     * Met a jour la valeur de l'attribut passer en parametre, pour le tuple respectant la condition
     * elle aussi donnee en parametre
     * @param string $att Le nom de l'attribut a modifier (ex: "Age")
     * @param string $cond_att Le nom de la colonne (ex: "NOM")
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: "Jean")
     */
    function decr($att,$cond_att,$cond_val) {
        
        $req = self::$db->prepare("UPDATE $this->table SET $att = $att - 1 WHERE $cond_att = ?");

        $req->execute(array($cond_val));

        $req->closeCursor();
    } // decr()

    /**
     * Function delete()
     *
     * Supprime le tuple pour la condition donnee
     * @param string $cond_att Le nom de la colonne (ex: "NOM")
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: "Jean")
     */
    function delete($cond_att,$cond_val = null) {
    
        $req = self::$db->prepare("DELETE FROM $this->table WHERE $cond_att = ?");

        $req->execute(array($cond_val));

        $req->closeCursor();
    } // delete()

    function deleteTwoParam($cond_att,$cond_val = null,$cond_att2,$cond_val2 = null) {
        $req = self::$db->prepare("DELETE FROM $this->table WHERE $cond_att = ? AND $cond_att2 = ?");

        $req->execute(array($cond_val,$cond_val2));

        $req->closeCursor();
    }

    /**
     * Function isInBd()
     *
     * Renvoie vrai ou faux si le tuple est présent dans la base pour la condition donnée
     * @param string $cond_att Le nom de la colonne (ex: "NOM")
     * @param mixed $cond_val La valeur de la colonne rechercher (ex: "Jean")
     */
    function isInDb($cond_att,$cond_val)
    {
        $req = self::$db->prepare("SELECT COUNT(*) as nbr FROM $this->table WHERE $cond_att = ?");
        $req->execute(array($cond_val));
        $donnees = $req->fetch(PDO::FETCH_OBJ);
        if ($donnees->nbr)
        {
            $req->closeCursor();
            return true;
        }
        else
        {
            $req->closeCursor();
            return false;
        }
    } // isInDb()

    function checkMsgAuteur() {
        $req = self::$db->prepare("SELECT COUNT(*) as nbr FROM messagerie m1, messagerie m2 
                                    WHERE m1.idauteur = ? 
                                    AND m2.luAuteur = 1 
                                    AND m2.idmessage = m1.idmessage");
        $req->execute(array($_SESSION['iduser']));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->nbr;
    }

    function checkMsgDestinataire() {
        $req = self::$db->prepare("SELECT COUNT(*) as nbr FROM messagerie m1, messagerie m2 
                                    WHERE m1.iddestinataire = ? 
                                    AND m2.luDestinataire = 1 
                                    AND m2.idmessage = m1.idmessage");
        $req->execute(array($_SESSION['iduser']));
        $donnees = $req->fetch(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees->nbr;
    }

    function recupTchat($lastid) {
        $req = self::$db->prepare("SELECT * FROM tchat WHERE id > ? ORDER BY `timestamp` ASC");
        
        $req->execute(array($lastid));
        $donnees = $req->fetchAll(PDO::FETCH_OBJ);

        $req->closeCursor();

        return $donnees;
    }
} // class bd()

?>