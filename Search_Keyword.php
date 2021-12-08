<?php

include "Connect.php";

$keywordfromform = $_GET["keyword"];
echo $keywordfromform;


//Search database for 88
echo "<h2> Show all IDs with </h2>";

$sql = "SELECT * FROM Student_Interface WHERE First_Name LIKE '%".$keywordfromform."%' ";


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