<?php
require_once('connection.php');
$sql = "SELECT * FROM `doctors`";
$result = $conn->query($sql);

// Check if there are any records
if ($result->num_rows > 0) {
    $doctors = array();
    while ($row = $result->fetch_assoc()) {
        // Add each doctor's data to the $doctors array
        $doctors[] = $row;
    }
    
    // Encode the $doctors array as JSON and send it as the response
    header('Content-Type: application/json');
    echo json_encode($doctors);
} else {
    echo "No records found.";
}

// Close the database connection
$conn->close();
?>