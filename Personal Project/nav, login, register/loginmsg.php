<html>

<head>
   <meta charset="UTF-8">
   <style>
   p {
      color: #d49466;
      font-size: 1.2em
   }
   </style>
</head>

</html>

<?php
header("Content-Type:text/html;charset=utf-8");
session_start();
if (!isset($_SESSION['name']) or !isset($_SESSION['regdate'])) {
   echo "<meta http-equiv = 'refresh'
   content = '0 url = login.html'>";
   exit;
}

$name = $_SESSION['name'];
$regdate = $_SESSION['regdate'];

echo "<p>Beom's Coding에 오신 {$name}님</p>";
echo "{$name}님은 {$regdate}일에 가입하셨습니다.";
?>