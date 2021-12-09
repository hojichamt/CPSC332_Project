<?php

include "Connect.php";

$keywordfromform = $_GET["keyword_FName"];
echo $keywordfromform_FNAME;


//Search database for Name from user input
echo "<h2> Show all IDs with </h2>";

$sql = "SELECT * FROM Student_Interface WHERE First_Name LIKE '%".$keywordfromform_FName."%' ";


$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["Student_CWID"]. " - Student ID: " . $row["First_Name"]. " " . $row["Last_Name"]. "<br>";
  }
} else {
  echo "0 results";
}
?>