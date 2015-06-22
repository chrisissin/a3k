<?php
if(!defined('__ROOT__')) {
	define('__ROOT__', '../');
}

define('QUEST_NORMAL', 1);	//只能接一次
define('QUEST_ONCE_PER_DAY', 2);//每日一次
define('QUEST_UNLIMITED', 4);//不限次數

class quest_base{
	var $type = QUEST_NORMAL;
	var $limit = array(
		'lv' => 0,
		'job' => null,
		'item' => null,
		'quest' => null,
		'description'=>''
	);
	var $need = array(
		'monster' => null,
		'fight' => 0,
		'item' => null,
		'description'=>''
	);
	var $award = array(
		'exp' => 0,
		'money' => 0,
		'item' => null,
		'point' => 0,
		'fellow' => null,
		'description'=>''
	);
	
	//檢查玩家是否符合任務的條件限制
	function checkLimit(&$p) {
		global $db;
		if($this->limit['job'] && $p['role_id'] != $this->limit['job'][0]) {
			return '職業不符';
		}
		
		if($this->limit['lv'] && $p['p_lv'] < $this->limit['lv']) {
			return '等級不足';
		}
		
		if($this->limit['item']) {
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($this->limit['item'] as $k=>$v) {
				if($packClass->checkitem($p['p_id'], $k, $v) === false) {
					return '持有物品不足';
				}
			}
		}
		
		 if($this->limit['quest']) {
		 	$quest = implode(',', $this->limit['quest']);
		 	$check = $db->query_first('SELECT count(q_id) AS num FROM a3k_quest_status WHERE q_id in ('.$quest.') AND q_status = -1');
		 	if($check['num'] < count($quest)) {
		 		return '前置任務尚未完成';
		 	} 
		 }
		return true;
	}
	
	function setQuestType($type) {
		switch($type) {
			case QUEST_NORMAL:
			case QUEST_ONCE_PER_DAY:
			case QUEST_MANY_PER_DAY:
			case QUEST_UNLIMITED:
				$this->type = $type;
			break;
			default:
				return false;
			break;
		}
	}
	
	function getNeedFightName() {
		global $db;
		$result = array();
		$map = $this->need['fight'];
		if(!$map || !is_array($map)) {
			return $result;
		}
		
		$map_id = array_keys($map);
		foreach($map_id as $k=>$v) {
			$map_id[$k] = '\''.$v.'\'';
		}
		$map_id = implode(',', $map_id);
		//$monsterID = implode(',', $monster);
		if(empty($map_id)) {
			return $result;
		}
		// x 20090304 modified  to fit a3k db
		$query = $db->query("SELECT map_id, map_city_name FROM a3k_map WHERE map_id in (".$map_id.")");
		while($d = $db->fetch_array($query)) {
			$result[$d['map_city_name']] = $map[$d['map_id']];
		}
		return $result;
	}
	
	function getNeedMonsterName() {
		global $db;
		$result = array();
		$monster = $this->need['monster'];
		if(!$monster || !is_array($monster)) {
			return $result;
		}
		// x 20090304 modified  to fit a3k db
		$monsterID = array_keys($monster);
		foreach($monsterID as $k=>$v) {
			$monsterID[$k] = '\''.$v.'\'';
		}
		$monsterID = implode(',', $monsterID);
		//$monsterID = implode(',', $monster);
		if(empty($monsterID)) {
			return $result;
		}
		// x 20090304 modified  to fit a3k db
		$query = $db->query("SELECT p_1001_id, p_name FROM a3k_monster WHERE p_1001_id in (".$monsterID.")");
		while($d = $db->fetch_array($query)) {
			$result[$d['p_name']] = $monster[$d['p_1001_id']];
		}
		return $result;
	}
	
	function getLimitQuestName() {
		global $db;
		$result = array();
		$quest = $this->limit['quest'];
		// x 20090304 modified  to fit a3k db
		if(!$quest || !is_array($quest)) {
			return $result;
		}
		$questID = implode(',', $quest);
		if(empty($questID)) {
			return $result;
		}
		$query = $db->query('SELECT q_id, q_title FROM a3k_quest WHERE q_id in ('.$questID.')');
		while($d = $db->fetch_array($query)) {
			$result[] = $d['q_title'];
		}
		return $result;
	}
	function getLimitJobName($jobID) {
		global $db;
		$job = $db->query_first('SELECT role_name FROM a3k_role WHERE role_id = "'.$jobID.'"');
		return $job['role_name'];
	}
	
	function getItemName($list) {
		global $db;
		$result = array();
		// x 20090304 modified  to fit a3k db
		if(!$list || !is_array($list)) {
			return $result;
		}
		$listID = array_keys($list);
		foreach($listID as $k=>$v) {
			$listID[$k] = '\''.$v.'\'';
		}
		$listID = implode(',', $listID);
		if(empty($listID)) {
			return $result;
		}
		
		//a3k 改成正確的查詢內容 
		// x 20090304 modified query to fit a3k db
		
		$query = $db->query('SELECT i.item_id, i.item_name FROM a3k_items as i, a3k_player_item as pi WHERE i.item_id in ('.$listID.') and i.item_id = pi.item_id ');
	//	echo('SELECT i.item_id, i.item_name FROM a3k_items as i, a3k_player_item as pi WHERE i.item_id in ('.$listID.') and i.item_id = pi.item_id ');
		while($d = $db->fetch_array($query)) {
			$result[$d['item_name']] = $list[$d['item_id']];
		}
		
		
		return $result;
	}
	
