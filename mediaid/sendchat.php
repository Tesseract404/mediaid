<?php
error_reporting(E_ALL);
require_once('connection.php');

$user_id = intval($_POST['user_id']); 
$conv_id = intval($_POST['conv_id']); 
$id = intval($_POST['id']); 
$name = $_POST['name'];
$content = $_POST['content'];
 
$query ="INSERT INTO chats(user_id, conv_id , content , seen , name , id ) 
VALUES ('$user_id','$conv_id','$content','0','$name','$id');";

  $status = mysqli_query($conn,$query); 
 $response= '';
if($status){
    $response = 'success';
}else{
    $response ='error';
}
 echo json_encode($response);
 
$conn->close();
?>
