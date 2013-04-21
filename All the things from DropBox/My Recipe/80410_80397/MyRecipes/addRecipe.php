<?php include 'header.php'?>
	<div id="addRecipeDiv">
	<?php 
					error_reporting(0);
					ob_start();
					session_start();
					if(isset($_SESSION['message'])){
						$message = $_SESSION['message'];
						echo '<p color="#474448">'.$message.'</p>';
						unset($_SESSION['message']);
						ob_flush();
					} else {
						echo '</br>';
					}
					?>
		<form id="addRecipe" name="addRecipe" method="post" action="userAddRecipe.php" enctype="multipart/form-data" validate="true">
			<div class="divInput" id="nameInput"><p>Recipe Name*</p>
				<input class="input" id="nameInputText" name="recipeName" type="text"></input>
			</div>
			<div class="divInput" id="dishTypeInput"><p>Dish Type*</p>
				<select class="input" id="dishTypeSelect" name="dishType">
					<option selected="selected">&nbsp;</option>
					<option value="Salads">Salads</option>
					<option value="Appetizers">Appetizers</option>
					<option value="Soups">Soups</option>
					<option value="Main Courses">Main Courses</option>
					<option value="Desserts">Desserts</option>
				</select>
			</div>
			<div class="divInput" id="mealTypeInput"><p>Menu Type</p>
				<input class="input" id="nameInputText" name="mealType" type="text"></input>
			</div>
			<div class="divInput" id="timeInput"><p>Ready In</p>
				<input class="input" name="time" id="timeInputText" type="number" min="10" max="90"><span>minutes</span></input>
			</div>
			<div class="newRow"></div>
			<div class="divInput" id="ingredientsInput"><p>Ingredients</p>
				<textarea class="input" id="ingredientsInputText" name="ingredients"></textarea>
			</div>
			<div class="divInput" id="directionsInput"><p>Directions</p>
				<textarea class="input" id="directionsInputText" name="directions"></textarea>
			</div>
			<div class="newRow"></div>
			<div class="divInput" id="photoInput"><p>Choose Photo</p>
				<input class="input" id="photoFile" name="photoFile" type="file"/>
			</div>
			<div class="divInput" id="recipeSubmit">
				<input id="recipeButton" type="submit" value="ADD RECIPE"></input>
			</div>
			<div class="newRow"></div>
		</form>
	</div>
<?php include 'footer.php'?>