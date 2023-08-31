<?php
error_reporting(E_ALL);
require_once('connection.php');

$id = intval($_POST['user_id']); 
$name = mysqli_real_escape_string($conn, $_POST['name']);   
$docname = mysqli_real_escape_string($conn, $_POST['doctor_name']);  
$spec = mysqli_real_escape_string($conn, $_POST['spec']);  
$details = mysqli_real_escape_string($conn, $_POST['details']); 
$presc_photo = $_POST['presc_photo'];
// if(isset($_POST["presc_photo"])){
//     $photo= base64_decode($_POST["presc_photo"]);
// }else{return;}
// $path = "uploads/$name";


$query ="INSERT INTO prescription(user_id,name,doctor_name,spec,details,presc_photo) 
         VALUES ('$id','$name','$docname','$spec','$details','$presc_photo')";

// file_put_contents($path, base64_decode($photo));
 $status = mysqli_query($conn,$query); 
 $response= '';
if($status){
    $response = 'success';
}else{
    $response ='error';
}
//header('Content-Type: application/json');
echo json_encode($response);
 
$conn->close();
?>
