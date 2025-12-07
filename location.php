<?php
require("connexion.php");
$habit  = $_POST["habit"];
$client = $_POST["cin"];   
$duree  = $_POST["duree"];
$req1 = "SELECT * FROM habit WHERE codeHab = '$habit'";
$res1 = mysqli_query($cnx, $req1);
if (!$res1 || mysqli_num_rows($res1) == 0) {
    echo "Error: outfit does not exist.";
    mysqli_close($cnx);
    exit;
}
$req2 = "SELECT * FROM habit WHERE codeHab = '$habit' AND disponible = 'N'";
$res2 = mysqli_query($cnx, $req2);
if ($res2 && mysqli_num_rows($res2) > 0) {
    echo "Error: outfit is already rented.";
    mysqli_close($cnx);
    exit;
}
$req3 = "SELECT * FROM client WHERE cin = '$client'";
$res3 = mysqli_query($cnx, $req3);
if (!$res3 || mysqli_num_rows($res3) == 0) {
    echo "Error: customer does not exist.";
    mysqli_close($cnx);
    exit;
}
$date = date("Y-m-d");
$req4 = "INSERT INTO location (dateLoc, codeHab, cin, duree)
         VALUES ('$date', '$habit', '$client', '$duree')";
$res4 = mysqli_query($cnx, $req4);
if (!$res4) {
    echo "Error while saving rental: " . mysqli_error($cnx);
    mysqli_close($cnx);
    exit;
}
$req5 = "UPDATE habit SET disponible = 'N' WHERE codeHab = '$habit'";
$res5 = mysqli_query($cnx, $req5);
if (!$res5) {
    echo "Rental saved, but error while updating availability: " . mysqli_error($cnx);
    mysqli_close($cnx);
    exit;
}
echo "Rental completed successfully.";
mysqli_close($cnx);
?>
