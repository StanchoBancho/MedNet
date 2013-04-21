<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
	include 'utility.php';	
?>
		<div id="registerForm">
			<form id="form1" name="form1" method="post" action="userReg.php" validate="true">
				<a id="cancelButton" href="
					<?php 
						$realPrevPage = Utility::getRealPrevPage();
						echo $realPrevPage;
					?>
				"></a>
				<p id="registerText">Registering is quick and easy. Sign up for MyRecipes.com to share recipes. It's free and easy.</p>
				<p id="inform">*All fields are required.</p> 
				<div class="newRow"></div>
				<div class="keywords">
					<div class="searchLabel">Username:</div>
					<div class="keywordsHolder">
						<?php 				
							echo '<input class="keywordsInput" name="username" type="text"/>';			
							?>
					</div>
				</div>
				<div class="keywords">
					<div class="searchLabel">Password:</div>
					<div class="keywordsHolder">
						<input class="keywordsInput" name="password" type="password"/>
					</div>
				</div>
				<div class="keywords">
					<div class="searchLabel">Confirm Password:</div>
					<div class="keywordsHolder">
						<input class="keywordsInput" name="passwordconfirm" type="password"/>
					</div>
				</div>
				<div class="keywords">
					<div class="searchLabel">Name:</div>
					<div class="keywordsHolder">
						<?php 
							echo '<input class="keywordsInput" name="name" type="text"/>';
						?>
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
					<?php
						echo '<input type="submit" form="form1" class="registerButton" name="submit" value="REGISTER"/>';
					?>
				</div>
			</form>
		</div>