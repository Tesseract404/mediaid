<?php
require_once('connection.php');
$schedule_id = $_GET['schedule_id']; 
if (empty($schedule_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$delete =DeleteSchedule($schedule_id,$conn);
if ($delete) {
    http_response_code(200); // OK
    echo json_encode($scheduledata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "Problem Occured"));
}
function DeleteSchedule($scheduleId, $conn) {
    $sqldelete = "DELETE FROM schedules WHERE schedule_id = $scheduleId ";
    if (mysqli_query($conn, $sqldelete)) {
        return true; // Deletion successful
    } else {
        return false; // Deletion failed
    }
}
?>