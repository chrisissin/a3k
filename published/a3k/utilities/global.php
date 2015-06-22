<?




//********************** gzip related **********************//
$do_gzip_compress = FALSE;
if ($a3k_arry["gzip_compress"])
{

	$phpver = phpversion();
	$useragent = (isset($_SERVER["HTTP_USER_AGENT"]) ) ? $_SERVER["HTTP_USER_AGENT"] : $HTTP_USER_AGENT;
	if ( $phpver >= '4.0.4pl1' && ( strstr($useragent,'compatible') || strstr($useragent,'Gecko') ) )
	{
		if ( extension_loaded('zlib') )
		{
			ob_start('ob_gzhandler');
		}
	}
	else if ( $phpver > '4.0' )
	{

		if ( strstr($HTTP_SERVER_VARS['HTTP_ACCEPT_ENCODING'], 'gzip') )
		{
			if ( extension_loaded('zlib') )
			{
				$do_gzip_compress = TRUE;
				ob_start();
				ob_implicit_flush(0);
				header('Content-Encoding: gzip');
			}
		}
	}
}



//********************** db related **********************//
//load config
require('../config/config.php');

// init db **********************
// load db class
$dbservertype = strtolower($dbservertype);
$dbclassname="../utilities/db_$dbservertype.php";
require($dbclassname);

$db = $DB_site=new DB_MySql;
$DB_site->appname='a3k';
$DB_site->appshortname='a3k';
$DB_site->database=$dbname;

$DB_site->connect($servername, $dbusername, $dbpassword, $usepconnect);
$DB_site->query_first("SET NAMES utf8;"); 
$DB_site->query_first("SET CHARACTER_SET_CLIENT=utf8;"); 
$DB_site->query_first("SET CHARACTER_SET_RESULTS=utf8;");
unset($servername, $dbusername, $dbpassword, $usepconnect);

$dbpassword="";
$DB_site->password="";

// end init db
// ###################### Start functions #######################
?>