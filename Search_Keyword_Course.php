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

$keywordfromform_Course_Num = $_GET["keyword_Course_Num"];
echo $keywordfromform_Course_Num;


//Search database for Name from user input
echo "<h2> Show all Courses with </h2>";

$sql = "SELECT * FROM Course WHERE Course_Num LIKE '%".$keywordfromform_Course_Num."%' ";


$result = $mysqli->query($sql);
?>


    <?php
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["Course_Num"]. " - Course Number: " . $row["Course_Title"]. " " . $row["Textbook"]. "<br>";
    echo "<table border='1'>

    <tr>
    <th>SSN</th>
    <th>Title</th>
    <th>Name</th>
    <th>Classroom</th>
    <th>Meeting Days</th>
    <th>Beginning Time</th>
    <th>Ending Time</th>
    </tr>";
  echo "<tr>";
    echo "<td>" . $row['Prof_SSN'] . "</td>";
    echo "<td>" . $row['Title'] . "</td>";
    echo "<td>" . $row['Prof_Name'] . "</td>";
    echo "<td>" . $row['Classroom'] . "</td>";
    echo "<td>" . $row['Meeting_Days'] . "</td>";
    echo "<td>" . $row['Beginning_Time'] . "</td>";
    echo "<td>" . $row['Ending_Time'] . "</td>";
    echo "</tr>";
  }
} else {
  echo "0 results";
}
?>

