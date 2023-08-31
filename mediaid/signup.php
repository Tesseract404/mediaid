<?php
error_reporting(E_ALL);
require_once('connection.php');
$name = mysqli_real_escape_string($conn, $_POST['name']); 
$email = mysqli_real_escape_string($conn, $_POST['email']);  
$password = mysqli_real_escape_string($conn, $_POST['password']);  

$sqlsignUp = "INSERT INTO users( name , email , password ) VALUES('$name','$email','$password')";
$query = mysqli_query($conn, $sqlsignUp); 

$status ='';
//$status2 ='';

if ($query) {
    $status ='success';
} else {
    $status ='error';
}
// if($status=='success'){
//     $id = getUserIdByEmail($email); 
//     $status2= addToSchedule($id,$name);
//  }
$response = [
    'query1' => $status,
   // 'query2' => $status2,
];
echo json_encode($response);
