<html>
    <head>
        
    </head>

        <body>
            <h1>California State University, Fullerton Database</h1>
         

<?php

include "Connect.php";


include "Search_Keyword_Course_Num.php";

include "Search_Keyword.php";
?>
<form action="Search_Keyword.php">
  <label for="fname">Please Enter Name:</label><br>
  <input type="text" id="keyword" name="keyword_FName" ><br>
  <input type="submit" value="Submit">
</form>

<body> 
  <h2> Search For Grades </h2>
 </body>

<form action="Search_Keyword_Course_Num.php">
  <label for="fname">Please Enter Course Number:</label><br>
  <input type="text" id="keyword" name="keyword_Course_Num" ><br>
  <input type="submit" value="Submit">
</form>
<?php

//include "Search_Quar.php";

echo $mysqli->host_info . "<br>";


$mysqli->close();


            ?>
        </body>
    
</html>