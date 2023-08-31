<?php
error_reporting(E_ALL);
require_once('connection.php');
$id = intval($_POST['user_id']); 
$name = mysqli_real_escape_string($conn, $_POST['name']); 
$docname = mysqli_real_escape_string($conn, $_POST['doctor_name']);  
$date = mysqli_real_escape_string($conn, $_POST['date']);  
$time = mysqli_real_escape_string($conn, $_POST['time']); 

$sqlschedule = "INSERT INTO schedules (user_id, name, doctor_name, date, time)
 VALUES ('$id', '$name', '$docname', '$date', '$time')";
$query = mysqli_query($conn, $sqlschedule); 

$status = '';
if ($query) {
    $status = 'success';
} else {
    $status = 'error';
}
$response = [
    'query' => $status,
];
echo json_encode($response);
?>