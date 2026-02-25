<?php
require 'config.php';
header('Content-Type: application/json');

// Get form
$email = $_POST['email'];
$password = $_POST['password'];

$stmt = $pdo->prepare("SELECT * FROM groupeArcadia WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user['password'])) {
    echo json_encode([
        'success' => true,
        'username' => $user['username'],
        'role' => $user['role']
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Identifiants invalides.'
    ]);
}
?>
