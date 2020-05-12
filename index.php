 <?php
$username = "a";
$password = "a";

echo '<meta content="text/html"; charset="UTF-8" http-equiv="content-type">';
echo '<link rel="stylesheet" type="text/css" href="style.css" />';

if ($_POST['username'] == $username && $_POST['password'] == $password ) {
	//echo '<body style="background-image:url(\'img/background1.jpg\'); background-repeat: no-repeat; background-size: cover;"></body>';
	echo '<div class="input_change_div"> 登入成功！請等待跳轉 </div>';
	echo '<meta http-equiv=REFRESH CONTENT=1;url="shoppingmall.html">';
} else {
	//echo '<body style="background-image:url(\'img/background1.jpg\'); background-repeat: no-repeat; background-size: cover;"></body>';
	echo '<div class="input_change_div"> 帳號密碼驗證錯誤！</div>';	
	echo '<meta http-equiv=REFRESH CONTENT=1;url="index.html">';
}
?>