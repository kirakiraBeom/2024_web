<html>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">

<head>
   <style>
   table {
      width: 600px;
      border-bottom: 1px;
   }

   th {
      color: white;
      background: #263343;
   }

   td {
      background: #d49466;
      color: white;
      font-size: 1.0em;
   }

   a {
      text-decoration: none;
   }

   body {
      margin: 0;
      font-family: "Source Sans Pro";
   }

   h2 {
      color: #d49466
   }
   </style>
</head>

<body>
   <center>
      <h2>회원 현황</h2><br>
      <table>
         <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>가입일자</th>
            <th>보기</th>
         </tr>
         <?php
         header("Content-Type:text/html;charset=utf-8");
         $conn = mysqli_connect("localhost", "root", "");
         mysqli_select_db($conn, "membership");
         mysqli_query($conn, 'set names utf8');
         $sql = "select * from member order by regdate desc";
         $info = mysqli_query($conn, $sql);
         while ($rowinfo = mysqli_fetch_array($info)) {
            echo "<tr>";
            echo "<td> $rowinfo[id] </td>";
            echo "<td> $rowinfo[pwd] </td>";
            echo "<td> $rowinfo[regdate] </td>";
            echo "<td> <a href = 'detail.php?id=$rowinfo[id]'>상세보기 </a></td>";
            echo "</tr>";
         }
         ?>
   </center>
</body>

</html>