<?php
$id = $_POST["id"];
$game = $_POST["game"];
$chapter = $_POST["chapter"];
$mid = $_POST["mid"];
$final = $_POST["final"];
$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");
//mysqli_query('set names utf8');
$editdata = "update grade set game='$game', chapter='$chapter', mid='$mid', final='$final' where id='$id'";
$info = mysqli_query($connect, $editdata);
if (!$info)
   die("수정에 실패했습니다.");
echo ("수정작업성공");
mysqli_close($connect);