<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $islem = $_POST['islem'];

    if ($islem == 'hastalari_getir') {
        // Hasta listesini getir (dropdown için)
        $sql = "SELECT idhasta, ad, soyad FROM hasta ORDER BY ad ASC";
        $result = $conn->query($sql);

        $hastalar = [];
        while ($row = $result->fetch_assoc()) {
            $hastalar[] = $row;
        }
        echo json_encode($hastalar);
    }

    elseif ($islem == 'listele') {
        $arama = isset($_POST['arama']) ? $_POST['arama'] : '';

        if (empty($arama)) {
            $sql = "SELECT r.idrecete, r.recete_tarihi, h.ad, h.soyad
                    FROM recete r
                    JOIN hasta h ON r.idhasta = h.idhasta
                    ORDER BY r.idrecete DESC";
            $stmt = $conn->prepare($sql);
        } else {
            $arama = "%$arama%";
            $sql = "SELECT r.idrecete, r.recete_tarihi, h.ad, h.soyad
                    FROM recete r
                    JOIN hasta h ON r.idhasta = h.idhasta
                    WHERE h.ad LIKE ? OR h.soyad LIKE ?
                    ORDER BY r.idrecete DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $arama, $arama);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $receteler = [];
        while ($row = $result->fetch_assoc()) {
            $receteler[] = $row;
        }
        echo json_encode($receteler);
    }

    elseif ($islem == 'ekle') {
        $idhasta = $_POST['idhasta'];
        $recete_tarihi = $_POST['recete_tarihi'];

        if (empty($idhasta) || empty($recete_tarihi)) {
            echo "Lütfen hasta ve reçete tarihini seçin!";
            exit;
        }

        $stmt = $conn->prepare("INSERT INTO recete (idhasta, recete_tarihi) VALUES (?, ?)");
        $stmt->bind_param("is", $idhasta, $recete_tarihi);

        if ($stmt->execute()) {
            echo "Reçete başarıyla oluşturuldu!";
        } else {
            echo "Reçete oluşturulurken bir hata oluştu!";
        }

        $stmt->close();
    }

}

$conn->close();
?>
