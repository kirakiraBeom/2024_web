<?php
header("Content-Type: text/html; charset=UTF-8");
$id = $_POST['id'];
$kl = $_POST['kl'];
$cl = $_POST['cl'];
$el = $_POST['el'];
$rl = $_POST['rl'];
$date = $_POST['date'];
$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");
//mysqli_query($connect, 'set names utf8');
$inrec = "insert into speak values('$id', '$kl', '$cl', '$el', '$rl', '$date')";
$info = mysqli_query($connect, $inrec);

if (!$info)
   die("테이블 등록실패 키값 중복 확인");
else
   echo "등록 성공";
mysqli_close($connect);