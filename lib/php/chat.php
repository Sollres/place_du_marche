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

  // Vérifier si le formulaire a été soumis
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Vérifier si les données du formulaire ont été fournies
      if (isset($_POST["user"]) && isset($_POST["message"]) && isset($_POST["recipient"])) {
          // Récupérer les données du formulaire
          $user = intval($_POST["user"]);
          $message = $_POST["message"];
          $recipient = intval($_POST["recipient"]);

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
      } else {
          die("Erreur : le formulaire est incomplet");
      }
  }

  // Récupérer les messages de la table "messages" pour un destinataire donné
  if (isset($_GET["recipient"])) {
      $recipient = intval($_GET["recipient"]);
      $userid = intval($_GET["user"]);
      try {
          //$stmt = $pdo->prepare("SELECT * FROM messages WHERE recipient = :recipient and user = :user and recipient = :user and user = :recipient");
          $stmt = $pdo->prepare("SELECT * FROM messages WHERE (user = :user AND recipient = :recipient) OR (user = :recipient AND recipient = :user)");

          $stmt->bindParam(":recipient", $recipient);
          $stmt->bindParam(":user", $userid);

          $stmt->execute();
          $messages = $stmt->fetchAll(PDO::FETCH_ASSOC);
      } catch (PDOException $e) {
          die("Erreur de récupération : " . $e->getMessage());
      }

      // Afficher les messages au format JSON
      header('Content-Type: application/json');
      echo json_encode($messages);
  } else {
      die("Erreur : destinataire non spécifié");
  }
?>
