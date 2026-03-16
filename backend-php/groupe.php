<?php
require 'config.php';
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST");

// Get form
$email = $_POST['email'];
$password = $_POST['password'];
$stmt = $pdo->prepare("SELECT * FROM groupeArcadia WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user && password_verify($password, $user['password'])) {
    echo json_encode([
        'success' => true,
        'role' => $user['role']
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Identifiants invalides.'
    ]);
}
