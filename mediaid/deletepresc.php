<?php
require_once('connection.php');
$prescription_id = $_GET['prescription_id']; 
if (empty($prescription_id)) {
    http_response_code(400); 
    echo json_encode(array("message" => "User ID is required."));
    exit();
}
$delete =DeletePresc($prescription_id,$conn);
if ($delete) {
    http_response_code(200); // OK
    echo json_encode($prescdata);
} else {
    http_response_code(404); // Not Found
    echo json_encode(array("message" => "Problem Occured"));
}
function DeletePresc($prescription_id, $conn) {
    $sqldelete = "DELETE FROM prescription WHERE prescription_id = $prescription_id ";
    if (mysqli_query($conn, $sqldelete)) {
        return true; // Deletion successful
    } else {
        return false; // Deletion failed
    }
}
?>