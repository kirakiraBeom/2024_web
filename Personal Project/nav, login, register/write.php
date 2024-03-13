<?php
header("Content-Type:text/html;charset=utf-8");
$name = $_POST['name'];
$pwd = $_POST['pwd'];
$title = $_POST['title'];
$content = $_POST['content'];
$regdate = date('y-m-d');
$connect = mysqli_connect("localhost", "root", "");
mysqli_select_db($connect, "membership");

mysqli_query($connect, 'set names utf8');
$inrec = "insert into coding(name,pwd,title,content,regdate,hits)values('$name','$pwd','$title','$content','$regdate',0)";
$info = mysqli_query($connect, $inrec);
if (!$info)
   die("글 등록실패");
echo "작성하신 글이 등록되었습니다.<br>";
mysqli_close($connect);
?>
<a href="coding.php">글목록으로</a>