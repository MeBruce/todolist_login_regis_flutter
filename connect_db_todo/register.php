<?php
require "connect.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';

    if (!empty($name) && !empty($password) && !empty($email)) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO user (name, password, email) VALUES ('$name', '$hashed_password', '$email')";
        $query = mysqli_query($con, $sql);

        if ($query) {
            echo json_encode(['result' => 'Succeed']);
        } else {
            echo json_encode(['result' => 'Failed to insert user']);
        }
    } else {
        echo json_encode(['result' => 'Incomplete data received']);
    }
} else {
    echo json_encode(['result' => 'Invalid request']);
}
?>
