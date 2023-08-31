<?php
require_once('connection.php');
$receiver_name = $_GET['receiver_name']; 
if (empty($receiver_name)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$convodata = getconvodata1($receiver_name, $conn);

if ($convodata) {
     http_response_code(200); // OK
    echo json_encode($convodata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getconvodata1($receiver_name, $conn) {
    $query = "SELECT * FROM conversations WHERE receiver_name = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $receiver_name);
    $stmt->execute();
    $result = $stmt->get_result();

    $convoDataArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $convoDataArray[] = $row;
    }
    return $convoDataArray;
}
?>