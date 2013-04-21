<?php
	include 'header.php';
	include 'databasereader.php';
	include 'searchAttributes.php';
?>

	<div id="recipes">
		<ul>
		<?php
		//$dbreader = new DataBaseReader();
		if (strcmp($_GET["id"], 'mine') == 0) {
			$allRecipes = &DataBaseReader::getMineRecipes();
			$isThereAnyRecipes = false;
			while($row = mysql_fetch_array($allRecipes)){
				$isThereAnyRecipes = true;
				echo '<li><a href="detailRecipe.php?id='.$row["Id"].'&recipe=0">'.$row["Name"].'</a></li>';
			}
			if(!$isThereAnyRecipes) {
				echo '<p class="infoP" color="#474448"> You do not have any recipes.</p>';
			}
		} else if (strcmp($_GET["id"], 'favorite') == 0) {
			$allRecipes = &DataBaseReader::getMyFavoriteRecipes();
			$isThereAnyRecipes = false;
				while($row = mysql_fetch_array($allRecipes)){
					$isThereAnyRecipes = true;
					echo '<li><a href="detailRecipe.php?id='.$row["Id"].'&recipe=0">'.$row["Name"].'</a></li>';
				}
			if(!$isThereAnyRecipes)
			{
				echo '<p class="infoP" color="#474448"> You do not have any favorite recipes.</p>';
			}
		} else if (strcmp($_GET["id"], 'search') == 0) { 
			$dishType = trim($_GET['dishType']);
			$mealType = trim($_GET['mealType']);
			$readyIn = trim($_GET['readyIn']);
			$keyword = trim($_GET['keyword']);

			$searchAttributes = new SearchAttributes;
			$searchAttributes->dishType = $dishType;
			$searchAttributes->mealType = $mealType;
			$searchAttributes->readyIn = $readyIn;
			$searchAttributes->keyword = $keyword;
			
			$allRecipes = &DataBaseReader::searchRecipe($searchAttributes);
			$isThereAnyRecipes = false;
			while($row = mysql_fetch_array($allRecipes)){
				$isThereAnyRecipes = true;
				echo '<li><a href="detailRecipe.php?id='.$row["Id"].'&recipe=0">'.$row["Name"].'</a></li>';
			}
			if(!$isThereAnyRecipes)
			{
				echo '<p class="infoP" color="#474448">No recipes found.</p>';
			}
		} else {
	
			$dishType = "";
			switch($_GET["id"])
			{
				case "salads":
				$dishType = 0;
				break;
				
				case "appetizers":
				$dishType = 1;
				break;
				
				case "soups":
				$dishType = 2;
				break;
				
				case "mainCourses":
				$dishType = 3;
				break;	
				
				case "desserts":
				$dishType = 4;
				break;
			}
			$allRecipes = &DataBaseReader::getAllRecipes($dishType);
			while($row = mysql_fetch_array($allRecipes)){
				echo '<li><a href="detailRecipe.php?id='.$row["Id"].'&recipe=0">'.$row["Name"].'</a></li>';
			}
		}
		?>
	</div>
<?php include 'footer.php'?>