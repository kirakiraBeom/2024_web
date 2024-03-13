<html>

<head>
   <meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
   <style>
   h1 {
      color: #d49466;
      margin-left: 50px;
      margin-top: 50px;
   }

   #main {
      width: 600px;
      height: 400px;
      border-radius: 10px;
      border: thin solid #ddaa77;
      opacity: 0.6;
      margin: 50px
   }

   label {
      margin: 5px;
      padding: 10px;
      font-size: 1.2em;
      color: #505050;
      opacity: 0.3;
   }

   input {
      padding: 7px
   }

   textarea {
      margin-left: 10px;
   }

   .submit {
      margin-top: 10px;
      margin-left: 10px;
   }

   .name,
   .title {
      margin-left: 38px;
   }

   body {
      margin: 0;
      font-family: "Source Sans Pro";
   }

   form {
      margin: 0;
      padding: 0;
      font-family: "Source Sans Pro";
   }
   </style>
</head>

<body>
   <?php header("Content-Type:text/html;charset=utf-8"); ?>
   <h1>게시판 글쓰기</h1>
   <form action="write.php" method="post">
      <section id="main">
         <br>
         <label>이름</label><input type="text" required name="name" class="name">
         <p>
            <label>비밀번호</label><input type=" password" length=5 required name="pwd">
         <p>
            <label>제목</label><input type="text" required name="title" class="title">
         <p>
            <label>글내용</label><textarea rows=10 cols=70 required name="content"></textarea>
            <input type="submit" value="등록하기" class="submit">
      </section>
   </form>
</body>

</html>