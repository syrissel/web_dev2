<?php
/*
* Allows an authenticated user to enter a new post. Entries are sanitized and validated
* in the insert.php script.
*/
	require('authenticate.php');

?>


<!DOCTYPE html>
<html>
<head>
	<title>New post</title>
	<link rel="stylesheet" type="text/css" href="formstyles.css">
</head>
<body>
	<h2><a href="index.php">L'Appel du vide</a></h2>
	<form method="post" action="insert.php">
		<label for="title">Title</label>
		<input size="60" type="text" name="title" id="title" <?php if (isset($_POST['title'])):?> value= <?= '"' . $_POST['title'] . '"' ?>  <?php endif ?>  >
		<label for="content">Content</label>
		<textarea name="content" id="content" rows="20" cols="60"></textarea>
		<button type="submit">Submit Post</button>
	</form>
</body>
</html>