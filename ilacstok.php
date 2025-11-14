<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($_POST['islem'] == 'listele') {

        $arama = isset($_POST['arama']) ? $_POST['arama'] : '';

        if (empty($arama)) {
            $sql = "SELECT s.idstok, i.ilac_adi, s.stok_miktari, s.son_kullanma_tarihi, s.fiyat
                    FROM ilac_stok s
                    JOIN ilacadi i ON s.idilacadi = i.idilacadi
                    ORDER BY s.idstok DESC";
            $stmt = $conn->prepare($sql);
        } else {
            $arama = "%$arama%";
            $sql = "SELECT s.idstok, i.ilac_adi, s.stok_miktari, s.son_kullanma_tarihi, s.fiyat
                    FROM ilac_stok s
                    JOIN ilacadi i ON s.idilacadi = i.idilacadi
                    WHERE i.ilac_adi LIKE ?
                    ORDER BY s.idstok DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $arama);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $ilaclar = [];
        while ($row = $result->fetch_assoc()) {
            $ilaclar[] = $row;
        }

        echo json_encode($ilaclar);

    } elseif ($_POST['islem'] == 'ekle') {

        $ilac_adi = $_POST['ilac_adi'];
        $stok_miktari = $_POST['stok_miktari'];
        $son_kullanma_tarihi = $_POST['son_kullanma_tarihi'];
        $fiyat = $_POST['fiyat'];

        if (empty($ilac_adi) || empty($stok_miktari) || empty($son_kullanma_tarihi) || empty($fiyat)) {
            echo "Lütfen tüm alanları doldurun!";
            exit;
        }

        // İlaç adı mevcut mu kontrolü
        $stmt = $conn->prepare("SELECT idilacadi FROM ilacadi WHERE ilac_adi = ?");
        $stmt->bind_param("s", $ilac_adi);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $stmt->bind_result($idilacadi);
            $stmt->fetch();
        } else {
            // Yeni ilaç adını ekle
            $stmt_insert = $conn->prepare("INSERT INTO ilacadi (ilac_adi) VALUES (?)");
            $stmt_insert->bind_param("s", $ilac_adi);
            $stmt_insert->execute();
            $idilacadi = $stmt_insert->insert_id;
            $stmt_insert->close();
        }
        $stmt->close();

        // İlaç stoğuna ekle
        $stmt_stok = $conn->prepare("INSERT INTO ilac_stok (idilacadi, stok_miktari, son_kullanma_tarihi, fiyat) VALUES (?, ?, ?, ?)");
        $stmt_stok->bind_param("iisd", $idilacadi, $stok_miktari, $son_kullanma_tarihi, $fiyat);

        if ($stmt_stok->execute()) {
            echo "İlaç stoğu başarıyla eklendi!";
        } else {
            echo "Stok eklenirken bir hata oluştu!";
        }

        $stmt_stok->close();
    }
}

$conn->close();
?>
