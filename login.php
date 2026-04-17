<?php
include "db.php";
session_start();

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();

    if (password_verify($password, $user['password'])) {
        $_SESSION['user'] = $user['username'];
        echo "Login successful. Welcome " . $user['username'];
    } else {
        echo "Wrong password";
    }
} else {
    echo "User not found";
}
?>