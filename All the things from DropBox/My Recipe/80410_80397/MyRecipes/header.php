<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>My Recipes</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
	<link href="images/stylesheet.css" rel="stylesheet" type="text/css"/>
</head>
<body id="<?php echo $_GET["id"]?>">
	<div id="maincontainer">
		<?php 
			//Toolbar + SearchBar
			//error_reporting(0);
			include 'navigation.php';
			if (isset($_GET['add'])) {
				//unset($GET['add']);
				$type = $_GET['type'];
				$registerType = $_GET['registerType'];
				include 'signForm.php';
				
			}
		?>
		<div id="contentContainer">
			<div id="content">