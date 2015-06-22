<?php
if(!defined('__ROOT__')) {
	define('__ROOT__', '../');
}
class chat {
	var $chatlogMame; // chat_log file name
	var $listenName;
	var $bantextName;
	function checkLogin($p_id) {
		//a3k 這裡需要其他檢查是否登入的機制
		//$_SESSION['p_id'] = 2;
		$p_id = $_POST['me'];// $_SESSION['p_id'];//$HTTP_COOKIE_VARS["playerid"];//"2";//;
		//alert();
		return ($p_id) ? true : false ;
	}
	
	function init($p_id) { 
		global $conf;
		$an = $this->getdefaultanouce();
		$result = array(
			'isLogined'=>$this->checkLogin($p_id),
			'usertime'=>time(),
			'refreshTime'=>$conf['refreshTime'],
			'annouce'=> $an
		);
		$index = -1;
		// load msg if user is logined.
		if($result['isLogined'] == true) {
			$result['msg'] = $this->loadMsg($p_id, $result['usertime'], $index);
		}
		$result['index'] = $index-5;
		echo json_encode($result);
	}
	
	function loadMsg($p_id, &$usertime = 0, &$i = -1) {
		global $db, $_POST;
		//msg format : time, p_id, channel, target_id, msg
		
		//a3k 指定的時間，若沒有指定則預設為目前時間
		$usertime = $usertime ? $usertime : time();
		$msg = array();
		if($p_id && $this->chatlogName && file_exists($this->chatlogName)) {
			$p = $db->query_first('SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = \''.$p_id.'\'');
			//$log = file($this->chatlogName, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
			$qr =$db->query("select content , channel, cto, cfrom, msg from chat order by id  asc	");
				while($rows =$db->fetch_array($qr))
				{
					$log[] = $rows;	
				} 			
			$len = count($log);//$log[0]['id'];
			//$_POST['index']= $len;
			if($_POST['index']> $len )
				$_POST['index'] = $len-1;
			$blacklist = explode(',', $p['p_blacklist']);
			$utt = $db->query_first('SELECT cindextime from chatindex where 1 ');
			//$usertime = $utt[0];
			
			
			if($usertime != $utt[0]) {
				$usertime = $utt[0];
				//不是在初始化時發生的話則從第一筆開始讀取
				/*if($i != -1) {
					$i = 0;
				}*/
			}
			
			//a3k 沒有預設的指標位置，則將指標移到最後
			if($i  == -1) {
				while($log[++$i]) {
				}
			}
			
			
			//parse msg to load
			for(;$i < $len; $i++) {
				//echo $i;
				//$logstr = explode(',', $log[$i][0], 5); // x note long execution time logged 20090726
				$check = true; 
				//switch($logstr[2]) {
				switch($log[$i]['channel']) {
					case 0://public
						//if(in_array($logstr[1], $blacklist)) {  // x note long execution time logged 20090726
						if(in_array($log[$i]['cfrom'], $blacklist)) {
							$check = false;
						}
					break;
					
					case 1://local
						//if($p['p_map'] != $logstr[3] || in_array($logstr[1], $blacklist)) {
						if($p['p_map'] != $log[$i]['cto'] || in_array($log[$i]['cfrom'], $blacklist)) {
							$check = false;
						}
					break;
					
					case 2://whisper
						//if(($p_id != $logstr[1] && $p_id != $logstr[3]) || in_array($logstr[1], $blacklist)) {
						if(($p_id != $log[$i]['cfrom'] && $p_id != $log[$i]['cto']) || in_array($log[$i]['cfrom'], $blacklist)) {
							$check = false;
						}
					break;
					
					case 3://guild
						//if($p['p_guild'] != $logstr[3] || in_array($logstr[1], $blacklist)) {
						if($p['p_guild'] !=$log[$i]['cto'] || in_array($log[$i]['cfrom'], $blacklist)) {
							$check = false;
						}
					break;
					
					case 4://team
						//if($p['p_team'] != $logstr[3] || in_array($logstr[1], $blacklist)) {
						if($p['p_team'] != $log[$i]['cto'] || in_array($log[$i]['cfrom'], $blacklist)) {
							$check = false;
						}
					break;
					case 5://system
						
					break;
				}
				if($check == true) {
					//$msg[] = $logstr[2].','.$logstr[4];
					$msg[] = $log[$i]['channel'].','.$log[$i]['msg'];
				}				
			}
		}
		return $msg;
	}
	
