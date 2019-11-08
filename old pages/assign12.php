<?php

   $method = $_POST["method"];
   if ($method === "register")
   {
      echo register($_POST["data"]);
   }
   else{
      echo json_encode(getRegisteredStudents());
   }

    function register($data){
      if(filesize("data/student_registry.json") > 0){
         $content = getRegisteredStudents();
         array_push($content, $data);
         file_put_contents("data/student_registry.json", json_encode($content)) or die ("agh!!!!!");
      }
      else{
         file_put_contents("data/student_registry.json", "[".json_encode($data)."]", FILE_APPEND)or die("agh!!!!!");
      }
      return $data;
   }

   function getRegisteredStudents(){
      $content = file_get_contents("data/student_registry.json");
      return json_decode($content, true);
   }
?>