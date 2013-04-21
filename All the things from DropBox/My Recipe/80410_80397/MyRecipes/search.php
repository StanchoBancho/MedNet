<div id="search">
	<form id="searchRecipe" name="searchRecipe" method="post" action="searchRecipes.php">
		<div id="dishtype">
			<div class="searchLabel">Dish type:</div>
			<div id="selectHolder">
				<select class="styledSelect" name="selectDishType">
					<option selected="selected"></option>
					<option value="Salads">Salads</option>
					<option value="Appetizers">Appetizers</option>
					<option value="Soups">Soups</option>
					<option value="Main Courses">Main Courses</option>
					<option value="Desserts">Desserts</option>
				</select>
			</div>
		</div>
		<div id="menutype">
			<div class="searchLabel">Menu type:</div>
			<div id="selectHolder">
				<select class="styledSelect" name="selectMealType">
					<option selected="selected"></option>
					<option value="Chicken">Chicken</option>
					<option value="Pork">Pork</option>
					<option value="Beef">Beaf</option>
					<option value="Seafood">Seafood</option>
					<option value="Fruits/Vegetables">Fruits/Vegetables</option>
				</select>
			</div>
		</div>
		<div id="readyin">
			<div class="searchLabel">Ready in:</div>
			<div id="selectHolder">
				<select class="styledSelect" name="selectReadyIn">
					<option selected="selected"></option>
					<option value="15">15 minutes</option>
					<option value="30">30 minutes</option>
					<option value="45">45 minutes</option>
					<option value="60">60 minutes</option>
				</select>
			</div>
		</div>
		<div class="newRow"></div>
		<div class="keywords">
			<div class="searchLabel">Keyword:</div>
			<div class="keywordsHolder">
				<input class="keywordsInput" type="text" name="keyword"></input>
			</div>
		</div>
		<div id="advancedSearch">
			<input id="searchButton" type="submit" value="ADVANCED SEARCH">
		</div>
	</form>
</div>