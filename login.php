<?php
include "db.php"; 
// 引入数据库连接文件 / Include database connection file

session_start(); 
// 开启会话，用于保存登录信息 / Start session to store login data

$email = $_POST['email']; 
// 获取用户输入的邮箱 / Get user input email

$password = $_POST['password']; 
// 获取用户输入的密码 / Get user input password

$sql = "SELECT * FROM users WHERE email='$email'"; 
// 从数据库查找该邮箱用户 / Search user by email in database

$result = $conn->query($sql); 
// 执行 SQL 查询 / Execute SQL query

if ($result->num_rows > 0) { 
    // 如果找到用户 / If user exists in database

    $user = $result->fetch_assoc(); 
    // 获取用户数据 / Fetch user data as array

    if (password_verify($password, $user['password'])) { 
        // 验证密码是否正确 / Verify if password is correct

        $_SESSION['user'] = $user['username']; 
        // 把用户名存入 session / Store username in session

        echo "Login successful. Welcome " . $user['username']; 
        // 登录成功提示 / Login success message

    } else {
        echo "Wrong password"; 
        // 密码错误提示 / Wrong password message
    }

} else {
    echo "User not found"; 
    // 用户不存在提示 / User not found message
}
?>