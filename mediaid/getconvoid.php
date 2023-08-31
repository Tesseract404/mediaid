<?php
require_once('connection.php');
$id = $_GET['user_id']; 
$receiver_name = $_GET['receiver_name']; 
if (empty($receiver_name)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$convoid = getconvoid($id, $receiver_name, $conn);

if ($convoid) {
    http_response_code(200); // OK
    echo json_encode($convoid);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getconvoid($id, $receiver_name, $conn)  {
    $query = "SELECT conv_id FROM conversations WHERE user_id = ? AND receiver_name = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("is",$id,$receiver_name);
    $stmt->execute();
    $result = $stmt->get_result();
  
    if ($row = $result->fetch_assoc()) {
        return $row['conv_id'];
    } else {
        return null; // No matching conversation found
    }
}
?>