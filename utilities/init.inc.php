<?php
//header('content-type:text/html;charset=utf-8');
//header('cache-control:no-cache');

if(!defined('__ROOT__')) {
	define('__ROOT__', '../');
}

include_once(__ROOT__.'config/config.php');
include_once(__ROOT__.'utilities/function.inc.php');
include_once(__ROOT__.'utilities/db_mysql.php');

$db = $DB_site=new DB_MySql;	
$db->database = $dbname;  
$db->connect($hostname, $dbusername, $dbpassword, $usepconnect);

unset($hostname, $dbusername, $dbpassword, $dbname, $usepconnect);
$db->query_first('SET NAMES utf8;'); 
$db->query_first('SET CHARACTER_SET_CLIENT=utf8;'); 
$db->query_first('SET CHARACTER_SET_RESULTS=utf8;');

?>