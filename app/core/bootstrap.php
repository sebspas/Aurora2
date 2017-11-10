<?php
    /**
     * Created by PhpStorm.
     * User: jonathan
     * Date: 06/09/15
     * Time: 22:49
     */


    /**
     * Fichier Bootstrap
     *
     * Toutes les variables et constantes propres à l'application doivent êtres définies ici.
     * Elles seront accessibles dans toute l'application.
     */


    /* CONFIG */
    define ('CONFIG', APP . 'config' . DS);

    /* TMP */
    define ('TMP', 'tmp' . DS);

    /* CONTENT */
    define ('CONTENT', 'app' . DS . 'content' . DS);
    define ('CONTROLLER', CONTENT . 'controller' . DS);
    define ('MODEL', CONTENT . 'model' . DS);
    define ('LAYOUT', CONTENT . 'layout' . DS);
    define ('VIEW', CONTENT . 'view' . DS);


    /* WEBROOT */
    define ('WEBROOT', 'webroot' . DS);
    define ('CSS', WEBROOT . 'css' . DS);
    define ('FONT', WEBROOT . 'font' . DS);
    define ('IMG', WEBROOT . 'images' . DS);
    define ('VID', WEBROOT . 'vid' . DS);
    define ('JS', WEBROOT . 'js' . DS);
    define ('UPLOAD', WEBROOT . 'uploads' . DS);