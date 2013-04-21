<div id="registerContainer">
	<?php
		if ($type == 0) {
			include 'signin.php';
		} else if ($type == 1) {
			include 'register.php';
		} else {
			include 'editProfile.php';
		}
	?>
</div>