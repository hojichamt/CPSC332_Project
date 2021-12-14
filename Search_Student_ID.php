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
echo "<h2> Show all IDs with </h2>";

$sql = "SELECT Student_Interface.Student_CWID, Student_Interface.First_Name, Student_Interface.Last_Name, 
Enrollment_Records.Section_Num, 
Course.Course_Title, Enrollment_Records.Grade 
FROM Enrollment_Records
INNER JOIN Student_Interface ON Student_Interface.Student_CWID = Enrollment_Records.Student_CWID
INNER JOIN Course ON Course.Course_Num = Enrollment_Records.Section_Num
WHERE Student_Interface.Student_CWID LIKE '%".$keywordfromform_Student_CWID."%' ";

$sql2 = "SELECT Student_CWID
FROM Student_Interface
WHERE Student_CWID LIKE '%".$keywordfromform_Student_CWID."%' ";

$result = $mysqli->query($sql);
$result2 = $mysqli->query($sql2);

if ($keywordfromform_Student_CWID == NULL) {
  while($row2 = $result2->fetch_assoc()){

    echo "<tr> [] <td>". $row2['Student_CWID'] . "</tr>   </td>";
  }

  }else if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    
    
   //echo "id: " . $row["Student_CWID"]. " - Student ID: " . $row["First_Name"]. " " . $row["Last_Name"]. "<br>";
   echo "<table border='1'>

    <tr>
    <th>CWID</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Section Number</th>
    <th>Course Title</th>
    <th>Grade</th>
    </tr>";
    echo "<tr>";
      echo "<td>" . $row['Student_CWID'] . "</td>";
      echo "<td>" . $row['First_Name'] . "</td>";
      echo "<td>" . $row['Last_Name'] . "</td>";
      echo "<td>" . $row['Section_Num'] . "</td>";
      echo "<td>" . $row['Course_Title'] . "</td>";
      echo "<td>" . $row['Grade'] . "</td>";
      echo "</tr>";
     
  }
      

      
  
  
} 
?>