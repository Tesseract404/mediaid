<?php
require_once('connection.php');

$user_id = intval($_POST['user_id']); 
$name = mysqli_real_escape_string($conn, $_POST['name']);
$receiver_name = mysqli_real_escape_string($conn, $_POST['receiver_name']);
$image = $_POST['image'];

$status = '';
if (insertConversation2($user_id, $name, $receiver_name, $image, $conn)) {
    $status = 'success';
} else {
    $status = 'error';
}
$response = [
    'status' => $status,
];
echo json_encode($response);

function insertConversation2($user_id, $name, $receiver_name, $image, $conn){
    $query = "INSERT INTO conversations (user_id, name, receiver_name, seen, image) 
              VALUES (?, ?, ?, 0, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("isss", $user_id, $name, $receiver_name, $image);
    
    if ($stmt->execute()) {
        return true;
    } else {
        return false;
    }
}
?>
