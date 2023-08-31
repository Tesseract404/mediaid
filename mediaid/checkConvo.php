<?php
require_once('connection.php');
$user_id = $_GET['user_id']; 
$receiver_name = $_GET['receiver_name']; 
if (empty($user_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$Convo = getScheduleData($user_id,$receiver_name, $conn);

if ($Convo) {
    http_response_code(200); // OK
    echo json_encode($Convo);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getScheduleData($userId,$receiver_name,$conn) {
    $query = "SELECT * FROM conversations WHERE user_id = ? AND receiver_name = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("is", $userId,$receiver_name);
    $stmt->execute();
    $result = $stmt->get_result();

    $ConvoArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $ConvoArray[] = $row;
    }
    return $ConvoArray;
}
?>