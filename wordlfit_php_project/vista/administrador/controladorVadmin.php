<?php

if (!isset($_SESSION)) session_start();

if (!isset($_SESSION['id'])) {
    header("location: ../vista/inicioSesion.php");

} else {
    if ($_SESSION['id'] == "") {
        header("location: ../vista/inicioSesion.php");
    }
}

// Identificador de secciones para los admins.
$seccion_admin = "seccionAd1"; //Sección por defecto.

if (isset($_GET['seccionAd'])) {
    $seccion_admin = $_GET['seccionAd'];
}


include ("plantillaAdmin.php");
