<?php
session_start();
header('Content-Type: application/json'); // JSON döneceğiz

$dogru_kullanici = "admin";
$dogru_sifre = "1234";

// POST kontrolü
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $kullanici = $_POST["kullanici"] ?? '';
    $sifre = $_POST["sifre"] ?? '';

    if ($kullanici === $dogru_kullanici && $sifre === $dogru_sifre) {
        $_SESSION["giris"] = true;
        echo json_encode(["success" => true]);
        exit();
    } else {
        echo json_encode(["success" => false, "message" => "Kullanıcı adı veya şifre yanlış."]);
        exit();
    }
} else {
    echo json_encode(["success" => false, "message" => "Geçersiz istek."]);
}
