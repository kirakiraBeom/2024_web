<html>

<head>
   <meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
   <style>
   div {
      width: 350px;
      border-bottom: 1px dashed #cc9900;
      height: 35px;
      margin: 30px;
      padding: 5px;
      font-size: 1.3em
   }

   input {
      border-radius: 0;
      border: none;
      background: 0 0;
      appearance: none;
      outline: 0;
      text-decoration: none;

   }

   form {
      font-family: "Source Sans Pro";
   }

   a {
      text-decoration: none;
      color: #d49466;
   }

   body {
      margin: 0;
      font-family: "Source Sans Pro";
   }
   </style>
</head>

<body>
   <?php
   header("Content-Type:text/html;charset=utf-8");
   $id = $_GET['id'];
   $conn = mysqli_connect("localhost", "root", "");
   mysqli_select_db($conn, "membership");
   mysqli_query($conn, 'set names utf8');
   $sql = "select * from member where id = '$id'";
   $info = mysqli_query($conn, $sql);
   if (!$info)
      die("쿼리 오류");
   $data = mysqli_fetch_array($info);
   ?>

   <form>
      <h2>
         <?= $data['id'] ?>
      </h2>
      <div>아이디 <input type="text" value="<?= $data['id'] ?>"></div>
      <div>패스워드 <input type="text" value="<?= $data['pwd'] ?>"></div>
      <div>이름 <input type="text" value="<?= $data['name'] ?>"></div>
      <div>가입날짜 <input type="text" value="<?= $data['regdate'] ?>"></div>
      <p> <a href="javascript: history.back();">회원현황으로 이동</a></p>
   </form>
</body>

</html>