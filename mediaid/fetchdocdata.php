<?php
require_once('connection.php');

$user_id = $_GET['user_id']; 
if (empty($user_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$userData = getUserData2($user_id, $conn);

if ($userData) {
    http_response_code(200);  
    echo json_encode($userData);
} else {
    http_response_code(404); 
    echo json_encode(array("message" => "User not found."));
}
function getUserData2($userId, $conn) {
    $query = "SELECT * FROM doctors WHERE id = ?";
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
    // if ($row = $result->fetch_assoc()) {
    //     return $row['name'];
    // } else {
    //     return null; 
    // }
}
?>