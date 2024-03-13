<html>

<head>
   <meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
   <style>
   h1 {
      color: #d49466;
      font-family: "Source Sans Pro";
   }

   table {
      width: 600px;
      border-bottom: 1px dashed #808080;
   }

   th {
      background: #ddaa88;
      font-size: 1.2em;
      font-family: "Source Sans Pro";
      padding: 3px;
   }

   #data1 {
      height: 30px
   }

   a {
      text-decoration: none;
      color: #505050
   }

   a:hover {
      color: #ddaa88
   }

   #ab {
      color: #ee9988
   }
   </style>
</head>

<body>
   <center>
      <h1>Coding </h1>
      <table>
         <tr>
            <th>NO</th>
            <th>Title</th>
            <th>Name</th>
            <th>Date</th>
            <th>View</th>
         </tr>
         <?php
         header("Content-Type:text/html;charset=utf-8");
         $connect = mysqli_connect("localhost", "root", "");
         mysqli_select_db($connect, "membership");
         mysqli_query($connect, 'set names utf8');
         if (empty($_GET['page'])) {
            $page = 1;
         } else {
            $page = $_GET['page'];
         }
         $line_page = 5;
         $block_page = 3;
         $s1 = "select * from coding";
         $result = mysqli_query($connect, $s1);
         $totrow = mysqli_num_rows($result);
         $totpage = ceil($totrow / $line_page);
         $totblock = ceil($totpage / $block_page);
         $cblock = ceil($page / $block_page);
         $frow = ($page - 1) * $line_page;
         $selrec = "select * from coding order by no desc limit $frow,$line_page";
         $info = mysqli_query($connect, $selrec);
         while ($rowinfo = mysqli_fetch_array($info)) {
            echo "<tr>";
            echo "<td> $rowinfo[no] </td>";
            echo "<td> <a href='detailpost.php?title=$rowinfo[title]'> $rowinfo[title] </a></td>";
            echo "<td> $rowinfo[name] </td>";
            echo "<td> $rowinfo[regdate] </td>";
            echo "<td> $rowinfo[hits] </td>";
            echo "</tr>";
         }
         mysqli_close($connect);
         ?>
      </table>
   </center>
</body>
<center>
   <?php
   $fpage = (($cblock - 1) * $block_page) + 1;
   $lpage = min($totpage, $cblock * $block_page);
   if ($cblock > 1) {
      $prvblock = ($cblock - 1) * $block_page;
      echo "<a href='coding.php?page=$prvblock'>◀이전</a>";
   }
   for ($i = $fpage; $i <= $lpage; $i++) {
      if ($i == $page) echo "<b id='ab'>[$i]</b>";
      else  echo "<a href='coding.php?page=$i'>[$i]</a>";
   }
   if ($cblock < $totblock) {
      $nxtblock = ($cblock + 1) * $block_page;
      echo "<a href='coding.php?page=$nxtblock'>다음▶</a>";
   }
   ?>
   <button type="button" class="submit" onclick="location.href='writein.php'">

      <span class="btn_text">글 작성하기</span>
   </button>
</center>

</html>