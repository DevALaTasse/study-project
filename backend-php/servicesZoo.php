<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

require 'config.php';

try {
    $stmt = $pdo->query("SELECT * FROM services");
    $services = $stmt->fetchAll();
    echo json_encode($services);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}
