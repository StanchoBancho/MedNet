<?php

//Проверки дали логването е било успешно

ob_start();
session_start();
include("databasereader.php");

$myusername=$_POST['myusername'];
$mypassword=$_POST['mypassword'];

$myusername = stripslashes($myusername);
$mypassword = stripslashes($mypassword);

$myusername = mysql_real_escape_string($myusername);
$mypassword = mysql_real_escape_string($mypassword);

$myusername = trim($myusername);
$encrypted_mypassword=md5($mypassword);
mysql_connect("localHost", "root", "dobb1ege1") or die(mysql_error());
mysql_select_db("a2932684_db") or die(mysql_error());
$sql="SELECT * FROM user WHERE Username='$myusername' and Password='$encrypted_mypassword'";
$result = mysql_query($sql);

if(!$result || (mysql_numrows($result) < 1)){
	$_SESSION['message'] = 'Wrong username or password.';
	header('location:'.$_SERVER['HTTP_REFERER']);
}

$row=mysql_fetch_row($result);
if($row!=false) {
	$myid=(int)$row[0];
	$myname = $row[3];
	$_SESSION['loggedId'] = $myid;
	$_SESSION['loggedUsername'] = $myusername;
	$_SESSION['loggedName'] = $myname;
	header("location:index.php");
}
ob_flush();
?>