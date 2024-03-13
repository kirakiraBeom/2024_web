s<?php
   session_start();
   if (!isset($_SESSION['name'])) {
      echo "<script>location.replace('login.html');</script>";
   } else {
      $name = $_SESSION['name'];
   }
   ?>

<body>
   <div class="base">
      <h2><?php echo "안녕하세요, {$name}님"; ?></h2>
      <button type="button" class="btn" onclick="location.href = 'logout.php'">
         Logout
      </button>
   </div>
</body>