	function post($p_id) {
		global $db, $conf;
		$p = $db->query_first('SELECT p_name, p_map, p_guild, p_team FROM a3k_player WHERE p_id='.$p_id);
		$channel = intval($_POST['channel']);
		$target = htmlspecialchars(strip_tags(trim($_POST['target'])));
		$msg = htmlspecialchars(strip_tags(trim($_POST['text'])));
		//$msg = strip_tags(trim($_POST['text']));
		
		$msg = $this->bantext($msg);
		
		$useDefault = false;
		switch($channel) {
			case CHANNEL_PUBLIC://public
				$target = "pub";//$p['p_map'];
				$msg = '<span class="p_menu">'.$p['p_name'].'</span>:'.$msg;
			/*	if(true) { //a3k 沒有大聲公
					alert('沒有大聲公');
				}
				*/
			break;
			default://lcoal
				$target = $p['p_map'];
				$msg = '<span class="p_menu">'.$p['p_name'].'</span>:'.$msg;
			break;
			case CHANNEL_WHISPER://whisper
				$target = $db->query_first('SELECT p_id, p_name FROM a3k_player WHERE p_name = "'.$target.'"');
				if(!$target) {
					alert('沒有密語對象');
				}
				$msg = '<span class="p_menu">'.$p['p_name'].'</span> > <span class="p_menu">'
				.$target['p_name'].'</span>:'.$msg;
				$target = $target['p_id'];
			break;
			case CHANNEL_GUILD://guild
				if(empty($p['p_guild'])) {
					alert('沒有工會');
				}
				$target = $p['p_guild'];
				$msg = '<span class="p_menu">'.$p['p_name'].'</span>:'.$msg;
			break;
			case CHANNEL_TEAM://team
				if(empty($p['p_team'])) {
					alert('沒有隊伍');
				}
				$msg = '<span class="p_menu">'.$p['p_name'].'</span>:'.$msg;
			break;
		}
		
		
		$this->writeMsg($p_id, $channel, $target, $msg);
		$this->refresh($p_id);
		$this->clearchat();
		
	}
	
	function refresh($p_id) {
		global $conf;
		$_POST['usertime'] = intval($_POST['usertime']);
		//$_POST['index']=intval($_POST['index'])-1;
		$result = array(
			'refreshTime'=>$conf['refreshTime'],
			'msg'=>$this->loadMsg($p_id, $_POST['usertime'], $_POST['index'])
		);//
		$result['usertime'] = $_POST['usertime'];
		$result['index'] = intval($_POST['index']);
		$anuc =$this->getanouce(time()- 10);
		if($anuc!= null)
			$result['annouce'] = $anuc;
		echo json_encode($result);
	}

	function getdefaultanouce()
	{
		global $db;
		$sqlq = 
"SELECT content FROM `announcement` order by id desc limit 1 ";
		$thdb = $db->query_first($sqlq);		
		if($thdb)
			return  $thdb['content'];
		else
			return null;
	}	
	
	function getanouce($tt)
	{
		global $db;
		$sqlq = 
"select content from a3k.announcement where utime >= ".$tt."  limit 1";
		$thdb = $db->query_first($sqlq);		
		if($thdb)
			return  $thdb['content'];
		else
			return null;
	}	
	
	function clearchat()
	{
		global $db, $conf;
		$sqlq = 
"select count(id) from a3k.chat";
		$thdb = $db->query_first($sqlq);
					
		if($thdb[0] >= $conf['chatdblength'])
		{
		
		$sqlq = 
"
INSERT INTO `a3k`.`chatbk` ( content , channel , guid , timestamp , cfrom, cto , comment , msg)
SELECT  content ,channel , 	 guid , timestamp , cfrom, cto , comment , msg
FROM `a3k`.`chat` ;";
		$db->query($sqlq);
		
		$sqlq = 
		"TRUNCATE TABLE `chat`";
//"DELETE  from  `chat` where 1";
		$db->query($sqlq);
		//$_POST['index'] = 0;		
		/*	
		$min = $db->query_first("SELECT MIN(id) FROM chat ");
		$db->query("INSERT INTO `a3k`.`chatbk` ( content)
SELECT  content
FROM `a3k`.`chat` where id = " . $min[0] );
		$db->query("DELETE FROM chat WHERE id = ".$min[0] );
	*/
		
		}		
	}
	
