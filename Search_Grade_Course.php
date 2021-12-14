
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

$keywordfromform_Prof_Grades= $_GET["keyword_Prof_Grades"];
echo "Searching For: ". $keywordfromform_Prof_Grades;

 
//Search database for 88
echo "<h2> Professor Information </h2>";



$sql = "SELECT Section.Course_Num, Enrollment_Records.Grades, COUNT(grade) AS grade_count
FROM Section 
INNER JOIN Enrollment_Records ON Section.Section_Num = Enrollment_Records.Section_Num
WHERE Enrollment_Records.Student_CWID LIKE '%".$keywordfromform_Prof_Grades."%' ";

$result = $mysqli->query($sql);

if ($keywordfromform_Prof_SSN == NULL) {
  while($row2 = $result2->fetch_assoc()){

    echo "<tr> [] <td>". $row2['Prof_SSN'] . "</tr>   </td>";
  }

  }else if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
echo "<table border='1'>

<tr>
<th>A+</th>
<th>A</th>
<th>B+</th>
<th>B</th>
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
} 

?>