	function checkNeed($p_id, $need) {
		if(count($need['monster']) > 0 || count($need['fight']) > 0) {
			return  '任務尚未完成';
		}
		
		//a3k 檢查物品　(檢查$this->need['item'])
		if($this->need['item']) {
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($this->need['item'] as $k=>$v) {
				if($packClass->checkitem($p_id, $k, $v) === false) {
					return '持有物品不足';
				}
			}
		}
		
		
		return true;
	}
	
	function finishQuest($p_id, $q_id) {
		global $db;
		$db->query('BEGIN');
		$award = $this->getAward();
		//QUEST_UNLIMITED任務，直接將任務狀態刪除
		if($this->getQuestType() == QUEST_UNLIMITED) {
			$db->query('DELETE FROM a3k_quest_status WHERE q_id = "'.$q_id.'" AND p_id = "'.$p_id.'"');
		} else {
			//設置任務的狀態為[完成]
			$db->query('UPDATE a3k_quest_status SET q_status = -1, q_data = "" WHERE q_id = "'.$q_id.'" AND p_id = "'.$p_id.'"');
		}
		//數值獎勵
		//a3k 缺少學點的欄位
		$db->query('
			UPDATE a3k_player 
			SET p_money = p_money+'.$award['money'].', p_exp = p_exp+'.$award['exp'].'
			WHERE p_id = "'.$p_id.'"
		');
		
		//a3k 取得物品
		if($this->award['item']) {
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($this->award['item'] as $key => $v) {
				for(; $v > 0; $v--) {
					$result = $packClass->addToPack($key, $p_id);
					if($result === null) {
						$db->query('ROLLBACK');
						return '無法取得獎勵物品';
					}
					if($result === '' ) {
						$db->query('ROLLBACK');
						return '背包滿了，無法取得獎勵物品';
					}
				}
			}
		}
		
		//a3k 取得武將
		if($this->award['fellow']) {
			include_once('../controller/a3k_fellow_control.php');
			$fellowClass = new fellow_class;
			foreach($this->award['fellow'] as $fellow_id) {
				if($fellowClass->getfellow($fellow_id, $p_id) === false) {
					$db->query('ROLLBACK');
					return '無法取得武將';
				}
			}
		}
		
		$db->query('COMMIT');
		return true;
	}
	
	function getQuestType() {
		return $this->type;
	}
	
	function setLimit($limit) {
		if(is_array($limit)) {
			if($limit['lv'] && is_numeric($limit['lv'])) {
				$this->limit['lv'] = intval($limit['lv']);
			}
			
			if($limit['job']) {
				$this->limit['job'] = $limit['job'];
			}
			
			if($limit['item'] && is_array($limit['item'])) {
				$this->limit['item'] = $limit['item'];
			}
			
			if($limit['quest'] && is_array($limit['quest'])) {
				foreach($limit['quest'] as $k=>$v) {
					$limit['quest'][$k] = '"'.$v.'"';
				}
				$this->limit['quest'] = $limit['quest'];
			}
			
			if($limit['endTime'] && is_array($limit['endTime']) && count($limit['endTime']) == 24) {
				$this->limit['endTime'] = $limit['endTime'];
			}
			
			if($limit['description']) {
				$this->limit['description'] = $limit['description'];
			}
			$this->limit = $limit;
		}
	}
	
	function getLimit() {
		$limit = $this->limit;
		$questType = $this->getQuestType();
		if($questType == QUEST_NORMAL || $questType == QUEST_UNLIMITED) {
			unset($limit['endTime']);
		}
		return $limit;
	}
	
	function setNeed($need) {
		if(is_array($need)) {
			if($need['monster'] && is_array($need['monster'])) {
				$this->need['monster'] = $need['monster'];
			}
			
			if($need['fight'] && is_array($need['fight'])) {
				$this->need['fight'] = $need['fight'];
			}
			
			if($need['item'] && is_array($need['item'])) {
				$this->need['item'] = $need['item'];
			}
			
			if($need['description']) {
				$this->need['description'] = $need['description'];
			}
			
		}
	}
	
	function getNeed($thin = false) {
		$need = $this->need;
		if($thin === true) {
			unset($need['item'], $need['description']);
		}
		return $need;
	}
	
	function setAward($award) {
		if(is_array($award)) {
			if($award['exp'] && is_numeric($award['exp'])) {
				$this->award['exp'] = $award['exp'];
			}
			
			if($award['money'] && is_numeric($award['money'])) {
				$this->award['money'] = $award['money'];
			}
			
			if($award['point'] && is_numeric($award['point'])) {
				$this->award['point'] = $award['point'];
			}
			
			if($award['item'] && is_array($award['item'])) {
				$this->award['item'] = $award['item'];
			}
			
			if($award['fellow']) {
				$this->award['fellow'] = $award['fellow'];
			}
			
			if($award['description']) {
				$this->award['description'] = $award['description'];
			}
			
		}
	}
	
	function getAward() {
		return $this->award;
	}
	
	function getAwardFellowName($flid){
			global $db;
			$flquery = $db->query_first('SELECT p_name FROM a3k_fellowshop WHERE fl_id="'.$flid.'" ');
			return $flquery[p_name];
		}
}
?>