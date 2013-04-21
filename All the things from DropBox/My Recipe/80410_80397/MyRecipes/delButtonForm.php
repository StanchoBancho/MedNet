<script type = "text/javascript">
function confirm_delete()
{
var agree = confirm("Are you sure you want to delete this recipe?");
if(agree)
	return true;
else
	return false;
}
</script>

<form id="delRecipeForm" method="post" action="deleteRecipe.php">
	<div class="delButtonDiv">
		<input type="hidden" name="recipeId" value="<?php echo $detailRecipe->id; ?>"/>
		<input class="delButton" type="submit" value="DELETE" onclick="return confirm_delete()"/>
	</div>
</form>