<?php
/*
* Page where authenticated user can edit a post. PHP provides sanitation of post id
* so that only an integer may be entered. User will be sent back to home page otherwise.
*/
	require('authenticate.php');
	require('fetchpost.php');


	if (isset($_GET['id']))
	{
		//If the GET id variable is not an integer, redirect to homepage.
		if(!filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT))
		{
			header('Location: index.php');
			exit;
		}
	}
?>


<!DOCTYPE html>
<html>
<head>
	<title>Edit post</title>
	<link rel="stylesheet" type="text/css" href="formstyles.css">
</head>
<body>
	<h2><a href="index.php">L'appel du vide</a></h2>
	<form method="post" action="update_delete.php">
		<input type="hidden" name="id" value=<?= '"' . $row['id'] . '"' ?>>
		<label for="title">Title</label>
		<input size="60" type="text" name="title" id="title" value=<?= '"' . $row['title'] . '"'?>  >
		<label for="content">Content</label>
		<textarea name="content" id="content" rows="20" cols="60" ><?= $row['content']?></textarea>
		<button type="submit" name="update">Update Post</button>
		<button type="submit" name="delete" onclick="return confirm('Are you sure you want to delete this post?')">Delete Post</button>
	</form>
	<?php if (isset($_GET['update'])): ?>
		<h1>Post updated! <a href="index.php">Back home</a></h1>
	<?php endif ?>
</body>
</html>