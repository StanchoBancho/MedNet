<?php
ob_start();
session_start();
include("databasereader.php");

function errorOccur() {
	$_SESSION['message'] = 'Error Occured!';
	header('location:register.php');
}

function validString($str) {
	if(preg_match('/^[a-z\d_]{3,20}$/i', $str)) {
		return true;
	}
	else {
		return false;
	}
}

$pass=$_POST['password'];
$passc=$_POST['passwordconfirm'];
$name=$_POST['name'];

$username = mysql_real_escape_string($username);
$pass = mysql_real_escape_string($pass);
$passc = mysql_real_escape_string($passc);
$name = mysql_real_escape_string($name);

if($passc=="" || $pass=="" || $name=="") {
	$_SESSION['message'] = 'All requered fields should be filled!';
	header('location:'.$_SERVER['HTTP_REFERER']);
}
else if(!validString($pass)){
	$_SESSION['message'] = 'Invalid password!';
	header('location:'.$_SERVER['HTTP_REFERER']);
}
else if($pass!=$passc) {
	$_SESSION['message'] = 'Passwords don\'t match!';
	header('location:'.$_SERVER['HTTP_REFERER']);
}
else {
	$username = $_SESSION['loggedUsername'];
	$pass = addslashes($pass);
	$passc = addslashes($passc);
	$name = addslashes($name);

	$encrypted_pass=md5($pass);
	$con = mysql_connect("localHost", "root", "dobb1ege1") or die(mysql_error());
	mysql_select_db("a2932684_db") or die(mysql_error());
	
	$sql = "UPDATE user SET RealName='$name', Password='$encrypted_pass' WHERE Username='$username'";
	$result=mysql_query($sql);
	if($result==false) {
		$_SESSION['message'] = 'The edit is not successful!';
		header('location:'.$_SERVER['HTTP_REFERER']);
	}

	$_SESSION['message'] = 'Editing finished successfully!';
	header('location:index.php');
	mysql_close($con);
}
ob_flush();
?>