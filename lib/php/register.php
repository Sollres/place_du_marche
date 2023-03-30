<?php
    $db = mysqli_connect('127.0.0.1:8889','root','root','users');
    if(!$db)
    {
        echo "Database connection failed";
    }
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    $sql = "SELECT username FROM users_pdm WHERE username = '".$username."'";
    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);
    if($count == 1){
        echo json_encode("Error");
    }else{
        $insert = "INSERT INTO users_pdm(username,email,mdp) VALUES ('".$username."','".$email."','".$password."')";
            $query = mysqli_query($db,$insert);
            if($query){
                echo json_encode("Success");
            }
    }
?>
