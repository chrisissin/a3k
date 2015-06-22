<?php
define('QUEST_NORMAL', 1);	//只能接一次
define('QUEST_ONCE_PER_DAY', 2);//每日一次
define('QUEST_UNLIMITED', 4);//不限次數

class quest{
		function acceptQuest($p_id) {
		global $db;
		$q_id = htmlspecialchars(trim($_POST['q_id']));
		$user = $db->query_first('SELECT * FROM a3k_player WHERE p_id = "'.$p_id.'"');
		
		//a3k 測試用
		//$user['p_map'] = 'c1';
		
		$result = array();
		$quest = $db->query_first('
			SELECT a.q_id, a.q_description, a.q_instant, b.q_week, b.q_hour 
			, c.limit_lv, c.limit_job, c.limit_item, c.limit_quest
			, d.need_monster, d.need_fight
			, e.award_exp, e.award_money, e.award_item, e.award_point, e.award_fellow
			FROM a3k_quest a LEFT JOIN a3k_quest_time b ON a.q_id = b.q_id
			LEFT JOIN a3k_quest_limit c ON c.q_id = a.q_id
			LEFT JOIN a3k_quest_need d ON d.q_id = a.q_id
			LEFT JOIN a3k_quest_award e ON e.q_id = a.q_id
			WHERE a.q_map_id  = "'.$user['p_map'].'" AND a.q_id = "'.$q_id.'"
		');
		//$qdataPath = __ROOT__.'questdata/'.$quest['q_id'].'.class.php';
		if(!$quest) {
			alert('任務不存在');
		}
		
		if($quest['q_status'] == -1) {
			alert('任務已完成');
		}
		
		if($quest['q_status'] == 1) {
			alert('任務已接受');
		}
		$questEndTime = $this->getEndTime($quest['q_week'], $quest['q_hour']);
		//include_once($qdataPath);
		//$qdata = new $quest['q_id'];
		
		//確認任務是否在可接受的時段
		if($this->checkBeginTime($quest['q_week'], $quest['q_hour']) === false) {
			alert('尚未到能接受任務的時間');
		}
		//檢查任務的條件限制
		$check = $this->checkLimit($user, $quest);
		if($check !== true) {
			alert($check);
		//	echo "<script language=\"JavaScript\" >notifyactionresult($check);</script>";
		}
		
		//如果是立即完成性任務，直接進入獎勵階段，不然就進入一般程序
		if($quest['q_instant'] == 1) {
			//完成任務，配置獎勵
			$check = $this->finishQuest($p_id, $quest);
			if($check !== true) {
				alert($check);
			}
			$db->query('INSERT INTO 
			a3k_quest_status(p_id, q_id, q_status, q_data, q_end_time)
			VALUES("'.$p_id.'", "'.$quest['q_id'].'", "-1", \'\', "'.$questEndTime.'")');
			
			$result = array('finish' => true);
		} else {
		
			
			
			//新增任務狀態
			//$need = $qdata->getNeed(true);
			$this->rebuildArray($quest['need_monster'], 2);
			$this->rebuildArray($quest['need_fight'], 2);
			$need = array(
				'monster' => $quest['need_monster'],
				'fight' => $quest['need_fight']
			);
			$db->query('INSERT INTO 
			a3k_quest_status(p_id, q_id, q_status, q_data, q_end_time)
			VALUES("'.$p_id.'", "'.$quest['q_id'].'", "1", \''.serialize($need).'\', "'.$questEndTime.'")');
			
			$result = array(
				'success' =>true
			);
		}
		
		echo json_encode($result);
	}
	
	function cancelQuest($p_id) {
		global $db;
		$q_id = htmlspecialchars(trim($_POST['q_id']));
		
		$quest = $db->query_first('
			SELECT a.q_status, b.q_id 
			FROM a3k_quest_status a, a3k_quest b
			WHERE a.p_id = "'.$p_id.'" AND a.q_id = b.q_id AND b.q_id = "'.$q_id.'"');
		if(!$quest) {
			alert('任務不存在');
		}
		
		if($quest['q_status'] == -1) {
			alert('任務已完成，無法取消');
		}
		
		//刪除接受的任務資訊
		$db->query('DELETE FROM a3k_quest_status WHERE q_id = "'.$quest['q_id'].'" AND p_id = "'.$p_id.'"');
		
		$result = array(
			'success' =>true
		);
		
		echo json_encode($result);
	}
	
	function checkBeginTime($week, $hour) {
		//沒有時間限制
		if(is_null($week) || is_null($hour)) {
			return true;
		}
		$week = toBinary(intval($week), 7);
		$hour = toBinary(intval($hour), 24);
		$time = getdate();
		
		//日期或時間不是開放的時段
		if($week[$time['wday']] == 0 || $hour[$time['hours']] == 0) {
			return false;
		}
		return true;
	}
	
	//檢查玩家是否符合任務的條件限制
	function checkLimit(&$p, &$quest) {
		global $db;
		if($quest['limit_job']) {
			$quest['limit_job'] = explode(',', $quest['limit_job']);
			if($p['role_id'] != $quest['limit_job'][0]) {
				return '職業不符';
			}
		}
		
		if($quest['limit_lv'] && $p['p_lv'] < $quest['limit_lv']) {
			return '等級不足';
		}
		if($quest['limit_item']) {
			//alert($quest['limit_item']);
			$quest['limit_item'] = explode(',', $quest['limit_item']);
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($quest['limit_item'] as $v) {
				$v = explode(':', $v);
				if($packClass->checkitem($p['p_id'], $v[0], $v[1]) === false) {
					return '持有物品不足';
				}
			}
			
		}
		
		 if($quest['limit_quest']) {
		 	//$quest = implode(',', $this->limit['quest']);
		 	$qid = explode(',', $quest['limit_quest']);
		 	$qnum = count($qid);
		 	foreach($qid as $k=>$v) {
		 		$qid[$k] = '\''.$v.'\'';
		 	}
		 	$qid = implode(',', $qid);
		 	$check = $db->query_first('SELECT count(q_id) AS num FROM a3k_quest_status WHERE q_id in ('.$qid.') AND q_status = -1 AND p_id = '.$p['p_id'].' ');
		 	if($check['num'] < count($qnum)) {
		 		return '前置任務尚未完成';
		 	} 
		 }
		return true;
	}
	
	function checkReportable($p_id) {
		global $db;
		//echo $d['q_id'];
		$query = $db->query('
		SELECT a.q_id, a.q_data, b.need_item
		FROM a3k_quest_status a LEFT JOIN a3k_quest_need b ON b.q_id = a.q_id
		WHERE p_id = "'.$p_id.'" AND q_status = 1
		');
		while($d = $db->fetch_array($query)) {
			//$qdataPath = __ROOT__.'questdata/'.$d['q_id'].'.class.php';
			if(!$d) {
				continue;
			}
			
			//include_once($qdataPath);
			//$qdata = new $d['q_id'];
			$need = unserialize($d['q_data']);
			$need['need_item'] = $d['need_item'];
			if($this->checkNeed($p_id, $need) === true) {
				$db->query('UPDATE a3k_quest_status SET q_status = 2 WHERE p_id = "'.$p_id.'" AND q_id = "'.$d['q_id'].'"');
			}
		}
	}
	
	function cleanExpiredQuest() {
		global $db;
		$db->query('DELETE FROM a3k_quest_status WHERE q_end_time != 0 AND q_end_time < '.time());
	}
	
	function getAcceptedList($p_id) {
		global $db;
		
		$list = array();
		$query = $db->query('SELECT a.q_id, a.q_title, b.q_status FROM a3k_quest a, a3k_quest_status b WHERE a.q_id = b.q_id AND b.p_id = "'.$p_id.'" AND b.q_status <> -1');
		while($d = $db->fetch_array($query)) {
			$list[] = $d['q_id'].','.$d['q_title'].','.$d['q_status'];
		}
		$result = array(
			'list' => $list
		);
		echo json_encode($result);
	}
	
	function getEndTime($week, $hour) {
		//沒有時間限制
		if(is_null($week) || is_null($hour)) {
			return 0;
		}
		
		$week = toBinary(intval($week), 7);
		$hour = toBinary(intval($hour), 24);
		$time = getdate();
		
		//過濾出截止時間
		while($week[$time['wday']] && $hour[$time['hours']]) {
			$time['hours']++;
			
			if($time['hours'] == 24) {
				break;
			}
		}
		return mktime($time['hours'], 0, 0, $time['mon'], $time['mday'], $time['year']);
	}
	
	function getFinishedList($p_id) {
		global $db;
		
		$list = array();
		$query = $db->query('SELECT a.q_id, a.q_title FROM a3k_quest a, a3k_quest_status b WHERE a.q_id = b.q_id AND b.p_id = "'.$p_id.'" AND b.q_status = -1');
		while($d = $db->fetch_array($query)) {
			$list[] = $d['q_id'].','.$d['q_title'];
		}
		$result = array(
			'list' => $list
		);
		echo json_encode($result);
	}
	
	function getQuestDetail($p_id) {
		global $db;
		$q_id = htmlspecialchars(trim($_POST['q_id']));
		$user = $db->query_first('SELECT p_map FROM a3k_player WHERE p_id = "'.$p_id.'"');
		//a3k 測試用
		//$user['p_map'] = 'c1';
		//alert($q_id);
		$result = array();
		/*$quest = $db->query_first('
			SELECT a.q_id, a.q_description, b.q_week, b.q_hour 
			FROM a3k_quest a LEFT JOIN a3k_quest_time b ON a.q_id = b.q_id
			WHERE a.q_map_id  = "'.$user['p_map'].'" AND a.q_id = "'.$q_id.'"
		');*/
		$quest = $db->query_first('
			SELECT a.q_id, a.q_description, a.q_type, b.q_week, b.q_hour 
			, c.limit_lv, c.limit_job, c.limit_item, c.limit_quest, c.limit_description
			, d.need_monster, d.need_fight, d.need_item, d.need_description
			, e.award_exp, e.award_money, e.award_item, e.award_fellow, e.award_point
			FROM a3k_quest a LEFT JOIN a3k_quest_time b ON a.q_id = b.q_id
			LEFT JOIN a3k_quest_limit c ON c.q_id = a.q_id
			LEFT JOIN a3k_quest_need d ON d.q_id = a.q_id
			LEFT JOIN a3k_quest_award e ON e.q_id = a.q_id
			WHERE  a.q_id = "'.$q_id.'"
		');
		//alert($quest['q_id']);
		//$qdataPath = __ROOT__.'questdata/'.$quest['q_id'].'.class.php';
		if(!$quest) {
			alert('任務不存在');
		}
		//test alert('174');
		//載入任務的class檔案
		//include_once($qdataPath);
		//$qdata = new $quest['q_id'];
		
		//有前置任務的話，取得前置任務的名稱
		//$limit = $qdata->getLimit();
		$limit = array(
			'lv' => $quest['limit_lv'],
			'description' => $quest['limit_description']
		);
		if($quest['limit_quest']) {
			$limit['quest'] = $this->getLimitQuestName($quest['limit_quest']);
		}
		
	//test	alert('185');
		if($quest['limit_job']) {
			$limit['job'] = $this->getLimitJobName(explode(',', $quest['limit_job']));
		}
//test alert('189');
		//有限定物品的話，取得物品名稱
		if($quest['limit_item']) {
			$limit['item'] = $this->getItemName($quest['limit_item']);
		}
		
		if($quest['q_week']) {
			$limit['week'] = $quest['q_week'];
			$limit['hour'] = $quest['q_hour'];
		}
		
		//有指定怪物的話，取得怪物名稱
		//$need = $qdata->getNeed();
		$need = array(
			'description'=>$quest['need_description']
		);
		if($quest['need_monster']) {
			$need['monster'] = $this->getNeedMonsterName($quest['need_monster']);
		}
		//alert($need['fight']['m01']);
		if($quest['need_fight']) {
			$need['fight'] = $this->getNeedFightName($quest['need_fight']);
		}

		//有指定物品的話，取得物品名稱

		if($quest['need_item']) {
			$need['item'] = $this->getItemName($quest['need_item']);
		}

		//$award = $qdata->getAward();
		$award = array(
			'exp'=>$quest['award_exp'],
			'money'=>$quest['award_money'],
			'point'=>$quest['award_point'],
			'description'=>$quest['award_description']
		);
		//有報酬物品的話，取得物品名稱
		if($quest['award_item']) {
			$award['item'] = $this->getItemName($quest['award_item']);
		}
 //test alert('217');	
		if($quest['award_fellow']) {
			$quest['award_fellow'] = explode(',', $quest['award_fellow']);
			foreach($quest['award_fellow'] as $k=>$v) {
				$award['fellow'][$k] = $this->getAwardFellowName($v);
			}
		}
		//test alert('221');
		$result = array(
			'q_id' => $q_id, 
			'type' => $quest['q_type'],
			'description' => $quest['q_description'],
			'limit' => $limit,
			'need' => $need,
			'award' =>$award
		);
		echo json_encode($result);
	}
	
	function getQuestList($p_id) {
		global $db;
		$requester = htmlspecialchars(trim($_POST['requester']));
		$user = $db->query_first('SELECT p_map, p_lv FROM a3k_player WHERE p_id = "'.$p_id.'"');
		
		//a3k 測試用
		//$user['p_map'] = 'c1';
		
		//a3k 清除過期的可重複任務
		$this->cleanExpiredQuest();
		
		$list = array();
		$t = getdate();
		$thisweek = 1 << $t['wday'];
		$thishour = 1 << $t['hours'];
		$query = $db->query('
			SELECT a.q_id, a.q_title 
			FROM a3k_quest a 
				LEFT JOIN a3k_quest_status b ON (b.q_id = a.q_id AND b.p_id = "'.$p_id.'") 
				LEFT JOIN a3k_quest_time c ON c.q_id = a.q_id
			WHERE a.q_map_id  = "'.$user['p_map'].'" 
			AND a.q_requester = "'.$requester.'" 
 AND b.q_status is null 
			AND (c.q_week is null 
				OR (c.q_week & '.$thisweek.' = '.$thisweek.' 
					AND c.q_hour & '.$thishour.' = '.$thishour.'))
			AND (a.q_expireTime IS NULL OR a.q_expireTime > '.time().')
			AND q_show_lv <= '.$user['p_lv'].'
		');// 			AND b.q_status is null
		

   /*     $query = $db->query('
            SELECT a.q_title
            FROM a3k_quest a
                LEFT JOIN a3k_quest_status b ON b.q_id = a.q_id
                LEFT JOIN a3k_quest_time c ON c.q_id = a.q_id
            WHERE a.q_map_id  = "'.$user['p_map'].'"
            AND a.q_requester = "'.$requester.'"
            AND b.q_status is null
            AND b.p_id = "'.$p_id.'"
            AND (c.q_week is null
                OR (c.q_week & '.$thisweek.' = '.$thisweek.'
                    AND c.q_hour & '.$thishour.' = '.$thishour.'))
            AND (a.q_expireTime IS NULL OR a.q_expireTime > '.time().')
            AND q_show_lv <= '.$user['p_lv'].'
        ');
        */
		while($d = $db->fetch_array($query)) {
			$list[] = $d['q_id'].','.$d['q_title'];
		}
		$result = array(
			'list' => $list
		);
		echo json_encode($result);
	}
	
	function getRequester($p_id) {
		global $db;
		$requester = array();
		$user = $db->query_first('SELECT p_lv,p_map FROM a3k_player WHERE p_id = "'.$p_id.'"');
		
		//a3k 測試用
		//$user['p_lv'] = 100;
		//$user['p_map'] = 'c1';
		
		$query = $db->query('SELECT DISTINCT q_requester, q_img FROM a3k_quest WHERE q_map_id  = "'.$user['p_map'].'" AND q_show_lv <= '.intval($user['p_lv']).'');
		while($d = $db->fetch_array($query)) {
			$requester[] = $d['q_requester'].','.$d['q_img'];
		}
		$result = array(
			'requester' => $requester
		);
	echo json_encode($result);
	}
	
	
	
	
	
	function reportQuest($p_id, $q_id = '') {
		global $db;
		if(empty($q_id)) {
			$q_id = $_POST['q_id'];
		}
		$q_id = htmlspecialchars(trim($q_id));
		
		$quest = $db->query_first('
			SELECT a.q_status, a.q_data, b.q_type, b.q_id 
			, d.need_monster, d.need_fight, d.need_item, d.need_description
			, e.award_exp, e.award_money, e.award_item, e.award_fellow, e.award_point
			FROM a3k_quest_status a, a3k_quest b LEFT JOIN a3k_quest_need d ON d.q_id = b.q_id
			LEFT JOIN a3k_quest_award e ON e.q_id = b.q_id
			WHERE a.p_id = "'.$p_id.'" AND a.q_id = b.q_id AND b.q_id = "'.$q_id.'"');
		//$qdataPath = __ROOT__.'questdata/'.$quest['q_id'].'.class.php';
		if(!$quest) {
			alert('任務不存在');
		}
		
		if($quest['q_status'] == -1) {
			alert('任務已完成');
		}
		
		//include_once($qdataPath);
		//$qdata = new $quest['q_id'];
		//alert($ques);
		$need = unserialize($quest['q_data']);
		$need['need_item'] = $quest['need_item'];
		$check = $this->checkNeed($p_id, $need);
		if($check !== true) {
			alert($check);
		}
		
		//完成任務
		
		//remove quest item
		$this->removeItem($p_id, $quest['need_item']);
		//配置獎勵
		$check = $this->finishQuest($p_id, $quest);
		if($check !== true) {
			alert($check);
		}
		
		$result = array(
			'success' =>true
		);	
		
		echo json_encode($result);
	}
	
	function updateNeed($p_id, $m_id, $number, $map_id) {
try
{		
		global $db;
		//將過期任務清除
		$this->cleanExpiredQuest();
		
		//用來紀錄是否有更新過
		$haveUpdate = false;
		
		$query = $db->query('
			SELECT q_id, q_data FROM a3k_quest_status 
			WHERE p_id = "'.$p_id.'" AND q_status = 1 AND q_data is not null
		');
		while($d = $db->fetch_array($query)) {
			//用來辨別是否需要更新的變數
			$needUpdate = false;
			//沒有q_data，這個任務可能沒有更新戰鬥資訊的必要
			if(empty($d['q_data'])) {
				continue;
			}
			$data = unserialize($d['q_data']);
			
			//a3k q_data的格式有問題，無法產生正確的array時將跳過這筆紀錄
			/*if(!is_array($data)) {
				continue;
			}*/
			//怪物需求檢查
			
			if($m_id && is_array($data['monster'])) {
				//如果$m_id不是陣列，則建成陣列形式

				if(!is_array($m_id)) {
					
					$m_id = array($m_id);
				}
				//echo addslashes(var_export($m_id, true)).';';
				//echo addslashes(var_export($data['monster'], true)).';';
				foreach($m_id as $id) {
					//$id沒有在需求內則跳過
					if(!array_key_exists($id, $data['monster'])) {

						continue;
					}
					$data['monster'][$id] = intval($data['monster'][$id]) - $number;
					//數量完成就把id刪除
					if($data['monster'][$id] < 1) {
						unset($data['monster'][$id]);
					}
					$needUpdate = true;
				}
				
			}
			//勝場需求檢查
			
			if(is_array($data['fight']) && array_key_exists($map_id, $data['fight'])) {
				
				$data['fight'][$map_id] = intval($data['fight'][$map_id]) - 1;
				if($data['fight'][$map_id] < 1) {
					unset($data['fight'][$map_id]);
				}
				$needUpdate = true;
			}
			if($needUpdate === true) {
				$haveUpdate = true;
				$db->query('
					UPDATE a3k_quest_status 
					SET q_data = "'.addslashes(serialize($data)).'"
					WHERE p_id = "'.$p_id.'" AND q_id = "'.$d['q_id'].'"
				');
			}
			
		}
		return $haveUpdate;
}catch (Exception $e) {
    echo 'Caught exception: '.  $e->getMessage(), "\n";
}				
	}
	function getNeedFightName($map) {
		global $db;
		$result = array();
		
		//$map = $this->need['fight'];
		if(!$map) {
			return $result;
		}
		$this->rebuildArray($map, 2);
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
	
	function getNeedMonsterName($monster) {
		global $db;
		$result = array();
		if(!$monster) {
			return $result;
		}
		$this->rebuildArray($monster, 2);
		// x 20090304 modified  to fit a3k db
		$monsterID = array();
		foreach($monster as $k=>$v) {
			$monsterID[] = '\''.$k.'\'';
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
	
	function getLimitQuestName($quest) {
		global $db;
		$result = array();
		// x 20090304 modified  to fit a3k db
		if(!$quest) {
			return $result;
		}
		$this->rebuildArray($quest, 1);
		foreach($quest as $k=>$v) {
			$quest[$k] = '\''.$v.'\'';
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
		$job= $db->query_first('SELECT role_name FROM a3k_role WHERE role_id = "'.$jobID[0].'" ');
		return $job[role_name];
	}
	
	function getItemName($list) {
		global $db;
		$result = array();
		// x 20090304 modified  to fit a3k db
		if(!$list) {
			return $result;
		}
		$this->rebuildArray($list, 2);
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
			//	$query = $db->query("SELECT item_id, item_name FROM a3k_items WHERE item_id = '".$listID."'  ");
		$query = $db->query('SELECT i.item_id, i.item_name FROM a3k_items as i WHERE i.item_id in ('.$listID.') ');
	//	echo('SELECT i.item_id, i.item_name FROM a3k_items as i, a3k_player_item as pi WHERE i.item_id in ('.$listID.') and i.item_id = pi.item_id ');
		while($d = $db->fetch_array($query)) {
			//$result[$d['item_name']]=$d['item_name'];
			$result[$d['item_name']] = $list[$d['item_id']];
		}
		return $result;
	}
	
	function checkNeed($p_id, $need) {
		if ($need['monster']!=null)
		{
			if(count($need['monster']) > 0 || count($need['fight']) > 0) {
				return  '任務尚未完成';
			}
		}
		if ($need['fight'])
		{
			if(count($need['monster']) > 0 || count($need['fight']) > 0) {
				return  '任務尚未完成';
			}
		}
		
		//a3k 檢查物品　(檢查$need['need_item'])
		if($need['need_item']) {
			$this->rebuildArray($need['need_item'], 2);
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($need['need_item'] as $k=>$v) {
				if($packClass->checkitem($p_id, $k, $v) === false) {
					return '持有物品不足';
				}
			}
		}
		
		return true;
	}
	
	function removeItem($p_id, $need_item) {
		if($need_item) {
			$this->rebuildArray($need_item, 2);
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			
			foreach($need_item as $k=>$v) {
				$packClass->removeitem($p_id, $k, $v);
			}
		}
	}
	
	function finishQuest($p_id, &$quest) {
		global $db;
		$db->query('BEGIN');
		//$award = $this->getAward();
		//QUEST_UNLIMITED任務，直接將任務狀態刪除
		if($quest['q_type'] == QUEST_UNLIMITED) {
			$db->query('DELETE FROM a3k_quest_status WHERE q_id = "'.$quest['q_id'].'" AND p_id = "'.$p_id.'"');
		} else {
			//設置任務的狀態為[完成]
			$db->query('UPDATE a3k_quest_status SET q_status = -1, q_data = "" WHERE q_id = "'.$quest['q_id'].'" AND p_id = "'.$p_id.'"');
		}
		//數值獎勵
		//a3k 缺少學點的欄位
		$db->query('
			UPDATE a3k_player 
			SET p_money = p_money+'.$quest['award_money'].', p_exp = p_exp+'.$quest['award_exp'].'
			WHERE p_id = "'.$p_id.'"
		');
		
		//a3k 取得物品
		if($quest['award_item']) {
			$this->rebuildArray($quest['award_item'], 2);
			include_once('../controller/a3k_pack.php');
			$packClass = new a3k_pack;
			foreach($quest['award_item'] as $key => $v) {
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
		if($quest['award_fellow']) {
			$this->rebuildArray($quest['award_fellow'], 1);
			include_once('../controller/a3k_fellow_control.php');
			$fellowClass = new fellow_class;
			
			//$fellow = explode(',', $quest['award_fellow']);
			foreach($quest['award_fellow'] as $fellow_id) {
				if($fellowClass->getfellow($fellow_id, $p_id) === false) {
					$db->query('ROLLBACK');
					return '無法取得武將';
				}
			}
		}
		
		$db->query('COMMIT');
		return true;
	}
	
	function getAwardFellowName($flid){
		global $db;
		$flquery = $db->query_first('SELECT p_name FROM a3k_fellowshop WHERE fl_id="'.$flid.'" ');
		return $flquery[p_name];
	}
	
	function rebuildArray(&$data, $type = 1) {
		if(!$data) {
			$data = null;
			return;
		}
		switch($type) {
			default:
			case 1://有逗號，沒有分號
				$data = explode(',', $data);
			break;
			
			case 2://有逗號，有分號
				$tmp = split('[,\:]', $data);
				$arr = array();
				$len = count($tmp);
				for($i = 0 ; $i < $len; $i += 2) {
					$arr[$tmp[$i]] = intval($tmp[$i+1]);
				}
				$data = $arr;
			break;
		}
	}
}
?>