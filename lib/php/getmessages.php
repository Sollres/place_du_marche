<?php

  // Connexion à la base de données
  $host = "127.0.0.1";
  $dbname = "users";
  $user = "root";
  $password = "";

  try {
      $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
      die("Erreur de connexion : " . $e->getMessage());
  }

  // Récupérer l'id de l'utilisateur depuis la requête
  $userId = $_POST['user'];
  $sql = $pdo->query("SELECT role FROM users_pdm WHERE iduser = $userId");
  $row = $sql->fetch(PDO::FETCH_ASSOC);
  $role = $row['role'];

  if ($role == 'client') {
    $req = $pdo->query("SELECT DISTINCT t2.Nom, t2.iduser FROM messages t1 INNER JOIN exploitations t2 ON t1.recipient = t2.iduser WHERE t1.user = $userId AND t1.recipient = t2.iduser");

    $result = array();
    while($fetchdata = $req->fetch(PDO::FETCH_ASSOC)){
      $result[] = $fetchdata;
    }

    echo json_encode($result);

  }
 if ($role == 'agriculteu') {
    $reqq = $pdo->query("SELECT DISTINCT t2.Nom, t2.iduser FROM messages t1 INNER JOIN users_pdm t2 ON t1.recipient = t2.iduser WHERE t1.user = $userId AND t1.recipient = t2.iduser");

    $result = array();
    while($fetchdata = $reqq->fetch(PDO::FETCH_ASSOC)){
      $result[] = $fetchdata;
    }


    echo json_encode($result);
  }


?>
