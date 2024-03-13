<?php
header("Content-Type: text/html; charset=UTF-8");

$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");

$id = $_POST['id'];
$irum = $_POST['irum'];
$game1 = $_POST['game1'];
$game2 = $_POST['game2'];
$game3 = $_POST['game3'];
$game4 = $_POST['game4'];
$game5 = $_POST['game5'];
$game6 = $_POST['game6'];
$game7 = $_POST['game7'];
$total = $game1 + $game2 + $game3 + $game4 + $game5 + $game6 + $game7;
$avg = $total / 7;

//mysqli_query($connect, 'set names utf8');
$inrec = "INSERT into ingame values('$id', '$irum', '$game1', '$game2', '$game3', '$game4', '$game5', '$game6', '$game7', '$total', '$avg')";
$info = mysqli_query($connect, $inrec);

if (!$info)
   die("테이블 등록실패 키값 중복 확인");
else
   echo "등록 성공";
mysqli_close($connect);