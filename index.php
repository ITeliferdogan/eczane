<?php
session_start();
if (!isset($_SESSION["giris"])) {
    header("Location: login.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Eczane Otomasyonu</title>
    <style>
        body {font-family:Arial,sans-serif;margin:0;padding:0;background:#f5f7fa;}
        nav {background:#34495e;padding:15px;text-align:center;}
        nav a {color:#fff;margin:0 15px;text-decoration:none;font-weight:bold;}
        .content {text-align:center;margin-top:50px;}
    </style>
    <link rel="stylesheet" href="app.css?v=2">
</head>
<body>
<nav>
    <a href="index.php">Ana Sayfa</a>
    <a href="hasta.html">Hasta Yönetimi</a>
    <a href="ilacstok.html">İlaç Stok Yönetimi</a>
    <a href="recete.html">Reçete Yönetimi</a>
    <a href="kasa.html">Kasa Yönetimi</a>
    <a href="personel.html">Personel Yönetimi</a>
    <a href="tedarik.html">Tedarikçiler</a>
    <a href="logout.php" style="color:red;">Çıkış Yap</a>
</nav>
<script src="app.js"></script>
<div class="content">
    <h1>Eczane yönetiminiz, tek bir yerde.</h1>
    <p>Günlük işlemlerinize hızlıca ulaşın ve eczanenizi kolayca yönetin.</p>
    <div class="dashboard-links">
        <a href="hasta.html">Hasta Yönetimi</a>
        <a href="ilacstok.html">İlaç Stok Yönetimi</a>
        <a href="recete.html">Reçete Yönetimi</a>
        <a href="kasa.html">Kasa Yönetimi</a>
        <a href="personel.html">Personel Yönetimi</a>
        <a href="tedarik.html">Tedarikçi Yönetimi</a>
    </div>
</div>
</body>
</html>
