<?php
// Recuperation de la dernière news
require_once 'app/core/Bd.class.php';
$BD = new BD('news');
$news = $BD->selectLastNews();


if (isset($_SESSION['iduser'])) {
	header('Location: index.php?page=home');
}

require_once(Config::$path['views'].'login.php');
?>