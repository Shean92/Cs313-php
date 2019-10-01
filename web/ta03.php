<html>
<head>
<title>Team Activity 03</title>
<link rel="stylesheet" type="text/css" href="ta03.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
</head>
<body id="page">

<form action="ta03.php" method="post">

Name: <input type="text" name="name" id="name"> <br>
Email: <input type="text" name="email" id="email"> <br>
Major:
<input type="radio" name="major" value="CS"> Computer Science<br>
<input type="radio" name="major" value="WDD"> Web Design and Development<br>
<input type="radio" name="major" value="CIT"> Computer Information Technology<br>
<input type="radio" name="major" value="CE"> Computer Engineering<br>
Comments: <input type="text" name="comments"><br>
Check the continents: <br>
<input type="checkbox" name="continents[]" value="North America"> North America<br>
<input type="checkbox" name="continents[]" value="South America"> South America <br>
<input type="checkbox" name="continents[]" value="Europe"> Europe <br>
<input type="checkbox" name="continents[]" value="Asia"> Asia <br>
<input type="checkbox" name="continents[]" value="Austrailia"> Austrailia <br>
<input type="checkbox" name="continents[]" value="Africa"> Africa <br>
<input type="checkbox" name="continents[]" value="Antarctica"> Antarctica <br>

<input type="submit" value="Submit">
</form>

<?php
echo 'Your name is: '. $_POST["name"]. '<br>';
echo 'Your email is: <a href="mailto:' .$_POST["email"]. ' ">'.$_POST["email"].'</a><br>';
echo 'Your major is: '. $_POST["major"]. '<br>';
echo 'Your comment is: '. $_POST["comments"]. '<br>';

$continents = $_POST['continents'];
  if(empty($continents)) 
  {
    echo("You didn't select any continents.");
  } 
  else
  {
    $N = count($continents);

    echo("You selected $N continents: <br>");

    foreach($_POST['continents'] as $selected){
      echo "You have selected: ". $selected."</br>";
    }
  }
?>
</body>
</html>
