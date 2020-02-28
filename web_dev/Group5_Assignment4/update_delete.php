<?php
/*
* Handles the update and delete operations once called. Provides error message if operation
* was not successful i.e. no content given. If either operation was successful a message
* is also provided.
*/
	require('connect.php');

	$feedback = "Invalid submission.";

	if ($_POST && isset($_POST['title']) && isset($_POST['content']) && isset($_POST['id']))
	{
		$title = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$content = filter_input(INPUT_POST, 'content', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);

		$update_query = "UPDATE voids SET title = :title, content = :content WHERE id = :id";
		$delete_query = "DELETE FROM voids WHERE id = :id";	
		


		//At least one character.
		$is_valid = (strlen(trim($title)) > 0 && strlen(trim($content)) > 0) ? true : false;



		if (isset($_POST['update']) && $is_valid)
		{
			$update_statement = $db->prepare($update_query);
			$update_statement->bindValue(':title', $title);
			$update_statement->bindValue(':content', $content);
			$update_statement->bindValue(':id', $id, PDO::PARAM_INT);

			$update_statement->execute();
		
			header("Location: editpost.php?id={$id}&update=true");
			exit;
		}
		else if (isset($_POST['delete']))
		{
			$feedback = "Record deleted.";

			$delete_statement = $db->prepare($delete_query);
			$delete_statement->bindValue(':id', $id, PDO::PARAM_INT);

			$delete_statement->execute();
		}
	}
	else
	{
		echo "totes error";
	}
	

?>

<!DOCTYPE html>
<html>
<head>
	<title>Edit post</title>
</head>
<body>
	<h4><?= $feedback?> 
		<?php if (!$is_valid): ?> 
			<a href=<?="editpost.php?id={$id}"?>>Try again.</a> 
		<?php endif ?>     
	</h4>
	<h5><a href="index.php">back to home</a></h5>
</body>
</html>