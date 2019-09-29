<!DOCTYPE html>
<html>
<head>
    <title>Homepage of Shean Brunner</title>
    <link rel="stylesheet" href="Homepage.css">
</head>
<body>
    <div class="Introduction">
        <img class="My-Image" src="Assets/me.jpg" alt="A picture of me">
        <h2>I'm Shean Brunner.</h2>
        <p class="Intro-Text">My wife and I were born in Las Vegas. I love making games through Unity and am trying to get better at game development. I love singing and dancing and art. I like to play D&#38D, Magic The Gathering, and Hearthstone.</p>
        <button class="btn" type="button" onclick="assignmentButton()">My Projects</button>
        <br>
        <br>
        <?php
        echo "Also I know PHP!<br>";
        $x = 2;
        echo "x = $x <br>";
        $y = 2;
        echo "y = $y <br>";
        echo "x + y = ", $x+$y, "<br>";
        ?>
    </div>
    <script type="text/javascript" src="Homepage.js"></script>
</body>
</html>