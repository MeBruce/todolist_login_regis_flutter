<?php
require "connect.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    if (!empty($email) && !empty($password)) {
        $sql = "SELECT * FROM user WHERE email = '$email'";
        $result = mysqli_query($con, $sql);
        $row = mysqli_fetch_assoc($result);

        if ($row && password_verify($password, $row['password'])) {
            echo json_encode("Success");
        } else {
            echo json_encode("Error");
        }
    } else {
        echo json_encode("Incomplete data received");
    }
} else {
    echo json_encode("Invalid request");
}
?>
