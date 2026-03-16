<?php
require 'config.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Vérifier que les données existent
if(isset($_POST['email']) && isset($_POST['password']) && isset($_POST['role'])){

    $email = $_POST['email'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    // sécuriser le mot de passe
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    try {

        $sql = "INSERT INTO groupearcadia (email, password, role) 
                VALUES (:email, :password, :role)";

        $stmt = $pdo->prepare($sql);

        $stmt->execute([
            ':email' => $email,
            ':password' => $hashedPassword,
            ':role' => $role
        ]);

        echo json_encode([
            "success" => true,
            "role" => $role
        ]);

    } catch(PDOException $e){

        echo json_encode([
            "success" => false,
            "message" => $e->getMessage()
        ]);

    }

}else{

    echo json_encode([
        "success" => false,
        "message" => "Données manquantes"
    ]);

}
