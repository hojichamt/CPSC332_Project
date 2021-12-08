<html>
    <head>
        
    </head>

        <body>
            <h1>California State University, Fullerton Database</h1>
         

<?php

include "Connect.php";




//include "Search_Keyword.php";
?>
<form action="Search_Keyword.php">
  <label for="fname">Please Enter Name:</label><br>
  <input type="text" id="keyword" name="keyword" ><br>
  <input type="submit" value="Submit">
</form>
<?php

//include "Search_Quar.php";

echo $mysqli->host_info . "<br>";


$mysqli->close();


            ?>
        </body>
    
</html>