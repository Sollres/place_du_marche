<?php
    $db = mysqli_connect('localhost','root','','userdata');
    if(!$db)
    {
        echo "Database connection failed";
    }
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT users FROM users_pdm WHERE username = '".$username."'";
    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);
    if($count == 1){
        echo json_encode("Error");
    }else{
        $insert = "INSERT INTO users(username,password) VALUES ('".$username."','".$password."')";
            $query = mysqli_query($db,$insert);
            if($query){
                echo json_encode("Success");
            }
    }
?>