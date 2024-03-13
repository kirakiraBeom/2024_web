<?php
$conn = mysqli_connect("localhost", "root", "");
mysqli_select_db($conn, "membership");
$sql = "create table member(id varchar(20) not null, pwd varchar(20) not null, name varchar(10), regdate date, primary key(id))";
$qry = mysqli_query($conn, $sql);
if (!$qry)
   die("테이블 작성 실패");
else
   echo "테이블이 생성되었습니다.";
mysqli_close($conn);