<?php
header("Content-Type:text/html;charset=utf-8");
$id = $_POST['id'];
$pwd = password_hash($_POST['pwd'], PASSWORD_DEFAULT);
$name = $_POST['name'];
$regdate = $_POST['regdate'];
$conn = mysqli_connect("localhost", "root", "");
mysqli_select_db($conn, "membership");
mysqli_query($conn, 'set names utf8');
$sqlrec = "insert into member values('$id', '$pwd','$name', '$regdate')";
$info = mysqli_query($conn, $sqlrec);
if (!$info)
   die("회원가입 실패");
echo "회원가입이 완료되었습니다.<br>";
mysqli_close($conn);
?>
<a href="login.html" style="text-decoration: none; color: #d49466;">로그인 화면으로</a>