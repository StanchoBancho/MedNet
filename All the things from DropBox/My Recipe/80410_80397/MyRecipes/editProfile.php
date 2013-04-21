<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
	include 'utility.php';
?>
		<div id="registerForm">
			<form id="form1" name="form1" method="post" action="userEdit.php" validate="true">
				<a id="cancelButton" href="
					<?php 
						$realPrevPage = Utility::getRealPrevPage();
						echo $realPrevPage;
					?>">
				</a>
				<p id="registerText">Editing your profile is quick and easy.</p>
				<p id="inform">*All fields are required.</p> 
				<div class="newRow"></div>
				<div class="keywords">
					<div class="searchLabel">Username:</div>
					<div id="usernameEditProfile">
						<?php 
						error_reporting(0);
							ob_start();
							session_start();
							if(isset($_SESSION['loggedId'])) {
								echo $_SESSION['loggedUsername'];
							} 
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
						error_reporting(0);
							ob_start();
							session_start();
							if(isset($_SESSION['loggedId'])) {
								echo '<input class="keywordsInput" name="name" type="text" value="'.$_SESSION['loggedName'].'"/>';
							}
							?>
					</div>
				</div>
				<p class="systemMessage">
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
						echo '<input class="registerButton" type="submit" name="submit" value="SAVE CHANGES"/>';
					?>
				</div>
			</form>
		</div>