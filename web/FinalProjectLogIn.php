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
        <a href="CrowdiceWK3Cart.html"><img class="icon" src="Assets/CartIcon.png"></a>
        <div class="cart-amount"></div>
    </div>
    <form>
        <h3>Log In</h3>
        <div>Username:</div>
        <input type="text" name="username">
        <br>
        <div>Password:</div>
        <input type="text" name="password"><br>
        <button class="log-in">Log In</button>
    </form>
    <?php
        echo '<form>
        <h3>Log In</h3>
        <div>Username:</div>
        <input type="text" name="username">
        <br>
        <div>Password:</div>
        <input type="text" name="password"><br>
        <button class="log-in">Log In</button>
        </form>'
    ?>
    
    <script type="text/javascript" src="FinalProject.js"></script>
</body>
</html>