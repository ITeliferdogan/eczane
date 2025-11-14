<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($_POST['islem'] == 'listele') {

        $arama = isset($_POST['arama']) ? $_POST['arama'] : '';

        if (empty($arama)) {
            $sql = "SELECT * FROM hasta ORDER BY idhasta DESC";
            $stmt = $conn->prepare($sql);
        } else {
            $arama = "%$arama%";
            $sql = "SELECT * FROM hasta WHERE ad LIKE ? OR soyad LIKE ? OR hastatc LIKE ? ORDER BY idhasta DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $arama, $arama, $arama);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $hastalar = [];
        while ($row = $result->fetch_assoc()) {
            $hastalar[] = $row;
        }

        echo json_encode($hastalar);

    } elseif ($_POST['islem'] == 'ekle') {

        $ad = $_POST['ad'];
        $soyad = $_POST['soyad'];
        $telefon = $_POST['telefon'];
        $hastatc = $_POST['hastatc'];

        if (empty($ad) || empty($soyad) || empty($hastatc)) {
            echo "Lütfen Ad, Soyad ve TC Kimlik alanlarını doldurun!";
            exit;
        }

        $stmt = $conn->prepare("INSERT INTO hasta (ad, soyad, telefon, hastatc) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $ad, $soyad, $telefon, $hastatc);

        if ($stmt->execute()) {
            echo "Yeni hasta başarıyla eklendi!";
        } else {
            echo "Hasta eklenirken bir hata oluştu!";
        }

        $stmt->close();
    }

}

$conn->close();
?>
