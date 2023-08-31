<?php
require_once('connection.php');
$name = $_GET['name']; 
if (empty($name)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$convodata = getconvodata($name, $conn);

if ($convodata) {
    http_response_code(200); // OK
    echo json_encode($convodata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getconvodata($name, $conn) {
    $query = "SELECT * FROM conversations WHERE name = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $result = $stmt->get_result();

    $convoDataArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $convoDataArray[] = $row;
    }
    return $convoDataArray;
}
?>