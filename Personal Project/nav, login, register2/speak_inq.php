<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Word Search Result</title>
   <style>
   table {
      border-collapse: collapse;
      width: 100%;
   }

   th,
   td {
      padding: 8px;
      text-align: center;
      border: 1px solid #ddd;
   }

   th {
      background-color: #355d66;
      font-weight: bold;
      color: #fff;
   }

   tr {
      background-color: #68bbce;
      color: #ffffff;
   }
   </style>
</head>

<body>
   <?php
   header("Content-Type: text/html; charset=UTF-8");
   $id = $_POST['id'];
   $connect = mysqli_connect("localhost", "root", "");
   mysqli_select_db($connect, "metaclass");
   //mysqli_query($connect, 'set names utf8');
   $search = "SELECT * FROM speak WHERE id='$id'";
   $result = mysqli_query($connect, $search);
   echo "<table>
	<tr>
	<th>id</th>
	<th>kl</th>
	<th>cl</th>
	<th>el</th>
	<th>rl</th>
	<th>date</th>
	</tr>";

   while ($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      echo "<td>" . $row['id'] . "</td>";
      echo "<td>" . $row['kl'] . "</td>";
      echo "<td>" . $row['cl'] . "</td>";
      echo "<td>" . $row['el'] . "</td>";
      echo "<td>" . $row['rl'] . "</td>";
      echo "<td>" . $row['date'] . "</td>";
      echo "</tr>";
   }
   echo "</table>";
   mysqli_close($connect);
   ?>
</body>

</html>