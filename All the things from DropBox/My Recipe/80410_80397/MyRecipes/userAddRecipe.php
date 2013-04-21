<?php
ob_start();
session_start();
include("databasereader.php");

function errorOccur() {
	$_SESSION['message'] = 'Error Occured!';
	header('location:register.php');
}

$recipeName=$_POST['recipeName'];
$dishType=$_POST['dishType'];
$mealType=$_POST['mealType'];
$time=$_POST['time'];
$ingredients=$_POST['ingredients'];
$directions=$_POST['directions'];

$dishTypeId = 0;
	switch($dishType)
			{
				case "Salads":
				$dishTypeId = 0;
				break;
				
				case "Appetizers":
				$dishTypeId = 1;
				break;
				
				case "Soups":
				$dishTypeId = 2;
				break;
				
				case "Main Courses":
				$dishTypeId = 3;
				break;	
				
				case "Desserts":
				$dishTypeId = 4;
				break;
			}

$recipeName = mysql_real_escape_string($recipeName);
$dishType = mysql_real_escape_string($dishType);
$mealType = mysql_real_escape_string($mealType);
$time = mysql_real_escape_string($time);
$ingredients = mysql_real_escape_string($ingredients);
$directions = mysql_real_escape_string($directions);


if($recipeName=="" || $dishType=="") {
	$_SESSION['message'] = 'All requered fields should be filled!';
	header('location:'.$_SERVER['HTTP_REFERER']);
}
else {
	$recipeName = addslashes($recipeName);
	$dishType = addslashes($dishType);
	$mealType = addslashes($mealType);
	$time = addslashes($time);
	$ingredients = addslashes($ingredients);
	$directions = addslashes($directions);
	if ($time == "") {
		$time = 0;
	}
	
	$con = mysql_connect("localHost", "root", "dobb1ege1") or die(mysql_error());
	mysql_select_db("a2932684_db") or die(mysql_error());
	$ownerId = $_SESSION['loggedId'];
	$sql="INSERT INTO recipe (Name, HowTo, Ingredients, ReadyIn, DishType, MenuType, OwnerId) VALUES('$recipeName', '$directions', '$ingredients', $time, $dishTypeId, '$mealType', $ownerId)";

	$_SESSION['message'] = $sql;
	$result=mysql_query($sql);
	if($result==false) {
		$_SESSION['message'] = 'Error Occured! Your recipe is not saved';
		header('location:'.$_SERVER['HTTP_REFERER']);
	}
	$selectQuery = "SELECT Id FROM recipe WHERE Name='".$recipeName."'";
	DataBaseReader::connectToDataBase();
	$result = mysql_query($selectQuery) or die(mysql_error());
	$details = mysql_fetch_array($result);

	if	($_FILES['photoFile']) {
		if (($_FILES['photoFile']["type"] == "image/gif")
			|| ($_FILES["photoFile"]["type"] == "image/jpeg")
			|| ($_FILES["photoFile"]["type"] == "image/png")
			|| ($_FILES["photoFile"]["type"] == "image/pjpeg")) {
			 move_uploaded_file($_FILES["photoFile"]["tmp_name"], "images/" .$details['Id'].".jpg");
		}
	}

	$_SESSION['message'] = 'Adding recipe finished successfully!';
	header('location:'.$_SERVER['HTTP_REFERER']);
	mysql_close($con);
}
ob_flush();
?>