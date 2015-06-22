<?php


if (!defined('DB_EXPLAIN'))
{
	define('DB_EXPLAIN', false);
}

if (!defined('DB_DEBUG'))
{
	define('DB_DEBUG', false);
}

// type of database running
$dbservertype='mysql';

// hostname or ip of server
$servername=$hostname = '127.0.0.1'; 
//$servername=$hostname = '192.168.3.122'; 

// username and password to log onto db server
$dbusername='root';
$dbpassword='1001ya'; 

// name of database
$dbname='a3k'; 

// technical email address - any error messages will be emailed here
$technicalemail='admin@1001ya.com.tw';

// use persistant connections to the database
// 0 = don't use
// 1 = use
$usepconnect=1;


/******************** chat *******************/

$conf = array(
	//a3k log path
	'chatlogName' => __ROOT__.'log/chat_log.txt',
	'bantextName' => __ROOT__.'log/bantext.txt',
	'listenName' => __ROOT__.'log/listen.txt',
	'listenlogName' => __ROOT__.'log/listenlog.txt',
	
	//a3k other setting
	'refreshTime' => 5000,	
	'chatlogExpireTime'=>10, 
	'chatdblength' => 30 // a3k chat in memory db length (dump to innodb afterwards
);
$time = getdate();
$conf['logTime'] = $time['year'].$time['mon'].$time['mday'].$time['hours'].(ceil($time['minutes']/5));
unset($time);

//a3k Constant 
define('CHANNEL_PUBLIC', 0);
define('CHANNEL_LOCAL', 1);
define('CHANNEL_WHISPER', 2);
define('CHANNEL_GUILD', 3);
define('CHANNEL_TEAM', 4);
define('CHANNEL_SYSTEM', 5);
/******************** chat *******************/

?>
