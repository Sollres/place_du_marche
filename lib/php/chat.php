<?php
  $host = "127.0.0.1";
  $dbname = "users";
  $user = "root";
  $password = "";

  // Connecter à la base de données
  try {
      $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (PDOException $e) {
      die("Erreur de connexion : " . $e->getMessage());
  }

  // Vérifier si le formulaire a été soumis
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Récupérer les données du formulaire
      $user = $_POST["user"];
      $message = $_POST["message"];
      $recipient = $_POST["recipient"];

      // Insérer les données dans la table "messages"
      try {
          $stmt = $pdo->prepare("INSERT INTO messages (user, message, recipient) VALUES (:user, :message, :recipient)");
          $stmt->bindParam(":user", $user);
          $stmt->bindParam(":message", $message);
          $stmt->bindParam(":recipient", $recipient);
          $stmt->execute();
      } catch (PDOException $e) {
          die("Erreur d'insertion : " . $e->getMessage());
      }
  }

  // Récupérer les messages de la table "messages"
  try {
      $stmt = $pdo->query("SELECT * FROM messages");
      $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
  } catch (PDOException $e) {
      die("Erreur de récupération : " . $e->getMessage());
  }

  // Afficher les messages au format JSON
  header('Content-Type: application/json');
  echo json_encode($messages);
?>
