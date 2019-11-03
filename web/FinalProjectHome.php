<!DOCTYPE html>
<html>
<head>
    <title>CrowDice</title>
    <link rel="stylesheet" href="FinalProject.css">
</head>
<body>
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
    ?>
    <div class="title-section">
        <img class="crowdice-icon" src="Assets/CrowDiceWhite.png" href="FinalProjectHome.php">
        <p class="subtitle">For When You're in a "Dicey" Situation</p>
        <img class="icon" href="FinalProjectCart.html" src="Assets/CartIcon.png">
    </div>
    <div class="browse-list">
        <div class="browse-item">
            <img class="browse-item-img" src="Assets/Boxes.jpg" name="BoxImage">
            <h3 class="browse-item-text-title" name="BoxItemName">Dice Box</h3>
            <div class="browse-item-text"><a class="browse-item-button">Add to Cart<br><div name="BoxPrice">$20.00</div></a>
                <?php
                    $sql = "INSERT INTO  (username, password, address) VALUES ('". $username ."', '". $password ."', '". $address ."')";
                ?>
                <div name="BoxDescription">This is a dice box, it will hold all your dice, its also great for rolling.</div></div>
        </div>
        <div class="browse-item">
            <img class="browse-item-img" src="Assets/Books.jpg" name="BookImage">
            <h3 class="browse-item-text-title" name="BookItemName">Books</h3>
            <div class="browse-item-text"><a class="browse-item-button">Add to Cart<br><div name="BoxPrice">$15.00</div></a><div name="Box Description">This is a book. It's great for taking notes.</div></div>
            
        </div>
    </div>
        
    <script type="text/javascript" src="FinalProject.js"></script>
</body>
</html>