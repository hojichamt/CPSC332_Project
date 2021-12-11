<html>
    <head>

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
    </head>

        <body>
            <h1>California State University, Fullerton Database</h1>


            <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-Student" href="http://localhost:8888/index.php">Student</a>
  </li>
  <li class="nav-item">
    <a class="nav-Professor" href="http://localhost:8888/index3.php">Professor</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="http://localhost:8888/index2.php">Courses</a>
  </li>
</ul>

<?php

include "Connect.php";


//include "Search_Keyword_Course.php";

//include "Search_Keyword.php";

//include "Search_Quar.php";


?>
<form class="form-horizontal" action = "Search_Student_ID.php"  >
<fieldset>

<!-- Student Search -->
<legend>Search For Student</legend>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="keyword_Course_Num">Search</label>
  <div class="col-md-5">
    <input id="keyword_FName" name="keyword_FName" type="search" placeholder="e.g. 889900429" class="form-control input-md">
    <p class="help-block">Press search to see all Students.</p>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Search"></label>
  <div class="col-md-4">
    <button id="Search" name="Search" class="btn btn-primary">Search</button>
  </div>
</div>

</fieldset>
</form>
<?php



echo $mysqli->host_info . "<br>";


$mysqli->close();


            ?>
        </body>
    
</html>