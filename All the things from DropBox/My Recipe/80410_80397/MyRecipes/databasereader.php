<?php
include 'recipe.php';

class DataBaseReader
{
	public static function connectToDataBase() 
	{
		mysql_connect("localHost", "root", "dobb1ege1") or die(mysql_error());
		mysql_select_db("a2932684_db") or die(mysql_error());
	}

	public static function &getMyFavoriteRecipes()
	{
		$ownerId = $_SESSION['loggedId'];
		$selectFavoriteRecipeIdsQuery = "SELECT RecipeFk FROM favorite WHERE UserFk =".$ownerId;
		DataBaseReader::connectToDataBase();
		$recipeIds = mysql_query($selectFavoriteRecipeIdsQuery) or die(mysql_error());
		$selectFavoriteRecipes = "SELECT Id, Name FROM recipe WHERE ";
		while ($line = mysql_fetch_array($recipeIds)) 
		{
			$selectFavoriteRecipes .= "Id = ";
			$selectFavoriteRecipes .= $line["RecipeFk"];
			$selectFavoriteRecipes .=" OR ";
		}
		$selectFavoriteRecipes .=" FALSE";
		$result = mysql_query($selectFavoriteRecipes) or die(mysql_error());
		return $result;
	}
	
	public static function &getMineRecipes()
	{
		$ownerId = $_SESSION['loggedId'];
		$selectQuery = "SELECT Id, Name FROM recipe WHERE OwnerId =".$ownerId;
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		return $result;
	}
	
	public static function &getAllRecipes($dishType)
	{
		$selectQuery = "SELECT Id, Name FROM recipe WHERE dishType =".$dishType;
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		return $result;
	}
	
	public static function &getDetailRecipe($recipeId)
	{
		$selectQuery = "SELECT * FROM recipe WHERE Id =".$recipeId;
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		$details = mysql_fetch_array($result);

		$newRecipe = new Recipe;
		$newRecipe->id = $details['Id'];
		$newRecipe->name = $details['Name'];
		$newRecipe->dishType = $details['DishType'];
		$newRecipe->mealType = $details['MealType'];
		$newRecipe->readyIn = $details['ReadyIn'];
		$newRecipe->ingredients = $details['Ingredients'];
		$newRecipe->directions = $details['HowTo'];
		$newRecipe->ownerId = $details['OwnerId'];
		$newRecipe->isFavorite = false;
		
		$newRecipeId = $newRecipe->id;
		$loggedUser = $_SESSION['loggedId'];
		if (($loggedUser == $newRecipe->ownerId) || ($loggedUser == 0)) {
			$newRecipe->isMine = true;
		}
		$selectQuery = "SELECT * FROM favorite WHERE RecipeFk=".$newRecipeId;
		$result = mysql_query($selectQuery) or die(mysql_error());
		while ($row = mysql_fetch_array($result)) {
			if ($loggedUser == $row['UserFk']) {
				$newRecipe->isFavorite = true;
				break;
			}
		}
		
		return $newRecipe;
	}
	
	public static function &searchRecipe($searchAttributes) 
	{	
		$selectQuery = "SELECT * FROM recipe WHERE ";
		$isThereAnyConstraint = FALSE;
		
		$dishType = mysql_real_escape_string($searchAttributes->dishType);
		if ($dishType != '') {
			if ($dishType == "Salads") {
				$dishTypeId = 0;
			} else if ($dishType == "Appetizers") {
				$dishTypeId = 1;
			} else if ($dishType == "Soups") {
				$dishTypeId = 2;
			} else if ($dishType == "Main Courses") {
				$dishTypeId = 3;
			} else if ($dishType == "Desserts") {
				$dishTypeId = 4;
			}
			$selectQuery .= "DishType=".$dishTypeId." AND ";
			$isThereAnyConstraint = TRUE;
		}
		
		$mealType = mysql_real_escape_string($searchAttributes->mealType);
		if	($mealType != '') {
			$selectQuery .= "MenuType='".$mealType."' AND ";
			$isThereAnyConstraint = TRUE;
		}
		$readyIn = $searchAttributes->readyIn;
		if	($readyIn !== '') {
			$selectQuery .= "ReadyIn <=".$readyIn." AND ";
			$isThereAnyConstraint = TRUE;
		}
		$keyword = $searchAttributes->keyword;
		if	($keyword != '') {
			$selectQuery .= "(Ingredients LIKE '%".$keyword."%' OR Name LIKE '%".$keyword."%')";
			$isThereAnyConstraint = TRUE;
		}
		else{
			$selectQuery =  substr($selectQuery, 0, strlen($selectQuery) - 5 );
		}
		
		if ($isThereAnyConstraint == FALSE){
			$selectQuery =  substr($selectQuery, 0, strlen($selectQuery)-1);
		}
		DataBaseReader::connectToDataBase();
		$result = mysql_query($selectQuery) or die(mysql_error());
		return $result;
	}
}
?>