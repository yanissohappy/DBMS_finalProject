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
echo "<span class=\"span_show_blue\">" . "成功連結資料庫！" . "</span><br>";

// SQL 輸入結果
if(!empty($_POST['inputSQL'])){
	echo "<span class=\"span_show\"> 您輸入的指令 " . @$_POST['inputSQL'] . "</span>";
	$query = $_POST['inputSQL'];
	$_POST['inputSQL'] = ""; //因為php會存這個值，而我是用這個值做判斷是否是做SQL還是BUTTON
	
	try{
		$result = $conn->query($query);	
		echo "<span class=\"span_show\">" . "<br> 搜尋結果為 ". $result->num_rows. " 筆資料" . "</span>";
		echo "<table border='1'> 
			  <tr>";	
		$j = 0;	  
		while($mysql_query_fields = mysqli_fetch_field($result)){ // 取得field name
			$mysql_fields[$j] = $mysql_query_fields->name;
			echo "<th>". $mysql_fields[$j]. "</th>";		
			$j = $j + 1;
		}
		echo "</tr>";
		
		if ($result->num_rows > 0){
			while($row = $result->fetch_row()){
				echo "<tr>";
				$i = 0;
				for(;$i < mysqli_num_fields($result); $i = $i + 1){
					echo "<td>" . $row[$i] . "</td>";
				}
				echo "</tr>";
			}	
		} else {
			echo "0 results";
		}
	}
	catch(Exception $e){
	  echo 'something wrong!';

	}	  
}else{ //BUTTON 結果

	if($_POST['tell_type'] == "HIDE"){
		exit(0); // do nothing
	}else if($_POST['tell_type'] == "SELECT"){
		$query = "SELECT " . $_POST['text1'] ." FROM ". $_POST['text2'] . " WHERE " . $_POST['text3'];		
	}else if($_POST['tell_type'] == "DELETE"){
		$query = "DELETE FROM customer WHERE ". $_POST['text4'];
	}else if($_POST['tell_type'] == "INSERT"){
		$query = "INSERT INTO customer ". $_POST['text5']." VALUES ". $_POST['text6'];	
	}else if($_POST['tell_type'] == "UPDATE"){
		$query = "UPDATE customer SET ". $_POST['text7']." WHERE ". $_POST['text8'];
	}else if($_POST['tell_type'] == "IN"){
		$query = "SELECT * FROM customer WHERE customer_id > 3 IN (". $_POST['text9']." )";
	}else if($_POST['tell_type'] == "NOT_IN"){
		$query = "SELECT * FROM customer WHERE customer_id > 4 NOT IN (". $_POST['text10']." )";
	}else if($_POST['tell_type'] == "EXISTS"){
		$query = "SELECT " . $_POST['text11'] . " FROM customer WHERE EXISTS (" . $_POST['text12']." )";
	}else if($_POST['tell_type'] == "NOT_EXISTS"){
		$query = "SELECT " . $_POST['text13']." FROM customer WHERE NOT EXISTS (". $_POST['text14']." )";
	}else if($_POST['tell_type'] == "COUNT"){
		$query = "SELECT COUNT(". $_POST['text15']. ") FROM merchandise";
	}else if($_POST['tell_type'] == "SUM"){
		$query = "SELECT SUM(" . $_POST['text16'].") FROM merchandise";
	}else if($_POST['tell_type'] == "MAX"){
		$query = "SELECT MAX(". $_POST['text17'].") FROM merchandise";
	}else if($_POST['tell_type'] == "MIN"){
		$query = "SELECT MIN(". $_POST['text18'].  ") FROM merchandise";
	}else if($_POST['tell_type'] == "AVG"){
		$query = "SELECT AVG(". $_POST['text19'].  ") FROM merchandise";
	}else{ //HAVING
		$query = "SELECT ". $_POST['text20']." FROM ". $_POST['text21']." GROUP BY ". $_POST['text22']." HAVING ". $_POST['text23'];
	}


	echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	
	try{
		$result = $conn->query($query);	
		echo "<span class=\"span_show\">" . "<br> Button處理結果為 ". $result->num_rows. " 筆資料" . "</span>";
		echo "<table border='1'> 
			  <tr>";	
		$j = 0;	  
		while($mysql_query_fields = mysqli_fetch_field($result)){ // 取得field name
			$mysql_fields[$j] = $mysql_query_fields->name;
			echo "<th>". $mysql_fields[$j]. "</th>";		
			$j = $j + 1;
		}
		echo "</tr>";
		
		if ($result->num_rows > 0){
			while($row = $result->fetch_row()){
				echo "<tr>";
				$i = 0;
				for(;$i < mysqli_num_fields($result); $i = $i + 1){
					echo "<td>" . $row[$i] . "</td>";
				}
				echo "</tr>";
			}	
		} else {
			echo "0 results";
		}
	}
	catch(Exception $e){
	  echo 'something wrong!';

	}	
	
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