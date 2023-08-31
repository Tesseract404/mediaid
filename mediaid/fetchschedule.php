<?php
require_once('connection.php');
$user_id = $_GET['user_id']; 
if (empty($user_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$scheduledata = getScheduleData($user_id, $conn);

if ($scheduledata) {
    http_response_code(200); // OK
    echo json_encode($scheduledata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "User not found."));
}
function getScheduleData($userId, $conn) {
    $query = "SELECT * FROM schedules WHERE user_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    $scheduleDataArray = array(); 

    while ($row = $result->fetch_assoc()) {
        $scheduleDataArray[] = $row;
    }
    return $scheduleDataArray;
}
?>