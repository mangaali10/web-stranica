<?php
if (isset($_POST["dodaj"])) {
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $database = "rezultati";

    $conn = new mysqli($dbhost, $dbuser, $dbpass, $database);

    if ($conn->connect_error) {
        die("Greška pri povezivanju: " . $conn->connect_error);
    }

    $ime = $_POST['Ime'];
    $email = $_POST['Email'];
    $username = $_POST['Username'];
    $sifra = $_POST['Sifra'];
    $potvrda_sifre = $_POST['Potvrda_Sifre'];

    // Provjera da li se lozinke poklapaju
    if ($sifra !== $potvrda_sifre) {
        echo '<script type="text/javascript">alert("Lozinke se ne poklapaju.");</script>';
    } else {
        // Hashiranje lozinke i potvrde lozinke
        $hash_sifra = password_hash($sifra, PASSWORD_DEFAULT);
        $hash_potvrda = password_hash($potvrda_sifre, PASSWORD_DEFAULT);

        $stmt = $conn->prepare("INSERT INTO login (Email, Sifra, Ime, Potvrda_lozinke, Username) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $email, $hash_sifra, $ime, $hash_potvrda, $username);

        if ($stmt->execute()) {
            echo '<script type="text/javascript">alert("Podaci su uneseni uspješno.");</script>';
        } else {
            echo '<script type="text/javascript">alert("Greška: ' . $stmt->error . '");</script>';
        }

        $stmt->close();
    }

    $conn->close();
}
?>