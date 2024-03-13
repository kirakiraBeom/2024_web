<?php
$id = $_POST["id"];
$game1 = $_POST["game1"];
$game2 = $_POST["game2"];
$game3 = $_POST["game3"];
$game4 = $_POST["game4"];
$game5 = $_POST["game5"];
$game6 = $_POST["game6"];
$game7 = $_POST["game7"];
$total = $game1 + $game2 + $game3 + $game4 + $game5 + $game6 + $game7;
$avg = $total / 7;

$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");
//mysqli_query('set names utf8');
$editdata = "update ingame set game='$game1', game='$game2', game='$game3', game='$game4', game='$game5', game='$game6', game='$game7', total='$total', avg='$avg'";
$info = mysqli_query($connect, $editdata);
if (!$info)
   die("수정에 실패했습니다.");
echo ("수정작업성공");
mysqli_close($connect);