<?php
require_once('connection.php');
$conv_id = $_GET['conv_id']; 
$name = $_GET['name']; 
if (empty($conv_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "conv_id is required."));
    exit();
}
$chatdata = getchatdata($conv_id, $conn);

if ($chatdata) {
    http_response_code(200); // OK
    echo json_encode($chatdata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getchatdata($conv_id, $conn) {
    $query = "SELECT * FROM chats WHERE conv_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $conv_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $chatDataArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $chatDataArray[] = $row;
    }
    return $chatDataArray;
}
?>