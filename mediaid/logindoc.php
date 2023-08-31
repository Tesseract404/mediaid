<?php
require_once('connection.php');
$email = mysqli_real_escape_string($conn, $_POST['email']);  
$password = mysqli_real_escape_string($conn, $_POST['password']);  
// Query 1
$sqllogin = "SELECT * FROM doctors WHERE email = '$email' AND password = '$password'";
$result = mysqli_query($conn, $sqllogin);
if (!$result) {
    die('Error in SQL query: ' . mysqli_error($conn));
}
$count = mysqli_num_rows($result);
$status ='';
if ($count >= 1) {
    $status ='success';
} else {
    $status ='error';
}
if($status=='success'){
    $user_id = getUserIdByEmail($email,$conn); 
    // $token = generateToken($user_id);
}
$response = [
    'query1' => $status,
    'query2' => $user_id,
];
header('Content-Type: application/json');
echo json_encode($response);
// function generateToken($user_id) {
//     $key ='123465';
//     $payload = [
//         'user_id' => $user_id,
//         'exp' => time() + 3600, 
//     ];
//     return JWT::encode($payload, $key);
// }
function getUserIdByEmail($email, $conn) {
    if (!$conn) {
        die('Database connection failed: ' . mysqli_connect_error());
    }
    // Use a prepared statement to query the user ID based on the email
    $query = "SELECT id FROM doctors WHERE email = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt, $user_id);
    mysqli_stmt_fetch($stmt);
    mysqli_stmt_close($stmt);

    // Close the database connection
    mysqli_close($conn);

    return $user_id;
}
?>