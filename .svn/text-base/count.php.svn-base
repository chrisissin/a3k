<?php
session_start();

function getUsersOnline() {
   $count = 0;

   $handle = opendir(session_save_path());
   if ($handle == false) return -1;

   while (($file = readdir($handle)) != false) {
       if (ereg("^sess", $file)) $count++;
   }
   closedir($handle);

   return $count;
}
$servername='192.168.3.104';
$dbusername='root';
$dbpassword='1001ya';
$dbname='logs';
$connect=mysql_connect($servername,$dbusername,$dbpassword) or die ("connect db error.");
mysql_select_db($dbname,$connect) or die ("use db error.");

$query = mysql_query('SET NAMES utf8;'); 
$query = mysql_query('SET CHARACTER_SET_CLIENT=utf8;'); 
$query = mysql_query('SET CHARACTER_SET_RESULTS=utf8;');

$query = mysql_query(" SELECT *
FROM `a3konlinecount`
WHERE `dt_when` >= curdate( )
AND `dt_when` < curdate( ) +1
LIMIT 1 ");
$res = mysql_fetch_array($query);

if(!$res)
{
		$query = mysql_query("INSERT INTO `logs`.`a3konlinecount` (
	`id` ,
	`dt_when` ,
	`num` ,
	`timestamp`
	)
	VALUES (
	NULL , NOW( ) , '". getUsersOnline() ."', NOW( )
	);");
}
else	
{
		if($res['num'] < getUsersOnline()){
			$query = mysql_query("UPDATE `logs`.`a3konlinecount` SET dt_when = NOW( ) ,
timestamp = NOW( ) , num =  '". getUsersOnline() ."'  WHERE `a3konlinecount`.`id` = '".$res['id'] ."' ");
		}
}
echo 'Number of online users: ' . getUsersOnline() . '<br />';
?>