<?php
include 'databasereader.php';

$logText = 'I am in save-email.php\n'; 
		DataBaseReader::logText($logText);

if (empty($_POST['email'])) {
    $return['error'] = true;
    $return['msg'] = 'You did not enter you email.';
	//echo json_encode($return);
}
else {
    $return['error'] = false;
   	$email = $_POST['email'];
	DataBaseReader::connectToDataBase();
	$result = DataBaseReader::isUserRegistered($email);
	
	if($result == true)
	{
		$result = DataBaseReader::incrementUsersVisits($email);
		$logText = 'Result of visits count for user with email'.$email.' is '.$result .'\n'; 
		DataBaseReader::logText($logText);
		$return['msg'] = 'You\'re already registered with this email: ' . $email . '. But it is good that you did it again';
	}
	else{
		$result = DataBaseReader::registerUser($email);
		$return['msg'] = 'Congratulations. We will notify you on this email: ' . $email . '.';
	}
	
	
} 
echo json_encode($return);
 ?>