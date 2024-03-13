<?php
$id = $_POST["id"];
$kl = $_POST["kl"];
$cl = $_POST["cl"];
$el = $_POST["el"];
$rl = $_POST["rl"];
$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");
//mysqli_query('set names utf8');
$editdata = "update word set kl='$kl', cl='$cl', el='$el', rl='$rl' where id='$id'";
$info = mysqli_query($connect, $editdata);
if (!$info)
   die("수정에 실패했습니다.");
echo ("수정작업성공");
mysqli_close($connect);