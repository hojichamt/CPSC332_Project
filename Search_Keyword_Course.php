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
echo "<h2> Show all Courses with </h2>";

$sql = "SELECT Student_Interface.First_Name, Student_Interface.Last_Name,Course.Course_Num, Enrollment_Records.Student_CWID, Section.Classroom, 
Section.Meeting_Days, Section.Beginning_Time, Section.Ending_Time, Section.Num_Of_Seats
FROM Course
INNER JOIN Section ON Section.Section_Num = Course.Course_Num
INNER JOIN Enrollment_Records ON Enrollment_Records.Section_Num = Section.Section_Num
INNER JOIN Student_Interface ON Student_Interface.Student_CWID = Enrollment_Records.Student_CWID
WHERE Course.Course_Num LIKE '%".$keywordfromform_Course_Num."%' ";


$result = $mysqli->query($sql);

if ($keywordfromform_Course_Num == NULL) {
  while($row = $result->fetch_assoc()){

    
  echo "<table border='1'>
  <tr>
  <th>Courses</th>
  </tr>";
  echo "<tr>";
  echo "<td>" . $row['Course_Num'] . "</td>";
      echo "</tr>";
    
      
  }

  }else if ($result->num_rows > 0) {
  // output data of each row
  if ($row = $result->fetch_assoc()){
echo "<table border='1'>

  <th>Classroom</th>
  <th>Meeting Days</th>
  <th>Beginning Time</th>
  <th>Ending Time</th>
  <th>Students Enrolled</th>
  </tr>";

  echo "<tr>";
   echo "<td>" . $row['Classroom'] . "</td>";
    echo "<td>" . $row['Meeting_Days'] . "</td>";
    echo "<td>" . $row['Beginning_Time'] . "</td>";
    echo "<td>" . $row['Ending_Time'] . "</td>";
    echo "<td>" . $row['Num_Of_Seats'] . "</td>";
    echo "</tr>";

    echo "<br>";

  }
  while($row = $result->fetch_assoc()) {
    //echo "id: " . $row["Course_Num"]. " - Course Number: " . $row["Course_Title"]. " " . $row["Textbook"]. "<br>";
    echo "<table border='1'>
    <tr>
    <th>Student CWID</th>
    <th>First Name</th>
    <th>Last Name</th>
    </tr>";

  echo "<tr>";
    echo "<td>" . $row['Student_CWID'] . "</td>";
    echo "<td>" . $row['First_Name'] . "</td>";
    echo "<td>" . $row['Last_Name'] . "</td>";
    echo "</tr>";
  }
} 
?>

