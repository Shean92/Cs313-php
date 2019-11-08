<?php 
session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>CrowDice</title>
    <link rel="stylesheet" href="CrowDiceWK3.css">
</head>
<body>
    <div class="title-section">
        <a href="CrowdiceWK3Browse.html"><img class="crowdice-icon" src="Assets/CrowDiceWhite.png"></a>
        <p class="subtitle">For When You're in a "Dicey" Situation</p>
        <a href="CrowdiceWK3Browse.html"><img class="icon" src="Assets/CartIcon.png"></a>
        <div class="cart-amount"></div>
    </div>
    <form>
        Color: <input class="color-selector" type="button" name="color" value="Red Oak">
        Design: <input type="file" name="customDesign">;
        
    </form>
    <?php
    echo '<form';
    ?>
        
    <script type="text/javascript" src="CrowDiceWK3.js"></script>
</body>
</html>