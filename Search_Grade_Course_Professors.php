
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

$keywordfromform_Prof_Section= $_GET["keyword_Prof_Grades"];

$keywordfromform_Prof_Course= $_GET["keyword_Section_Num"];


echo "<h2> Professor Information </h2>";



$sql = "SELECT Grade, COUNT(Grade) as count
FROM Enrollment_Records INNER JOIN Section
ON Enrollment_Records.Section_Num = Section.Section_Num
WHERE Section.Course_Num LIKE '%.$keywordfromform_Prof_Course.%'
AND Section.Section_Num LIKE '%.$keywordfromform_Prof_Section.%'
GROUP BY Grade";

$result = $mysqli->query($sql);


if ($keywordfromform_Prof_Course == NULL|| $keywordfromform_Prof_Section == NULL) {
  

    echo " Please enter a Course and Section";
  

  }else if ($result->num_rows > 0) {
  // output data of each row

  while($row = $result->fetch_assoc()) {



   $output = $row['count'];

   $grades = array_merge(
    $gradeTemplate,
    $retrievedGrades);

    echo "<table border='1'>

<tr>
<th>A+</th>
<th>A</th>
<th>A-</th>
<th>B+</th>
<th>B</th>
<th>B-</th>
<th>C+</th>
<th>C</th>
<th>C-</th>
<th>D+</th>
<th>D</th>
<th>D-</th>
<th>F+</th>
<th>F</th>
<th>F-</th>
</tr>";
echo "<tr>";

  echo "<td>" . $row['count'] . "</td>";

  echo "</tr>";


  }
} 

?>
<h4 id="professors-grade-course-title"></h4>

<!---

<table class="table table-striped table-bordered classes">
<thead>
<tr>
<th>A</th>
<th>A-</th>
<th>B+</th>
<th>B</th>
<th>B-</th>
<th>C+</th>
<th>C</th>
<th>C-</th>
<th>D+</th>
<th>D</th>
<th>D-</th>
<th>F</th>
</tr>
 </thead>
-->