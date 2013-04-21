<div id="header">
			<div id="upper"></div> 
			<a href="index.php?id=index"><div id="logo"></div></a>
			<div id="container">
				<nav id="navcontainer">

				<ul id="navigation">
					<span id="other">
						<li><a id="saladLink" href="layout.php?id=salads">Salads</a></li>
						<li><a id="appetizersLink" href="layout.php?id=appetizers">Appetizers</a></li>
						<li><a id="soupsLink" href="layout.php?id=soups">Soups</a></li>
						<li><a id="mainCoursesLink" href="layout.php?id=mainCourses">Main Courses</a></li>
						<li><a id="dessertsLink" href="layout.php?id=desserts">Desserts</a></li>
					</span>
					<?php 
						error_reporting(0);
						ob_start();
						session_start();
						
						if(isset($_SESSION['loggedId'])) {
						?>
							<span id="sign">
								<li><a href="userLogout.php">Log Out</a></li>
								<li><a href="#">My Profile</a>
									<ul id="nested">
									
										<li class="nestedLi"><a href="<?php if (isset($_GET['id'])) {
														$q="&";
													} else {
														$q="?";
													} 
													echo $_SERVER['REQUEST_URI'].$q.'add=1&type=2';?>">Edit Profile</a></li>
										<li class="nestedLi"><a href="addRecipe.php?id=addRecipe">Add Recipe</a></li>
										<li class="nestedLi"><a href="layout.php?id=mine">My Recipes</a></li>
										<li class="nestedLi"><a href="layout.php?id=favorite">Favorite Recipes</a></li>
									</ul>
								</li>
							</span>
						<?php
						} else {
						?>
							<span id="sign">
								<li><a href="<?php if (isset($_GET['id'])) {
														$q="&";
													} else {
														$q="?";
													} 
													echo $_SERVER['REQUEST_URI'].$q.'add=1&type=0';?>">Sign In</a></li>
								<li><a href="<?php if (isset($_GET['id'])) {
														$q="&";
													} else {
														$q="?";
													} 
													echo $_SERVER['REQUEST_URI'].$q.'add=1&type=1';?>">Register</a></li>
							</span>
						<?php }?>
				</ul>
								<div class="newRow"></div>
				</nav>
				<?php
					include 'search.php';?>
			</div>
</div> 	