<?php
/*
* Blog home page. Shows 5 most recent blog posts.
*/
	require('connect.php');

	$limit = 'LIMIT 5';
	$allposts = false;

	//If more posts link is clicked, all posts will show.
	if (isset($_GET['allposts']))
	{
		$allposts = filter_input(INPUT_GET, 'allposts', FILTER_VALIDATE_BOOLEAN);

		//If GET variable $allposts is true then set limit to an empty string which will show all posts.
		$limit = ($allposts) ? ' ' : $limit;
	}
	
	$query = "SELECT * FROM voids ORDER BY timestamp desc {$limit}";

	$statement = $db->prepare($query);

	$statement->execute();
?>

<!DOCTYPE html>
<html>
<head>
	<title>Dark Humour is fun</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<h1>L'appel du vide</h1>
	<ul>
		<!--Keep looping while there are still rows to fetch in the query. Also store the current row in 
		    the $row variable.-->
		<?php while($row = $statement->fetch()): ?>
			<li>
				<!--Here I am pulling data from the database, therefore it does not have to be sanitized.-->
				<h2><a href=<?= '"' . "fullblog.php?id=" .  $row['id'] . '"'?>><?= $row['title']?></a></h2>
				<a href=<?= '"' . "editpost.php?id=" . $row['id'] . '"' ?> class="edit">edit</a>
				<!--Had to convert string in column timestamp to time type with 'strtotime'-->
				<h5><?= date('F d, Y H:m A', strtotime($row['timestamp']))?></h5>
				<?php if (strlen($row['content']) > 200): ?>
					<p><?= substr($row['content'], 0, 200) . '...'?></p>
					<a href=<?='"' . "fullblog.php?id=" . $row['id'] . '"' ?>>Read Full Post</a>
				<?php else: ?>
					<p><?= $row['content']?></p>
				<?php endif ?>
			</li>
		<?php endwhile ?>
	</ul>
	<a href="newpost.php">new post</a>
	<?php if (!$allposts): ?>
		<a href="index.php?allposts=true">Show all posts</a>
	<?php else: ?>
		<a href="index.php?allposts=false">Hide all posts</a>
	<?php endif ?>
</body>
</html>