<?php

	session_start();
	
	include_once("../utilities/function.php");
	include_once("../utilities/global.php");	
  include_once("../capt/securimage.php");
  require_once("../config/a3k_act_config.php");
  
  $img = new Securimage();
  $valid = $img->check($_POST['code']);
	

	
	global $DB_site;
  if($valid == true) {
  	$query = $DB_site->query("update a3k_player set p_capt_attempts = 0  where p_id=".$_POST["me"]." ");
    echo "<script>alert('恭喜答對了');window.location.reload();</script>";
  } else {

	$res = $DB_site->query_first("select p_capt_attempts from a3k_player where p_id='".$_POST["me"]."' ");
	$p_attempts = $res['p_capt_attempts'];

	if($p_attempts > $a3k_config["attempts"])
		{
			$query = mysql_query("update a3k_player set p_locktime = NOW() where p_id=".$_POST["me"]." ");
			cookie_cleanall();
			echo "<script>alert('答錯了 帳號鎖定');window.location = '".$a3k_config["logouturl"]."';</script>";
		}else
		{
			$query = mysql_query("update a3k_player set p_capt_attempts = p_capt_attempts + 1 where p_id= ".$_POST["me"]." ");
    	echo "<center>答錯了<br/><a onclick='reloadcapt();'>請重新作答!!</a></center>";
    }
  }


function cookie_cleanall()
{
	global $HTTP_COOKIE_VARS;
	setcookie("a3kplayer",""); 
	$_COOKIE = null;
}

?>