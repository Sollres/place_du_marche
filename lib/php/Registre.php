<?php
    $db = mysqli_connect('127.0.0.1','root','','users');
    if(!$db)
    {
        echo "Database connection failed";
    }
    $nom = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    $sql = "SELECT Nom FROM users_pdm WHERE Nom = '".$nom."'";
    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);
    if($count == 1){
        echo json_encode("Error");
    }else{
        $insert = "INSERT INTO users_pdm(Nom,email,mdp,role) VALUES ('".$nom."','".$email."','".$password."','agriculteur')";
            $query = mysqli_query($db,$insert);
            if($query){
                echo json_encode("Success");
            }
    }
?>
