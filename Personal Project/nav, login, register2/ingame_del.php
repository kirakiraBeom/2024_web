<?php
header("Content-Type: text/html; charset=UTF-8");
$id = trim($_POST["id"]);
$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");

//mysqli_query($connect, 'set names utf8');

$deldata = "delete from ingame where id = '$id'";
$info = mysqli_query($connect, $deldata);
if (!$info)
   die("삭제 실패");
else
   echo ("삭제 성공");
mysqli_close($connect);