<?php
class DataBaseReader
{

	public static function logText($text)
	{
		$file = 'serverInfo.log';
		// Write the contents to the file, 
		// using the FILE_APPEND flag to append the content to the end of the file
		// and the LOCK_EX flag to prevent anyone else writing to the file at the same time
		file_put_contents($file, $text, FILE_APPEND | LOCK_EX);
	}

	public static function connectToDataBase() 
	{
		$logText = 'Opitvam da se connectna'; 
		DataBaseReader::logText($logText);
		mysql_connect("localhost", "root", "kr0k0d1l") or die(mysql_error());
		//mysql_connect("mysql6.000webhost.com", "a1087829_user", "kr0k0d1l");
		mysql_select_db("a1087829_db");
		$logText1 = 'Uspqh da se connectna'; 
		DataBaseReader::logText($logText1);
	}

	public static function &getAllUsersCount()
	{
		$selectQuery = "SELECT count(*) From Users";
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		$result += 500;
		echo(esult);
		return $result;
	}
	
	public static function isUserRegistered($userMail)
	{
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
				DataBaseReader::logText($currentVisitsCount);
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
		//add new user
		$sql="INSERT INTO Users (email, visits_count) VALUES('$userMail', 1)";
		$resultOfRegistration=mysql_query($sql);		
		return $resultOfRegistration;
	}
}
?>