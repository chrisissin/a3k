<?



//######## post_check begin #########

function post_check($post)
{
	global $HTTP_COOKIE_VARS;
	foreach ($post as $v) {
		if(is_array($v))
		{
			for($i=0;$i<count($v);$i++)
			{
		/*		if(eregi("[<>'\";\]", $v[$i]))
				{
					alertWindowMsg("有不正常符號(1)");
				}*/
			}
		}else
		{
		/*	if(eregi("[<>'\";\]", $v))
			{
				alertWindowMsg("有不正常符號(1)");
			}*/
		}
	}
	if(isset($HTTP_COOKIE_VARS["a3kplayer"]))
	{
//		if(eregi("[<>'\";\]",$HTTP_COOKIE_VARS["a3k_cookie"]))
		if(!is_numeric($HTTP_COOKIE_VARS["a3k_cookie"]))
		{
			alertWindowMsg("有不正常符號(2)");
		}
	}

}


//######### cookie_clean begin ############ 

function cookie_clean()
{
	global $HTTP_COOKIE_VARS;
	setcookie("a3kplayer",""); 
	$_COOKIE = null;
}

//######### get_ip begin ############ phpbb論壇專用

function get_ip()
{
	global $HTTP_SERVER_VARS,$HTTP_ENV_VARS,$REMOTE_ADDR;
	$client_ip = ( !empty($HTTP_SERVER_VARS['REMOTE_ADDR']) ) ? $HTTP_SERVER_VARS['REMOTE_ADDR'] : ( ( !empty($HTTP_ENV_VARS['REMOTE_ADDR']) ) ? $HTTP_ENV_VARS['REMOTE_ADDR'] : getenv('REMOTE_ADDR') );
	return $client_ip;
}

//########## session_check begin ##########

function session_check($time,$check_type)
{
	global $HTTP_SESSION_VARS,$_GET,$_POST;
	if(isset($HTTP_SESSION_VARS["act_time"]))
	{

	}else
	{
		$HTTP_SESSION_VARS["act_time"]=time();
	}
}

function compress_exit($str="")
{
	global $do_gzip_compress;
	if ( $do_gzip_compress )
	{
//
// Borrowed from php.net!
//
		$gzip_contents = ob_get_contents();
		ob_end_clean();
		$gzip_size = strlen($gzip_contents);
		$gzip_crc = crc32($gzip_contents);
		$gzip_contents = gzcompress($gzip_contents, 9);
		$gzip_contents = substr($gzip_contents, 0, strlen($gzip_contents) - 4);
		echo "\x1f\x8b\x08\x00\x00\x00\x00\x00";
		echo $gzip_contents;
		echo pack('V', $gzip_crc);
		echo pack('V', $gzip_size);
	}
	exit;
}

function alert($msg) {
	$result = array('error' => $msg);
	echo json_encode($result);
	exit;
}

function toBinary($dec, $length) {
		$str = '';
		$dec = intval($dec);
		for($mod = 0; $dec > 0; $dec = $dec >> 1) {
			$str = ($dec % 2) . $str;
		}
		if($length && strlen($str) < $length) {
			for($tmp = '', $bias = $length - strlen($str); $bias > 0; $bias--) {
				$tmp .= '0';
			}
			$str = $tmp . $str;
		}
		return $str;
	}
function array_reform(&$arr) {
	//ex: from array('0'=>array('name'=>'asd'), '1'=>array('name'=>'sdf'))  json: {{name:"asd"}, {name:"sdf"}}
	//    to   array('name'=>array('asd', 'sdf')) json: {name:['asd','sdf']}
	if(array_key_exists(0, $arr)) {
		$tmp = array();
		$keys = array_keys($arr[0]);
		$count = count($arr);
		foreach($keys as $v) {
			$tmp[$v] = array();
			for($i = 0; $i < $count; $i++) {
				$tmp[$v][$i] = $arr[$i][$v];
			}
		}
		$arr = $tmp;
	}
}

?>

