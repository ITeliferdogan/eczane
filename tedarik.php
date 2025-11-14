<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($_POST['islem'] == 'listele') {

        $arama = isset($_POST['arama']) ? $_POST['arama'] : '';

        if (empty($arama)) {
            $sql = "SELECT * FROM tedarik ORDER BY idtedarik DESC";
            $stmt = $conn->prepare($sql);
        } else {
            $arama = "%$arama%";
            $sql = "SELECT * FROM tedarik 
                    WHERE ad LIKE ? OR firma_adi LIKE ?
                    ORDER BY idtedarik DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $arama, $arama);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $tedarikciler = [];
        while ($row = $result->fetch_assoc()) {
            $tedarikciler[] = $row;
        }

        echo json_encode($tedarikciler);
        $stmt->close();
    }

    elseif ($_POST['islem'] == 'ekle') {

        $ad = $_POST['ad'];
        $firma_adi = $_POST['firma_adi'];
        $telefon = $_POST['telefon'];

        if (empty($ad) || empty($firma_adi) || empty($telefon)) {
            echo "Lütfen tüm alanları doldurun!";
            exit;
        }

        $stmt = $conn->prepare("INSERT INTO tedarik (ad, firma_adi, telefon) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $ad, $firma_adi, $telefon);

        if ($stmt->execute()) {
            echo "Yeni tedarikçi başarıyla eklendi!";
        } else {
            echo "Tedarikçi eklenirken hata oluştu!";
        }

        $stmt->close();
    }

    elseif ($_POST['islem'] == 'sil') {

        $id = intval($_POST['id']);

        if ($id <= 0) {
            echo "Geçersiz ID!";
            exit;
        }

        $stmt = $conn->prepare("DELETE FROM tedarik WHERE idtedarik = ?");
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo "Tedarikçi başarıyla silindi!";
        } else {
            echo "Tedarikçi silinirken hata oluştu!";
        }

        $stmt->close();
    }

}

$conn->close();
?>
