<?php
/*
* Grabs the appropriate post from database and displays it on the page.
*/
	require('fetchpost.php');

	if (isset($_GET['id']))
	{
		$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

		if(!filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT))
		{
			header("Location: index.php");
			exit;
		}
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>This is post.</title>
</head>
<body>
	<h2><a href="index.php">L'Appel du vide</a></h2>
	<h1><?= $row['title']?></h1>
	<a href=<?="editpost.php?id={$id}"?>>Edit</a>
	<h5><?= date('F d, Y H:m A', strtotime($row['timestamp']))?></h5>
	<p><?= $row['content']?></p>
</body>
</html>