<?php
header("Content-Type: text/html; charset=UTF-8");
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
   $id = $_POST['id'];
   $pwd = $_POST['pwd'];

   // 데이터베이스에서 사용자 정보를 가져옴
   $connect = mysqli_connect("localhost", "root", "");
   mysqli_select_db($connect, "metaclass");
   $query = "SELECT * FROM users WHERE id = '$id' AND pwd='$pwd'";
   $result = mysqli_query($connect, $query);
   $user = mysqli_fetch_assoc($result);
   mysqli_close($connect);

   if ($user) {
      $_SESSION['id'] = $id;
      if ($user['is_admin']) {
         // 사용자가 관리자인 경우, 관리자 페이지로 이동
         echo "<script>alert('관리자 페이지로 이동합니다.'); location.href='index.html';</script>";
      } else {
         echo "<script>alert('로그인 성공!'); location.href='home.php';</script>";
      }
      exit;
   } else {
      // 로그인 실패시 에러메시지 출력
      $error_message = "아이디 또는 비밀번호가 잘못되었습니다.";
   }
}