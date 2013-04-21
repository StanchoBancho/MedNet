<div id="registerForm">
	<form id="signForm" name="signForm" method="post" action="userLogin.php" validate="true">
		<a id="cancelButton" href="
			<?php 
				include 'utility.php';	
				$realPrevPage = Utility::getRealPrevPage();
				echo $realPrevPage;
			?>
		">
		</a>
		<p id="registerText">Sign in for MyRecipes.com to share recipes and save your favorite ones. It's free and easy.</p>
		<p id="inform">*All fields are required.</p> 
		<div class="newRow"></div>
		<div class="keywords">
			<div class="searchLabel">Username:</div>
			<div class="keywordsHolder">
				<input class="keywordsInput" name="myusername"  type="text"></input>
			</div>
		</div>
		<div class="keywords">
			<div class="searchLabel">Password:</div>
			<div class="keywordsHolder">
				<input class="keywordsInput" name="mypassword"  type="password"></input>
			</div>
		</div>
		<p id="systemMessage">
					<?php 
					error_reporting(0);
					ob_start();
					session_start();
					if(isset($_SESSION['message'])){
						$message = $_SESSION['message'];
						echo $message;
						unset($_SESSION['message']);
						ob_flush();
					} else {
						echo '</br>';
					}
					?>
		</p>
		<div class="formSubmitButtonDiv">
				<input id="registerButton" class="registerButton" type="submit" value="SIGN IN">
		</div>
	</form>
</div>