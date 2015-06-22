<?php
class _listen {
	var $listenName;
	var $listenlogName;
	
	function add($p_id) {
		global $db;
		$name = htmlspecialchars(strip_tags(trim($_POST['name'])));
		$result = array();
		
		$list = $this->getList();
		$target = $db->query_first('SELECT p_id FROM a3k_player WHERE p_name = \''.$name.'\'');
		if(!$target) {
			$result['error'] = '對象不存在';
		}
		if(in_array($target['p_id'], $list)) {
			$result['error'] = '對象已經在監聽名單內';
		}
		if(count($list) >= 10) {
			$result['error'] = '監聽名額已滿';
		}
		if(empty($result['error'])) {
			$list[] = $target['p_id'];
			$this->setList($list);
			$result['target'] = $name;
		}
		echo json_encode($result);
	}
	
	function getText($p_id) {
		global $db;
		$result = array();
		$name = htmlspecialchars(strip_tags(trim($_POST['name'])));
		$user = $db->query_first('SELECT p_id FROM a3k_player WHERE p_name = "'.$name.'"');
		if(!$user) {
			$result['error'] = '監聽對象不存在';
		}
		if(empty($result['error'])) {
			$result['msg'] = array();
			$logPath = __ROOT__.'log/listen/'.$user['p_id'].'.txt';
			if(file_exists($logPath)) {
				$result['msg'] = file($logPath, FILE_IGNORE_NEW_LINES + FILE_SKIP_EMPTY_LINES);
			}
		}
		echo json_encode($result);
	}
	
	function init($p_id) {
		global $db;
		$list = implode(',', $this->getList());
		$result['list'] = array();
		$query = $db->query('SELECT p_name FROM a3k_player WHERE p_id in ('.$list.')');
		while($d = $db->fetch_array($query)) {
			$result['list'][] = $d['p_name'];
		}
		echo json_encode($result);
	}
	
	function getList() {
		$fp = fopen($this->listenName, 'a+');
		$log = trim(fgets($fp));
		fclose($fp);
		return empty($log) ? array() : explode(',', $log);
	}
	
	function setList($list) {
		$fp = fopen($this->listenName, 'w+');
		flock($fp, LOCK_EX);
		fputs($fp, implode(',', $list));
		flock($fp, LOCK_UN);
		fclose($fp);
	}
	
	function getListenLog($p_id, $startIndex = 0) {
		//(未) 加入[整理監聽紀錄]後，可直接讀取整理好的監聽紀錄檔，然後再讀取最新的(未整理過的)監聽紀錄
		
		
		
		$log = file($this->listenlogName, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
		$result = array();
		for($i = $startIndex, $len = count($log); $i < $len; $i++) {
			$data = explode(',', $log[$i]);
			//filter
			if($data[1] == $p_id || ($data[2] == 2 && $data[3] == $p_id)) {
				$result[] = $log[$i];
			}
		}
		return $result;
	}
	
	function remove($p_id) {
		global $db;
		$name = htmlspecialchars(strip_tags(trim($_POST['name'])));
		$result = array();
		
		$list = $this->getList();
		$target = $db->query_first('SELECT p_id FROM a3k_player WHERE p_name = \''.$name.'\'');
		if(!$target) {
			$result['error'] = '對象不存在';
		}
		if(!in_array($target['p_id'], $list)) {
			$result['error'] = '對象不在監聽名單內';
		}
		if(empty($result['error'])) {
			unset($list[array_search($target['p_id'], $list)]);
			$this->setList($list);
			$result['target'] = $name;
		}
		echo json_encode($result);
	}
}
?>