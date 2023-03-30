<?php
  $db = mysqli_connect('127.0.0.1','root','','users');
  if(!$db)
  {
      echo "Database connection failed";
  }
  $email = $_POST['email'];
  $password = $_POST['password'];

  $sql = "SELECT * FROM users_pdm WHERE email = '".$email."' AND mdp = '".$password."'";
  $result = mysqli_query($db,$sql);
  $count = mysqli_num_rows($result);
  if($count == 1){
    // Requête SQL pour sélectionner l'ID de l'utilisateur correspondant à l'e-mail fourni
    $sql = "SELECT iduser FROM users_pdm WHERE email = '$email'";
    $result = mysqli_query($db, $sql);

    // Vérification du résultat de la requête
    if (mysqli_num_rows($result) > 0) {
        // Récupération de l'ID de l'utilisateur
        $row = mysqli_fetch_assoc($result);
        $id = $row["iduser"];

        // Création d'un tableau associatif pour la réponse JSON
        $response = array('iduser' => $id);

        // Encodage de la réponse en JSON et envoi de la réponse
        echo json_encode($response);
    } else {
        echo json_encode("Error: User ID not found");
    }
  } else {
      echo json_encode("Error: Invalid email or password");
  }
?>
