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
        <img class="icon" href="FinalProjectCart.php" src="Assets/CartIcon.png">
        <div class="cart-amount">
            
        </div>
    </div>
    <div class="browse-list">
        <div class="browse-item">
            <img class="browse-item-img" src="Assets/Boxes.jpg">
            <h3 class="browse-item-text-title">Dice Box</h3>
            <div class="browse-item-text"><button class="browse-item-button" type="button">Add to Cart</button>This is a dice box, it will hold all your dice, its also great for rolling. Lorem ipsum and whatnot hahaha.</div> 
        </div>
        <div class="browse-item">
            <img class="browse-item-img" src="Assets/Books.jpg">
            <h3 class="browse-item-text-title">Books</h3>
            <div class="browse-item-text"><button class="browse-item-button" type="button">Add to Cart</button>This is a book. It's great for taking notes. This is crazy stuff man. What are you gonna do?</div>
            
        </div>
    </div>
        
    <script type="text/javascript" src="FinalProject.js"></script>
</body>
</html>