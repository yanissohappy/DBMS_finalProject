<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";
$database = "shoppingmall";

echo '<meta content="text/html"; charset="UTF-8" http-equiv="content-type">';
echo '<link rel="stylesheet" type="text/css" href="style.css" />';

// connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "<h3>Connected successfully</h3>";

echo "您輸入的指令 " . @$_POST['inputSQL'];
$query = $_POST['inputSQL'];

echo "<table border='1'>
      <tr>
        <th>編號</th>
		<th>姓</th>
        <th>名</th>
        <th>電子信箱</th>
      </tr>";
$result = $conn->query($query);
if ($result->num_rows > 0) {
	// output data of each row 並且印出雙色相間的表格
	while($row = $result->fetch_assoc())
	{
		echo "<tr>";
		echo "<td>" . $row['id'] . "</td>";
		echo "<td>" . $row['lastname'] . "</td>";
		echo "<td>" . $row['firstname'] . "</td>";
		echo "<td>" . $row['email'] . "</td>";
		echo "</tr>";
	}	
	
	while($row = $result->fetch_assoc()) {
		echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
	}
} else {
	echo "0 results";
}

/*
switch ($_REQUEST["request"]) {
	// create table
	case "create":
		$create = "CREATE TABLE MyGuests (
			id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
			firstname VARCHAR(30) NOT NULL,
			lastname VARCHAR(30) NOT NULL,
			email VARCHAR(50),
			reg_date TIMESTAMP
			)";
		if ($conn->query($create) === TRUE) {
			echo "Table MyGuests created successfully";
		} else {
			echo "Error creating table: " . $conn->error;
		}
		break;

	case "insert":
		// insert
		$insert = "INSERT INTO MyGuests (firstname, lastname, email)
		VALUES ('John', 'Doe', 'john@example.com')";
		if ($conn->query($insert) === TRUE) {
			echo "New record created successfully";
		} else {
			echo "Error: " . $insert . "<br>" . $conn->error;
		}
		break;

	case "select":
		// select
		$query = "SELECT * FROM MyGuests;";
		$result = $conn->query($query);
		if ($result->num_rows > 0) {
			// output data of each row
			while($row = $result->fetch_assoc()) {
				echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
			}
		} else {
			echo "0 results";
		}
		break;
	
	case "delete":
		//這是全部刪光資料的測試!!!
		$delete = "DELETE FROM MyGuests";
		if ($conn->query($delete) === TRUE) {
			echo "Record deleted successfully";
		} else {
			echo "Error deleting record: " . $conn->error;
		}
		break;
}
*/

$conn->close();
?>