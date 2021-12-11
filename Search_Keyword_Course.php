<?php

include "Connect.php";

$keywordfromform_Course_Num = $_GET["keyword_Course_Num"];
echo $keywordfromform_Course_Num;


//Search database for Name from user input
echo "<h2> Show all Courses with </h2>";

$sql = "SELECT * FROM Course WHERE Course_Num LIKE '%".$keywordfromform_Course_Num."%' ";


$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["Course_Num"]. " - Course Number: " . $row["Course_Title"]. " " . $row["Textbook"]. "<br>";
  }
} else {
  echo "0 results";
}
?>