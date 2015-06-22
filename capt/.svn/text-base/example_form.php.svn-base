<?php

/**
 * Project:     Securimage: A PHP class for creating and managing form CAPTCHA images<br />
 * File:        form.php<br /><br />
 *
 * This is a very simple form sending a username and password.<br />
 * It demonstrates how you can integrate the image script into your code.<br />
 * By creating a new instance of the class and passing the user entered code as the only parameter, you can then immediately call $obj->checkCode() which will return true if the code is correct, or false otherwise.<br />
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or any later version.<br /><br />
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.<br /><br />
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA<br /><br />
 * 
 * Any modifications to the library should be indicated clearly in the source code 
 * to inform users that the changes are not a part of the original software.<br /><br />
 *
 * If you found this script useful, please take a quick moment to rate it.<br />
 * http://www.hotscripts.com/rate/49400.html  Thanks.
 *
 * @link http://www.phpcaptcha.org Securimage PHP CAPTCHA
 * @link http://www.phpcaptcha.org/latest.zip Download Latest Version
 * @link http://www.phpcaptcha.org/Securimage_Docs/ Online Documentation
 * @copyright 2007 Drew Phillips
 * @author drew010 <drew@drew-phillips.com>
 * @version 1.0.3.1 (March 23, 2008)
 * @package Securimage
 *
 */

  session_start();

?>
<html>
<head>
  <title>Securimage Test Form</title>
</head>

<body>

<?php
if (empty($_POST)) { ?>
<center>
<form method="POST">
<!-- pass a session id to the query string of the script to prevent ie caching -->
<img src="securimage_show.php?sid=<?php echo md5(uniqid(time())); ?>"><br />
<input type="text" name="code" /><br />

<input type="submit" value="填好答案了,放我過關吧!!" />
</form>
</center>
<?php
} else { //form is posted
  include("securimage.php");
  $img = new Securimage();
  $valid = $img->check($_POST['code']);

  if($valid == true) {
    echo "<center>恭喜答對了.</center><script>parent.ad_view();</script>";
  } else {

$servername='localhost';
$dbusername='root';
$dbpassword='1001ya';
$dbname='wog';
$connect=mysql_connect($servername,$dbusername,$dbpassword) or die ("資料庫伺服器連接失敗！connect db error.");
mysql_select_db($dbname,$connect) or die ("資料庫連接失敗！use db error.");
$query = mysql_query("select p_attempts from wog_player where p_id='".$_COOKIE["wog_cookie"]."'") or die("Erro!");
$res = mysql_fetch_array($query);
$p_attempts = $res['p_attempts'];
require_once("../wog_act_config.php");
	if($p_attempts > $wog_arry["attempts"])
		{
			$query = mysql_query("update wog_player set p_lock=1,p_lock_time=".time()." where p_id=".$_COOKIE["wog_cookie"]);
			cookie_clean();
			echo "<center>答錯了 帳號暫時鎖定</center>";
		}else
		{
			$query = mysql_query("update wog_player set p_attempts=p_attempts+1 where p_id=".$_COOKIE["wog_cookie"].""); 
    	echo "<center>答錯了 <a href='/atk/securimage/example_form.php'>請重新作答!!</a></center>";
    }
  }
}
function cookie_clean()
{
	global $HTTP_COOKIE_VARS;
	setcookie("wog_cookie",""); 
	setcookie("wog_cookie_name",""); 
	setcookie("wog_bbs_id",""); 
	setcookie("wog_cookie_debug","");
	setcookie("wog_cookie_mission_id",0);
	setcookie("wog_cookie_mission_area",0);
}
?>

</body>
</html>
