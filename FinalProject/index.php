<html>
<head>   
<link href="LaundryDay.css" type="text/css" rel="stylesheet" />
</head>
<body>
<?php
include 'LaundryDay.php';
 
$calendar = new Calendar();
 
echo $calendar->show();
?>
</body>
</html> 