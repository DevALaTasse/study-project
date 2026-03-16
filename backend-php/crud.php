<?php
require 'config.php';

$action = $_GET['action'];

if ($action == 'create') {
// get form
  $email = $_POST['email'];
  $password = $_POST['password'];
  $role = $_POST['role'];

// Hash 
  $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

  try {
    $sql = "INSERT INTO groupearcadia (email, password, role) VALUES (:email, :password, :role)";
      $stmt = $pdo->prepare($sql);
      $stmt->execute([
        ':email' => $email,
        ':password' => $hashedPassword,
        ':role' => $role
      ]);

      echo json_encode([
        "status" => "success",
        "message" => "Utilisateur créé avec succès"
      ]);

    } catch (PDOException $e) {
      echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
      ]);
  }
}

if ($action == 'read') {
    // SELECT
}

if ($action == 'update') {
    // UPDATE
}

if ($action == 'delete') {
    // DELETE
}
?>
