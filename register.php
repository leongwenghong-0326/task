<?php
include "db.php"; 
// 引入数据库连接文件 / Include database connection file

$username = $_POST['username']; 
// 获取用户输入的用户名 / Get user input username

$email = $_POST['email']; 
// 获取用户输入的邮箱 / Get user input email

$password = password_hash($_POST['password'], PASSWORD_DEFAULT); 
// 对密码进行加密 / Hash the password using default algorithm

$sql = "INSERT INTO users (username, email, password)
        VALUES ('$username', '$email', '$password')"; 
// 插入用户数据到数据库 / Insert user data into database

if ($conn->query($sql) === TRUE) { 
    // 如果注册成功 / If registration is successful

    echo "Registration successful! <a href='login.html'>Login here</a>"; 
    // 注册成功提示 + 登录链接 / Success message with login link

} else {
    echo "Error: " . $conn->error; 
    // 如果失败，显示错误信息 / If failed, show error message
}
?>