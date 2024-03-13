<?php
header("Content-Type:text/html;charset=utf-8");
$id = $_POST['id'];
$pwd = $_POST['pwd'];
$conn = mysqli_connect("localhost", "root", "");
mysqli_select_db($conn, "membership");
$sqlrec = "select * from member where id = '$id' and pwd = '$pwd'";
$info = mysqli_query($conn, $sqlrec);
if (!$info) {
   echo "<script>alert('아이디 또는 비밀번호가 존재하지 않습니다.'); history.back;</script>";
   exit;
}
while ($i = mysqli_fetch_array($info)) {
   $b = $i['name'];
   $c = $i['regdate'];
}

session_start();
$_SESSION['name'] = $b;
$_SESSION['regdate'] = $c;
?>
<meta http-equiv="refresh" content='0; url = loginmsg.php'>