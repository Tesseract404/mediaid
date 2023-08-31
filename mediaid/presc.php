<?php
error_reporting(E_ALL);
$conn = mysqli_connect('localhost', 'root', '', 'mediaid');

if (!$conn) {
    die('Database connection failed: ' . mysqli_connect_error());  
} 

$id = intval($_POST['user_id']); 
$name = mysqli_real_escape_string($conn, $_POST['name']);   
$docname = mysqli_real_escape_string($conn, $_POST['doctor_name']);  
$spec = mysqli_real_escape_string($conn, $_POST['spec']);  
$details = mysqli_real_escape_string($conn, $_POST['details']); 
$presc_photo = $_FILES['presc_photo'];

$status = ''; 

// Check if 'presc_photo' is set and not empty
if (isset($_FILES['presc_photo']) && !empty($_FILES['presc_photo']['tmp_name'])) {
    // Check the MIME type of the uploaded image
    $mime_type = mime_content_type($_FILES['presc_photo']['tmp_name']);

    if ($mime_type === 'image/jpg' || $mime_type === 'image/png') {
        $presc_photo = file_get_contents($_FILES['presc_photo']['tmp_name']);
    } else {
        $status = 'error: Invalid image format';
    }
} else {
    $presc_photo = null;
}

$stmt = $conn->prepare("INSERT INTO prescription(user_id, name, doctor_name, spec, details, presc_photo) VALUES (?, ?, ?, ?, ?, ?)");

if ($stmt) {
    // Bind parameters and execute the statement
    $stmt->bind_param("issssb", $id, $name, $docname, $spec, $details, $presc_photo);
    if ($stmt->execute()) {
        $status = 'success';
    } else {
        $status = 'error';
    }
    $stmt->close();
} else {
    $status = 'error';
}
 
$response = [
    'query' => $status,
];
echo json_encode($response);
 
$conn->close();
?>
