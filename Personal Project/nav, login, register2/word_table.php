<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>삭제 완료</title>
   <style>
   body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      text-align: center;
   }

   h1 {
      color: #333;
      text-align: center;
      font-size: 24px;
      margin-top: 50px;
   }

   p {
      color: #666;
      text-align: center;
      font-size: 18px;
      margin-top: 20px;
   }

   #tomain {
      text-decoration: none;
      color: #00758F;
      font-weight: bold;
      font-size: 20px;
      position: fixed;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
   }
   </style>
</head>

<body>
   <?php
   header("Content-Type: text/html; charset=UTF-8");
   $id = $_POST['id'];
   $kl = $_POST['kl'];
   $cl = $_POST['cl'];
   $el = $_POST['el'];
   $rl = $_POST['rl'];
   $date = $_POST['date'];
   $msg1 = "Register successful";
   $msg2 = "Your data has been successful registered.";
   $connect = mysqli_connect("localhost", "root", "");
   mysqli_select_db($connect, "metaclass");
   //mysqli_query($connect, 'set names utf8');
   $inrec = "insert into word values('$id', '$kl', '$cl', '$el', '$rl', '$date')";
   $info = mysqli_query($connect, $inrec);

   if (!$info)
      die("테이블 등록실패 키값 중복 확인");
   else {
      echo ("<h1>$msg1</h1>");
      echo ("<p>$msg2</p>");
   }
   mysqli_close($connect);
   ?>
   <a href="index.html" id="tomain">메인 페이지로</a>
</body>

</html>