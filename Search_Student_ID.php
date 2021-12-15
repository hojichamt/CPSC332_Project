<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <style>
 table

{

border-style:solid;

border-width:5px;

}
</style>
</head>

<?php

include "Connect.php";

$keywordfromform_Student_CWID = $_GET["keyword_Student_CWID"];
echo "Searching For: ". $keywordfromform_Student_CWID;


//Search database for Name from user input

$sql = "SELECT Section.Course_Num, Enrollment_Records.Grade, Enrollment_Records.Student_CWID
FROM Section
INNER JOIN Enrollment_Records 
ON Section.Section_Num = Enrollment_Records.Section_Num
WHERE Enrollment_Records.Student_CWID LIKE '%".$keywordfromform_Student_CWID."%' ";

$sql2 = "SELECT Student_CWID
FROM Student_Interface
WHERE Student_CWID LIKE '%.$keywordfromform_Student_CWID.%' ";

$result = $mysqli->query($sql);
$result2 = $mysqli->query($sql2);

if ($keywordfromform_Student_CWID == NULL) {
  echo "<h2> Please enter a CWID </h2>";

  }else if ($result->num_rows > 0) {
  echo "<h2> Show Classes and Grades for ID  $keywordfromform_Student_CWID</h2>";
  // output data of each row
  echo "<table border='1'>

    <tr>
    <th>CWID</th>
    <th>Course Title</th>
    <th>Grade</th>
    </tr>";

  while($row = $result->fetch_assoc()) {
   
    echo "<tr>";
      echo "<td>" . $row['Student_CWID'] . "</td>";
      echo "<td>" . $row['Course_Num'] . "</td>";
      echo "<td>" . $row['Grade'] . "</td>";
      echo "</tr>";
     
  }
      

      
  
  
} 
else{
  echo "<h2> Cannot Find CWID </h2>";
}
?>