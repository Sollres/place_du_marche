<?php
$db = mysqli_connect('127.0.0.1','root','','users');
if(!$db)
{
    echo "Database connection failed";
}

$nom = $_POST['username'];
$mdp = $_POST['password'];
$email = $_POST['email']

$sql = "SELECT Nom FROM users_pdm WHERE Nom = '".$nom"'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);

if($count == 1){
    echo json_encode("Error");
}else{
    $update = "UPDATE users_pdm SET Nom = '".$nom"', mdp = '".$mdp"', email = '".$email"'";
        $update = mysqli_query($db,$update);
        if($query){
            echo json_encode("Succes");
        } 
}
?>