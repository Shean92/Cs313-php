<!DOCTYPE html>
<html>
<head>
    <title>CrowDice</title>
    <link rel="stylesheet" href="FinalProject.css">
</head>
<body>
    <div class="title-section">
        <a href="CrowdiceWK3Browse.html"><img class="crowdice-icon" src="Assets/CrowDiceWhite.png"></a>
        <p class="subtitle">For When You're in a "Dicey" Situation</p>
    </div>
    
    <?php
    try
    {
      $dbUrl = getenv('DATABASE_URL');

      $dbOpts = parse_url($dbUrl);

      $dbHost = $dbOpts["host"];
      $dbPort = $dbOpts["port"];
      $dbUser = $dbOpts["user"];
      $dbPassword = $dbOpts["pass"];
      $dbName = ltrim($dbOpts["path"],'/');

      $db = new PDO("pgsql:host=$dbHost;port=$dbPort;dbname=$dbName", $dbUser, $dbPassword);

      $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (PDOException $ex)
    {
      echo 'Error!: ' . $ex->getMessage();
      die();
    }
    
    $username = $_POST['username'];
    $password = $_POST['userPassword'];
    
    foreach ($db->query('SELECT username, userPassword FROM public.user WHERE username =' . '\''. $username . '\'') as $row)
    {
      if ($password === $row['userPassword']) {
          echo '<h4>Welcome '. $username . '!<h4>';
          echo '<a href=FinalProjectHome.php><button class=log-in>Shop</button></a>'
      }
    }
    
    ?>
    
    <script type="text/javascript" src="FinalProject.js"></script>
</body>
</html>