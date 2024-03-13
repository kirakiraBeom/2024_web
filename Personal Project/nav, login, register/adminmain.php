<style>
div {
   border: 1px dashed #d49466;
   background: #263343;
}

ul>li {
   list-style: none;
   font-size: 1.0em;
   padding-bottom: 4px;
}

ul>li>a {
   text-decoration: none;
   color: white;
}

ul>li>a:hover {
   background-color: #d49466;
   border-radius: 4px;
}

body {
   margin: 0;
   font-family: "Source Sans Pro";
}
</style>
<?php
header("Content-Type:text/html;charset=utf-8");
$id = $_POST['id'];
$pwd = $_POST['pwd'];
$conn = mysqli_connect("localhost", "root", "");
mysqli_select_db($conn, "membership");
mysqli_query($conn, 'set names utf8');
$sql = "select * from manager where id = '$id' and pwd = '$pwd'";
$info = mysqli_query($conn, $sql);
if (!$info) {
   echo "<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');history.back();</script>";
   exit;
}
$a = mysqli_fetch_array($info);
?>

<html>

<head>
   <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
</head>

<body>
   <h3>Beom's Coding of Manager</h3>
   <?php
   echo "{$id}님 반갑습니다.<br>"; ?>
   <div>
      <ul>
         <li><a href="manager.php">회원 관리</a></li>
         <li><a href="">게시글 관리</a></li>
         <li><a href="">세션 관리</a></li>
         <li><a href="">메인 관리</a></li>
      </ul>
   </div>
</body>

</html>