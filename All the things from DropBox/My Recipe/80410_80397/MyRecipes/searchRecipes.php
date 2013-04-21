<?php
	include 'databasereader.php';
	$url =  'location:layout.php?id=search';
	$dishType = trim($_POST['selectDishType']);
	if($dishType != ''){
		$url .='&dishType='.$dishType;
	}
	$mealType = trim($_POST['selectMealType']);
	if($mealType != ''){
		$url .='&mealType='.$mealType;
	}
	$readyIn = trim($_POST['selectReadyIn']);
	if($readyIn != ''){
		$url .='&readyIn='.$readyIn;
	}
	$keyword = trim($_POST['keyword']);
	if($keyword != ''){
		$url .='&keyword='.$keyword;
	}
	header($url);
?>