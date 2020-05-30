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
	
	if(is_multiple_query($query) == 0){ //如果是單一SQL語句
		if(is_select($query) == 1){
			show_result($conn,$query); //是SELECT的話，會列出結果。	
		}else {
			$result = $conn->query($query); //純query，不須列出結果
		}
	}else{ //如果是multiple語句(只要至少兩條以上query就會用此處理)
		if ($conn -> multi_query($query)) {
		  do {
			// Store first result set
			if ($result = $conn -> store_result()) {
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
				echo "</table>"; //這很重要!我一直忘了加，然後若有多重結果，一開始的table就會都塞在一起，de了兩小時的bug...(汗)				
			  
			 $result -> free_result();
			}

			if ($conn -> more_results()) { //若有多重結果，放上分隔線
			  echo "<br><hr />";
			}
			 //Prepare next result set
		  } while ($conn -> next_result());
		}		
		
		
	}
}else{ //BUTTON 結果

	if($_POST['tell_type'] == "HIDE"){
		exit(0); // do nothing
	}else if($_POST['tell_type'] == "SELECT"){
		$query = "SELECT " . $_POST['text1'] ." FROM ". $_POST['text2'] . " WHERE " . $_POST['text3'];	
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "DELETE"){
		$query = "DELETE FROM customer WHERE ". $_POST['text4'];
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
		$result = $conn->query($query);	// 先送出去
		$query = "SELECT * FROM customer;";		
	}else if($_POST['tell_type'] == "INSERT"){
		$query = "INSERT INTO customer ". $_POST['text5']." VALUES ". $_POST['text6'].";";	
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
		$result = $conn->query($query);	// 先送出去
		$query = "SELECT * FROM customer;";
	}else if($_POST['tell_type'] == "UPDATE"){
		$query = "UPDATE customer SET ". $_POST['text7']." WHERE ". $_POST['text8'];	
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
		$result = $conn->query($query);	// 先送出去
		$query = "SELECT * FROM customer;";		
	}else if($_POST['tell_type'] == "IN"){
		$query = "SELECT * FROM customer WHERE customer_id > 3 IN (". $_POST['text9']." )";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "NOT_IN"){
		$query = "SELECT * FROM customer WHERE customer_id > 4 NOT IN (". $_POST['text10']." )";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "EXISTS"){
		$query = "SELECT " . $_POST['text11'] . " FROM customer WHERE EXISTS (" . $_POST['text12']." )";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "NOT_EXISTS"){
		$query = "SELECT " . $_POST['text13']." FROM customer WHERE NOT EXISTS (". $_POST['text14']." )";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "COUNT"){
		$query = "SELECT COUNT(". $_POST['text15']. ") FROM merchandise";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "SUM"){
		$query = "SELECT SUM(" . $_POST['text16'].") FROM merchandise";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "MAX"){
		$query = "SELECT MAX(". $_POST['text17'].") FROM merchandise";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "MIN"){
		$query = "SELECT MIN(". $_POST['text18'].  ") FROM merchandise";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else if($_POST['tell_type'] == "AVG"){
		$query = "SELECT AVG(". $_POST['text19'].  ") FROM merchandise";
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}else{ //HAVING
		$query = "SELECT ". $_POST['text20']." FROM ". $_POST['text21']." GROUP BY ". $_POST['text22']." HAVING ". $_POST['text23'];
		echo "<span class=\"span_show\"> 您輸入的指令 " . $query . "</span>";
	}

	if(is_select($query) == 1) show_result($conn,$query);		
}

function is_select($query){ // 要split，判斷是否是SELECT(1), UPDATE, DELETE, INSERT
	$type = explode (' ', $query);
	if(!strcasecmp($type[0],"SELECT")) return 1; 
	else return 0;
}

function is_multiple_query($query){ // 要split，判斷是否是SELECT(1), UPDATE, DELETE, INSERT
	$splitArray = explode (';', $query);
	if((count($splitArray) > 1) && !empty($splitArray[1])) return 1; 
	else return 0;
}

function show_result($conn,$query){ // query同時列出結果，只有SELECT的才可以正確顯示
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
		
		echo "</table>";
	}catch(Exception $e){
	  echo 'something wrong!';
	}	  	
}

$conn->close();
?>