	function writeMsg($p_id, $channel, $target_id, $msg) {
		global $db, $conf;
		$omsg = $msg;
		$msg = (time()-1).','.$p_id.','.$channel.','.$target_id.','.$msg."\r\n";
	
	  $db->query("delete from chatindex where 1");     
		$sqlq = sprintf("INSERT INTO `chatindex` (
`cindextime` 
)
VALUES (
 '%s'
);
",
            time());				
       
		$db->query($sqlq);		
				
		$sqlq = sprintf("INSERT INTO `chat` (
`content` , `channel` , `cfrom` , `guid` , `cto` , `msg`
)
VALUES (
'%s' , '%s' ,'%s' , UUID(), '%s' , '%s' 
);
", mysql_real_escape_string($msg),$channel, $p_id, $target_id,mysql_real_escape_string($omsg));				
		$db->query($sqlq);		
		
		/*

		*/
		
		/*
		//聊天紀錄過期 在這裡會把檔案刪掉 
		$fp = fopen($this->chatlogName, 'r+');
		flock($fp, LOCK_SH);
		$t = intval(trim(fgets($fp)));
		flock($fp, LOCK_UN);
		fclose($fp);
		//10分鐘刪除一次
		if($t+$conf['chatlogExpireTime']*60 < time()) {
		
			rename($this->chatlogName, $this->chatlogName.'.'.$t);
			$fp = fopen($this->chatlogName, 'a+');
			flock($fp, LOCK_EX);
			fputs($fp, time()."\n");
			flock($fp, LOCK_UN);
			fclose($fp);
		}
		*/
		//$this->writeLog($this->chatlogName, $msg);
		
		//a3k 監聽處理
		$list = explode(',', file_get_contents($this->listenName));
		
		//a3k 發言人是被監聽的玩家
		if(in_array($p_id, $list)) {
			$this->writeLog(__ROOT__.'log/listen/'.$p_id.'.txt', $msg);
		}
		
		//a3k 密語對象是被監聽的玩家
		if($channel == CHANNEL_WHISPER && in_array($target_id, $list)) {
			$user = $db->query_first('SELECT p_name FROM a3k_player WHERE p_id = "'.$p_id.'"');
			$msg = (time()-1).','.$user['p_name'].','.$channel.','.$target_id.','.$msg."\r\n";
			$this->writeLog(__ROOT__.'log/listen/'.$target_id.'.txt', $msg);
		}
	}
	
	function writeLog($path, $msg) {
		if(!is_dir(__ROOT__.'log/listen/')) {
			mkdir(__ROOT__.'log/listen/');
		}
		$fp = fopen($path, 'a+');
		flock($fp,LOCK_EX);
		fwrite($fp, $msg);
		flock($fp, LOCK_UN);
		fclose($fp);
	}
	
	//a3k 處理禁語
	function bantext($msg) {
		$bantext = file_get_contents($this->bantextName);
		if(!empty($bantext)) {
			mb_internal_encoding('UTF-8');
			$msg = mb_convert_encoding($msg, 'UTF-8');
			$list = explode(' ', $bantext);
			foreach($list as $v) {
				$len = mb_strlen($v);
				$pad = str_pad('', $len, '*');
				$msg = str_replace($v, $pad, $msg);
			}
		}
		return $msg;
	}
	
	function writeSpecialItemMsg($p_name, $item_name) {
		$this->writeSystemMsg('恭喜 '.htmlspecialchars(strip_tags(trim($p_name))).' 得到 '.htmlspecialchars(strip_tags(trim($item_name))));
	}
	
	function writeSystemMsg($msg) {
		$this->writeMsg(-1, CHANNEL_SYSTEM, -1, '[公告] '.htmlspecialchars(strip_tags(trim($msg))));
	}
}
?>