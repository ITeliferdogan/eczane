<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($_POST['islem'] == 'listele') {

        $arama = isset($_POST['arama']) ? $_POST['arama'] : '';

        if (empty($arama)) {
            $sql = "SELECT * FROM personel ORDER BY idpersonel DESC";
            $stmt = $conn->prepare($sql);
        } else {
            $arama = "%$arama%";
            $sql = "SELECT * FROM personel 
                    WHERE ad LIKE ? OR soyad LIKE ? OR telefon LIKE ? 
                    ORDER BY idpersonel DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $arama, $arama, $arama);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $personeller = [];
        while ($row = $result->fetch_assoc()) {
            $personeller[] = $row;
        }

        echo json_encode($personeller);
        $stmt->close();
    }

    elseif ($_POST['islem'] == 'ekle') {

        $ad = $_POST['ad'];
        $soyad = $_POST['soyad'];
        $telefon = $_POST['telefon'];

        if (empty($ad) || empty($soyad) || empty($telefon)) {
            echo "Lütfen tüm alanları doldurun!";
            exit;
        }

        $stmt = $conn->prepare("INSERT INTO personel (ad, soyad, telefon) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $ad, $soyad, $telefon);

        if ($stmt->execute()) {
            echo "Yeni personel başarıyla eklendi!";
        } else {
            echo "Personel eklenirken hata oluştu!";
        }

        $stmt->close();
    }

}

$conn->close();
?>
