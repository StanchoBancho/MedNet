<?php 
	include 'header.php';
	include 'databasereader.php';
	$detailRecipe = &DataBaseReader::getDetailRecipe($_GET["id"]);
?>
	<div id="detail">
		<div id="favDelDiv">
			<form id="favRecipeForm" method="post" action="likeRecipe.php">
				<div class="delButtonDiv">
					<?php
					  if (isset($_SESSION['loggedId'])) {
						if	($detailRecipe->isFavorite) {
							echo '<input class="delButton" name="liked" type="submit" value="LIKED">';
						} else {
							echo '<input class="delButton" name="like" type="submit" value="LIKE">';
						}
					}
					?>
					<input type="hidden" name="recipeId" value="<?php echo $detailRecipe->id; ?>"/>
				</div>
			</form>
			<?php
			if (isset($_SESSION['loggedId'])) {
				if	($detailRecipe->isMine) {
					include 'delButtonForm.php';
				}
				}
			?>
		</div>
		<div class="newRow"></div>
		<div id="recipeImage"><img id="image" src="<?php 
														$imagePath = "images/".$detailRecipe->id.".jpg";
														if	(file_exists($imagePath) == false) {
															$imagePath = "images/default.jpg";
														}
														echo $imagePath; ?>" alt="recipe"></img></div>
		<div id="recipeTitleAndTime">
			<p id="recipeTitle"><?php echo $detailRecipe->name; ?></p>
			<p id="recipeTime">Total time: <?php echo $detailRecipe->readyIn; ?> mins</p>
		</div>
		<div class="newRow"></div>
		<div id="ingredients">
			<p class="infoTitle">Ingredients</p>
			<p class="recipeInfo">
				<?php 
					$ingredients = str_replace('\r\n', '<br>', $detailRecipe->ingredients);
					echo $ingredients; ?>
			</p>
		</div>
		<div id="howTo">
			<p class="infoTitle">Directions</p>
			<p class="recipeInfo">
			<?php echo $detailRecipe->directions; ?>
			</p>
		</div>
	</div>
<?php include 'footer.php'?>