<?php
$ner = isset($_POST['ner']) ? $_POST['ner'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$password1 = isset($_POST['password1']) ? $_POST['password1'] : '';
$password2 = isset($_POST['password2']) ? $_POST['password2'] : '';

if (empty($ner) || empty($email) || empty($password1) || empty($password2)) {
    echo json_encode(array("error" => "All fields are required."));
    exit;
}

// Validate passwords match
if ($password1 !== $password2) {
    echo json_encode(array("error" => "Passwords do not match."));
    exit;
}

$ner = htmlspecialchars($ner);
$email = htmlspecialchars($email);
$password = htmlspecialchars($password1);

$passwordHash = password_hash($password1, PASSWORD_DEFAULT);

// Check if image was uploaded
if ($_FILES['image']['error'] === UPLOAD_ERR_OK) {
    $imageData = file_get_contents($_FILES['image']['tmp_name']);

    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "mobile";

    $conn = new mysqli($servername, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "INSERT INTO users (ner, email, password, image) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssb", $ner, $email, $passwordHash, $imageData);

    if ($stmt->execute()) {
        echo json_encode(array("message" => "User registered successfully"));
    } else {
        echo json_encode(array("error" => "Error: " . $stmt->error));
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(array("error" => "Failed to upload image."));
}
?>
