<?php
require_once('connection.php');
$name = $_GET['name']; 
$sql = "SELECT id FROM `doctors` WHERE name='$name'";
$result = $conn->query($sql);
 
if ($row = $result->fetch_assoc()) {
    echo json_encode($row['id'] );
} else {
    echo "No records found.";
}
 
$conn->close();
?>