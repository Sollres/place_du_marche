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


  $sql=$pdo->query("SELECT DISTINCT t2.Nom, t2.id FROM messages t1 INNER JOIN exploitations t2 ON t1.recipient = t2.id WHERE t1.user = $userId");

  $result=array();
  $fetchdata = null;
  while($fetchdata = $sql->fetch(PDO::FETCH_ASSOC)){

  	$result[]=$fetchdata;
  }

  echo json_encode($result);

?>
