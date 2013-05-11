<?php
include 'databaseReader.php';

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
		$return['msg'] = 'Вие вече сте абониран за получаване на известия с този е-мейл: '. $email . '. Благодарим ви за проявеният интерес.';
	}
	else{
		$result = DataBaseReader::registerUser($email);
		$return['msg'] = 'Вие се абонирахте успешно за получаване на известия на е-мейл адрес: '. $email;
	}
} 
echo json_encode($return);
 ?>