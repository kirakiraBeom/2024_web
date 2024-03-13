<?php
header("Content-Type: text/html; charset=UTF-8");

$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "metaclass");

$id = $_POST['id'];
$irum = $_POST['irum'];
$game = $_POST['game'];
$chapter = $_POST['chapter'];
$mid = $_POST['mid'];
$final = $_POST['final'];
$total = $game + $chapter + $mid + $final;

// 새로운 레코드 삽입
$query = "INSERT into grade values('$id', '$irum', '$game', '$chapter', '$mid', '$final', '$total', null)";
$info = mysqli_query($connect, $query);

if (!$info)
   die("테이블 등록실패 키값 중복 확인");

// 순위 업데이트
function updateRanks($connect) {
   $rank = 1;
   $sql = "SELECT id, total FROM grade ORDER BY total DESC";
   $result = mysqli_query($connect, $sql);
   while ($row = mysqli_fetch_assoc($result)) {
      $id = $row['id'];

      // 순위를 업데이트
      $query = "UPDATE grade SET rank = $rank WHERE id = '$id'";
      mysqli_query($connect, $query);

      $rank++;
   }
}

updateRanks($connect);

echo "등록 성공";
mysqli_close($connect);