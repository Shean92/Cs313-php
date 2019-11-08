

CREATE TABLE scriptures (
    id      int,
    book    varchar(255),
    chapter int,
    verse   int,
    content varchar(255),
    PRIMARY KEY(id)
);

INSERT INTO scriptures (id, book, chapter, verse, content) VALUES (1, 'John', 1, 5, 'And the light shineth in darkness; 
and the darkness ccomprehended it not.');

INSERT INTO scriptures (id, book, chapter, verse, content) VALUES (2, 'Doctrine and Covenants', 88, 49, 'The light shineth in darkness, and the darkness comprehendeth 
it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in 
him and by him.');

INSERT INTO scriptures (id, book, chapter, verse, content) VALUES (3, 'Doctrine and Covenants', 93, 28, 'He that keepeth his commandments 
receiveth truth and light, until he is glorified in truth and knoweth all things.');

INSERT INTO scriptures (id, book, chapter, verse, content) VALUES (4, 'Mosiah', 16, 9, 'He is the light and the life of the world; yea, a light that is endless, that can never 
be darkened; yea, and also a life which is endless, that there can be no more death.');

<?php
echo '<h1><strong>Scripture Resources</strong></h1>';
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

foreach ($db->query('SELECT book, chapter, verse, content FROM scriptures') as $row)
{
  echo '<strong>' . $row['book'];
  echo ' ' . $row['chapter'];
  echo ':' . $row['verse'];
  echo '-</strong> &quot' . $row['content'] . '&quot';
  echo '<br/>';
}

echo '<form action=ta05.php method=POST>';
echo 'Book: <input type=text name=book>';
echo '<input type=submit value=Search>';
echo '</form>';

$book = $_POST['book'];

foreach ($db->query('SELECT book, chapter, verse, content FROM scriptures WHERE book =' . '\''. $book . '\'') as $row)
{
  echo '<strong>' . $row['book'];
  echo ' ' . $row['chapter'];
  echo ':' . $row['verse'];
  echo '-</strong> &quot' . $row['content'] . '&quot';
  echo '<br/>';
}
?>

/*----------------------------------------------------Team Activity 06-------------------------------------------------------*/




CREATE TABLE scriptures (
    id      int,
    book    varchar(255),
    chapter int,
    verse   int,
    content varchar(255),
    PRIMARY KEY(id)
);

CREATE TABLE topic (
id       SERIAL      PRIMARY KEY,
name     varchar(25)
);

INSERT INTO topic (name)  VALUES ('Faith');
INSERT INTO topic (name)  VALUES ('Sacrifice');
INSERT INTO topic (name)  VALUES ('Charity');

CREATE TABLE topicalguide(
	tg_id				 SERIAL PRIMARY KEY,
	topic_id	   SERIAL,
	scripture_id int,
	FOREIGN KEY (topic_id) REFERENCES topic(id),
	FOREIGN KEY (scripture_id) REFERENCES scriptures(id)
);

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

echo '<form action=/ta06b.php method=post>';
echo 'ID: <input type=text name=id><br>';
echo 'Book: <input type=text name=book><br>';
echo 'Chapter: <input type=text name=chapter><br>';
echo 'Verse: <input type=text name=verse><br>';
echo 'Content: <input type=textarea name=content><br>';

foreach ($db->query('SELECT name FROM topic') as $row)
{
	$topic = $row[name];
  echo '<input type=checkbox name=topic[] value='. $topic .'>' . $topic .'<br>';
}

echo '<input type=submit value=Submit>';
echo '</form>';
?>

<!--ta06b.php-->
<?php
$insert_scripture = 'INSERT INTO scriptures (id, book, chapter, verse, content) VALUES('. $_POST['id'] .','. '\''. $_POST['book'] . 
'\''. ',\''. $_POST['chapter'] 
. '\'' . ',' . '\'' . $_POST['verse'] . '\'' . ',' . '\'' . $_POST['content'] . '\'');
$stmt = $this->pdo->prepare($insert_scripture);


if(isset($_POST['topic'])) {
    foreach($_POST['topic'] as $topic) {
    		if (isset($topic)) {
    			$topic_id = 'SELECT id FROM topic WHERE name=' . $topic;
        	$insert_tg = 'INSERT INTO topicalguide (scripture_id) VALUES($_POST['id'])';
        	$stmt = $this->pdo->prepare($insert_tg);
        }
    }
}
?>

After a user submits the form, have the application show a page that lists all the scriptures in the database, each one with its 
associated topics.
Using your PHP page, insert the following scriptures into the database along with the applicable topics:

Hebrews 11:4
By faith Abel offered unto God a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, God testifying of his gifts: and by it he being dead yet speaketh.

1 Corinthians 13:13
And now abideth faith, hope, charity, these three; but the greatest of these is charity.

Moroni 7:47
But acharity is the pure blove of Christ, and it endureth cforever; and whoso is found possessed of it at the last day, it shall be well with him.









<!----------------------------------------------------WEEK 07----------------------------------------------------------------------------------------------------------------------------->
CREATE TABLE users (
id       SERIAL PRIMARY KEY,
username VARCHAR(20),
password VARCHAR(250));

<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
<h1>Welcome to this site!</h1>
Click <a href="signin.php">here</a> to sign in
</body>
</html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Sign-In</title>
</head>

<body>
    <div>
        <form action="signin.php" method="post">
            Username: <input type="text" name="username" placeholder="Username"><br>
            Password: <input type="password" name="password" placeholder="Password"><br>
            <button type="submit" name="login-submit">Sign In</button><br>
            <div>Don't have an account yet? Click' <a href="signup.php">here</a> to sign up</div>
        </form>
    </div>
</body>
</html>

<?php

session_start();

try {
    $dbUrl = getenv('DATABASE_URL');

    $dbOpts = parse_url($dbUrl);

    $dbHost = $dbOpts['host'];
    $dbPort = $dbOpts['port'];
    $dbUser = $dbOpts['user'];
    $dbPassword = $dbOpts['pass'];
    $dbName = ltrim($dbOpts['path'], '/');

    $db = new PDO("pgsql:host=$dbHost;port=$dbPort;dbname=$dbName", $dbUser, $dbPassword);

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $ex) {
    echo 'Error!: ' . $ex->getMessage();
    die();
}

$username = $_POST['username'];
$password = $_POST['password'];
$_SESSION['username'] = $username;

try {
    $stmt = $db->prepare("SELECT password FROM users WHERE username = :name");
                $stmt->bindValue(':name', $username, PDO::PARAM_STR);
                $stmt->execute();
                $row = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $stored_password = $row[0]['password'];

    if (password_verify($password, $stored_password)) {
        echo "Success!!!!!!!!!!!!!!!!!!!!!!!";
        header("refresh:1; url=welcome.php");
        die();
    } else {
        echo "hashed pw:".$password;
        echo 'Incorrect password! Please, try again.';
        die();
    }
} catch (PDOException $ex) {
    echo 'Error!: ' . $ex->getMessage();
    die();
}
?>

<html>
<head>
        <meta charset="UTF-8">
        <title>Sign Up</title>
</head>
<body>
    <div>
        <a style="float:right" href="signin.php">Sign In</a><br>
    </div>

    <hr><br>

    <div>
        <h1>Sign Up</h1>
        <form action="signupSql.php" method="post">
            Username: <input type="text" name="uid" placeholder="Username"><br>
            Password: <input type="password" name="pwd" placeholder="Password"><br>
            Please re-enter password: <input type="password" name="pwd-repeat" placeholder="Confirm Password"><br>
            <input type="submit" name="signup-submit" value=SignUp>
        </form>
    </div>
    
</body>
</html>
<?php
    $username = $_POST['uid'];
    $password = $_POST['pwd'];
    $password_confirm = $_POST['pwd-repeat'];

   /* if (empty($username) || empty($password) || empty($passwordconfirm)) {
        echo '';
        header("Location: signup.php?error=emptyfields&uid=".$username);
        exit();
    }
    else if (!preg_match("/^[a-zA-Z0-9]*$/", $username)) {
        header("Location: signup.php?error=invaliduid&email=".$email);
        exit();
    }
    else if ($password !== $passwordconfirm) {
        header("Location: signup.php?error=passwrodcheck&uid=".$username."&email=".$email);
        exit();
    }
    else {*/
         $hashed_password = password_hash($password, PASSWORD_DEFAULT);
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

            $stmt = $db->prepare("INSERT INTO users (username, password) VALUES (:name, :pw)");
                $stmt->bindValue(':name', $username, PDO::PARAM_STR);
                $stmt->bindValue(':pw', $hashed_password, PDO::PARAM_STR);
                $stmt->execute();
                $row = $stmt->fetchAll(PDO::FETCH_ASSOC);
            header("refresh:1; url=signin.php");
        }
        catch (PDOException $ex)
        {
        echo 'Error!: ' . $ex->getMessage();
        die();
        }
   // }
?>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
<?php 
session_start();
    $username = $_SESSION['username'];
  echo 'Welcome' . $username . '!';
?>
</body>
</html>