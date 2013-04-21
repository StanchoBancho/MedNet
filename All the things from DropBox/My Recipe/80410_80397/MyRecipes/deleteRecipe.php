<?php
	include 'databasereader.php';
	$recipeId = $_POST['recipeId'];
	$selectQuery = "DELETE FROM recipe WHERE Id=$recipeId";
	DataBaseReader::connectToDataBase();
	$result = mysql_query($selectQuery) or die(mysql_error());
	
	header('location:index.php');
?>