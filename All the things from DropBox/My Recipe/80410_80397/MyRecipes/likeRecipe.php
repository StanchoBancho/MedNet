<?php
	include 'databasereader.php';
	ob_start();
	session_start();
	$userId = $_SESSION['loggedId'];
	$recipeId = $_POST['recipeId'];
	if	(isset($_POST['liked'])) {
		$selectQuery = "DELETE FROM favorite WHERE UserFk=$userId AND RecipeFk=$recipeId";
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
	} else if (isset($_POST['like'])) {
		$selectQuery = "INSERT INTO favorite (UserFk, RecipeFk) VALUES ('$userId', '$recipeId')";
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
	}
	header('location:'.$_SERVER['HTTP_REFERER']);
?>