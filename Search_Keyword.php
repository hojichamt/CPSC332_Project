<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
  </script>
</head>



<?php

include "Connect.php";

$keywordfromform = $_GET["keyword_FName"];
echo $keywordfromform;

 
//Search database for 88
echo "<h2> Show all IDs with </h2>";

$sql = "SELECT * FROM Student_Interface WHERE First_Name LIKE '%".$keywordfromform."%' ";


$result = $mysqli->query($sql);

?>

<div id="accordion">

<?php

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["Student_CWID"]. " - Student ID: " . $row["First_Name"]. " " . $row["Last_Name"]. "<br>";
  }
} else {
  echo "0 results";
}
?>

</div>