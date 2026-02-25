<?php

require 'config.php';

$stmt = $pdo->query("SELECT * FROM users");
$data = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($data); 
