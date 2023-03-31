<?php
$db = mysqli_connect('127.0.0.1','root','','users');
if(!$db)
{
    echo "Database connection failed";
}

$nom = $_POST['username'];
$mdp = $_POST['password'];
$role = $_POST['Role']

$sql = "SELECT Nom FROM users_pdm WHERE Nom = '".$nom"'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);

if($count == 1){
    echo json_encode("Error");
}else{
    $insert = "INSERT INTO users_pdm(nom,mdp,role) VALUES ('".$nom"','".$mdp"','".$role"')";
        $query = mysqli_query($db,$insert);
        if($query){
            echo json_encode("Succes");
        } 
}
?>