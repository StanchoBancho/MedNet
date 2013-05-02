<?php
class DataBaseReader
{

	public static function logText($text)
	{
		//$file = 'localhost/MedNet/LandingPage/MedNet/serverInfo.log ';
		$file = '../../serverInfo.log';
		// Write the contents to the file, 
		// using the FILE_APPEND flag to append the content to the end of the file
		// and the LOCK_EX flag to prevent anyone else writing to the file at the same time
		$textWithEndOfLine = $text.PHP_EOL;
		file_put_contents($file, $textWithEndOfLine, FILE_APPEND | LOCK_EX);
	}

	public static function connectToDataBase() 
	{
		$logText = 'Try to connect to database.'; 
		DataBaseReader::logText($logText);
		
		//this will connect us to the local host
		
//		$link = mysql_connect("localhost", "root", "kr0k0d1l") or die(mysql_error());
//		mysql_select_db("a1087829_db");

		//this will connect us doctorsbraek.com
	    
	    $link = mysql_connect("localhost", "doctorsb_root", "M0*qpkEqlxHU");
		if (!$link) {
			$logText1 = 'Connection fail '; 
 			DataBaseReader::logText($logText1);
		    die('Could not connect: ' . mysql_error());
		}
		$logText1 = 'Successfully connected '; 
 		DataBaseReader::logText($logText1);
 		
 		mysql_select_db("doctorsb_database");
	}

	public static function &getAllUsersCount()
	{
		$selectQuery = "SELECT count(*) From Users";
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		$logText = 'Get all user count is'.$result; 
		DataBaseReader::logText($logText);
		$result += 500;
		return $result;
	}
	
	public static function isUserRegistered($userMail)
	{
		$logText1 = 'Check is user:'.$userMail.' connected'; 
 		DataBaseReader::logText($logText1);
		$selectQuery = "SELECT * FROM Users WHERE email = '$userMail'";
		$rowData = mysql_query($selectQuery);
		if($rowData){
			$rows=mysql_num_rows($rowData);
			if($rows > 0) {
				return true;
			}
		}
		return false;
	}
	
	public static function incrementUsersVisits($userMail)
	{
		// increment user`s visits	
		$selectQuery = "SELECT * FROM Users WHERE email = '$userMail'";
		$fetchResult = mysql_query($selectQuery);
		
		if($fetchResult && (mysql_numrows($fetchResult) > 0))
		{		
			$row=mysql_fetch_row($fetchResult);
			if($row != false )
			{	
				$currentVisitsCount =  $row[0];
				$currentVisitsCount += 1;
				$text = "Increment user visitations of user".$userMail." count:".$currentVisitsCount;
				DataBaseReader::logText($text);
				$incrementVisitsCountSQL="UPDATE Users SET(visits_count = $currentVisitsCount) WHERE('userMail' = $userMail)";	
				$resultOfRegistration = mysql_query($incrementVisitsCountSQL);
				return $resultOfRegistration;
			}	
			return false;
		}
		return false;
	}
	
	public static function registerUser($userMail)
	{
		$logText1 = 'Add new user:'.$userMail; 
 		DataBaseReader::logText($logText1);
		//add new user
		$sql="INSERT INTO Users (email, visits_count) VALUES('$userMail', 1)";
		$resultOfRegistration=mysql_query($sql);
		$text = "Register user:".$userMail." status:".$resultOfRegistration;
		DataBaseReader::logText($text);		
		return $resultOfRegistration;
	}
}
?>