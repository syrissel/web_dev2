<?php
/*
 Handles INSERT operation when adding an entry to the database. Will fail when both POST
 variables, title and content, are empty.
*/
	require('connect.php');

	$is_valid = false;


	if ($_POST && !empty($_POST['title']) && !empty($_POST['content']))
	{
		
		$title = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		$content = filter_input(INPUT_POST, 'content', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

		$is_valid = (strlen(trim($title)) > 0 && strlen(trim($content)) > 0) ? true : false;

		$query = "INSERT INTO voids (title, content) VALUES (:title, :content)";
		$statement = $db->prepare($query);

		$statement->bindValue(':title', $title);
		$statement->bindValue(':content', $content);

		if ($is_valid)
		{
			$statement->execute();
			header("Location: index.php");
			exit;
		}
	}
	else if (isset($_POST['title']))
	{
		$title = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
	}
	else if (isset($_POST['content']))
	{
		$content = filter_input(INPUT_POST, 'content', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
	}

?>


<!DOCTYPE html>
<html>
<head>
	<title>Error</title>
	<link rel="stylesheet" type="text/css" href="formstyles.css">
</head>
<body>
	<form method="post" action="newpost.php">
		<input type="hidden" name="title" value=<?='"' . $title . '"' ?>>
		<?php if (!$is_valid): ?>
			<h1>Fields cannot be left blank! <button type="submit" id="linkbutton">Try again</button></h1>
		<?php endif ?>
	</form>
</body>
</html>