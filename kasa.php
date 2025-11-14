<?php
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($_POST['islem'] == 'listele') {

        $tarih1 = $_POST['tarih1'];
        $tarih2 = $_POST['tarih2'];

        if (!empty($tarih1) && !empty($tarih2)) {
            $sql = "SELECT idkasa, toplam_bakiye, recete_id, siptarih
                    FROM kasa
                    WHERE DATE(siptarih) BETWEEN ? AND ?
                    ORDER BY siptarih DESC";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $tarih1, $tarih2);
        } else {
            $sql = "SELECT idkasa, toplam_bakiye, recete_id, siptarih
                    FROM kasa
                    ORDER BY siptarih DESC";
            $stmt = $conn->prepare($sql);
        }

        $stmt->execute();
        $result = $stmt->get_result();

        $kasalar = [];
        while ($row = $result->fetch_assoc()) {
            $kasalar[] = $row;
        }
        echo json_encode($kasalar);

        $stmt->close();
    }
}

$conn->close();
?>
