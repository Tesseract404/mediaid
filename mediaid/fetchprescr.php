<?php
require_once('connection.php');
$user_id = $_GET['user_id']; 
if (empty($user_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$prescdata = getPrescData($user_id, $conn);

if ($prescdata) {
    http_response_code(200); // OK
    echo json_encode($prescdata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getPrescData($userId, $conn) {
    $query = "SELECT * FROM prescription WHERE user_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    $prescDataArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $prescDataArray[] = $row;
    }
    return $prescDataArray;
}
?>