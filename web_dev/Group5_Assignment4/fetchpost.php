<?php
/*
* Connects to database and retrieves the appropiate post data through the GET variable id.
* The GET id is sanitized to ensure only an integer may be accepted. Returns a single row.
*/
	require('connect.php');

	$query = "SELECT * FROM voids WHERE id = :id LIMIT 1";
	$statement = $db->prepare($query);

	$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

	$statement->bindValue(':id', $id, PDO::PARAM_INT);
	$statement->execute();

	$row = $statement->fetch();


?>