<?php
require("connexion.php");
$cat   = $_POST["categorie"]; 
$desc  = $_POST["desc"];
$taille = $_POST["taille"];
$prix  = $_POST["prix"];
$req1 = "INSERT INTO habit (description, taille, prix, codeCat)
         VALUES ('$desc', '$taille', '$prix', '$cat')";
$res1 = mysqli_query($cnx, $req1);
if ($res1 && mysqli_affected_rows($cnx) > 0) {
    echo "Record saved successfully.";
} else {
    echo "Error while saving the outfit: " . mysqli_error($cnx);
}
mysqli_close($cnx);
?>
