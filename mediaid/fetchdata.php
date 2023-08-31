<?php
require_once('connection.php');
function getUserData($userId, $conn) {
    $query = "SELECT * FROM users WHERE user_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();
        return $row;
    } else {
        return null;
    }
}
$user_id = $_GET['user_id']; 

if (empty($user_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$userData = getUserData($user_id, $conn);

if ($userData) {
    http_response_code(200); // OK
    echo json_encode($userData);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
?>