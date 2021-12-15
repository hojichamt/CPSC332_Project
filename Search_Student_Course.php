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

$keywordfromform_Course_Num = $_GET["keyword_Course_Num"];
echo "Searching For: ".$keywordfromform_Course_Num;


//Search database for Name from user input

$sql = "SELECT Course.Course_Num, Enrollment_Records.Student_CWID, Section.Classroom, Section.Section_Num,
Section.Meeting_Days, Section.Beginning_Time, Section.Ending_Time, Section.Num_Of_Seats
FROM Course
INNER JOIN Section ON Section.Course_Num = Course.Course_Num
INNER JOIN Enrollment_Records ON Enrollment_Records.Section_Num = Section.Section_Num
WHERE Course.Course_Num LIKE '%".$keywordfromform_Student_CWID."%' ";


$sql2 = "SELECT Course_Num
FROM Course
WHERE Course_Num LIKE '%".$keywordfromform_Course_Num."%' ";

$result = $mysqli->query($sql);
$result2 = $mysqli->query($sql2);

if ($keywordfromform_Course_Num == NULL) {
  echo "<h2> Showing all Courses  </h2>";
  while($row2 = $result2->fetch_assoc()){

  echo "<tr> [] <td>". $row2['Course_Num'] . "</tr>   </td>";
   
  }

  }else if ($result->num_rows > 0) {

  echo "<h2> Showing information for: $keywordfromform_Course_Num </h2>";
  // output data of each row
  echo "<table border='1'>

  <tr>
  <th>Course</th>
  <th>Section Number</th>
  <th>Classroom</th>
  <th>Meeting Days</th>
  <th>Beginning Time</th>
  <th>Ending Time</th>
  <th>Students Enrolled</th>
  </tr>";

  if ($row = $result->fetch_assoc()){
  
    
  echo "<tr>";
  echo "<td>" . $row['Course_Num'] . "</td>";
  echo "<td>" . $row['Section_Num'] . "</td>";
  echo "<td>" . $row['Classroom'] . "</td>";
  echo "<td>" . $row['Meeting_Days'] . "</td>";
  echo "<td>" . $row['Beginning_Time'] . "</td>";
  echo "<td>" . $row['Ending_Time'] . "</td>";
  echo "<td>" . $row['Num_Of_Seats'] . "</td>";
  echo "</tr>";

  
 }  

}
else {
  echo "<h2> Cannot Find Course </h2>";
}
?>
<!---






--->
