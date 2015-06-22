<?php
define('DATATYPE_ONE', 1);
define('DATATYPE_SECOND', 2);

class quest {
	function add($p_id) {
		global $db;
		$limit = array(
			'lv' => $_POST['limit_lv'],
			'job' => $_POST['limit_job'],
			'item' => $_POST['limit_item'],
			'quest' => $_POST['limit_quest'],
			'description' => $_POST['limit_description']
		);
		$need = array(
			'monster' => $_POST['need_monster'],
			'fight' => $_POST['need_fight'],
			'item' => $_POST['need_item'],
			'description' => $_POST['need_description']
		);
		$award = array(
			'exp' => $_POST['award_exp'],
			'money' => $_POST['award_money'],
			'item' => $_POST['award_item'],
			'point' => $_POST['award_point'],
			'fellow' => $_POST['award_fellow'],
			'description' => $_POST['award_description'],
		);
		$title = htmlspecialchars(trim($_POST['title']));
		$requester = htmlspecialchars(trim($_POST['requester']));
		$img = htmlspecialchars(trim($_POST['img']));
		$map_name = htmlspecialchars(trim($_POST['map_name']));
		$map_id = htmlspecialchars(trim($_POST['map_id']));
		$dest_map = htmlspecialchars(trim($_POST['dest_map']));
		$description = htmlspecialchars(trim($_POST['description']));
		$expireTime = htmlspecialchars(trim($_POST['expireTime']));
		$instant = intval($_POST['instant']) ? 1 : 0 ;
		if(!$expireTime) {
			$expireTime = 'null';
		}
		
		//alert('x'.is_null($expireTime));
		if(empty($title) 
			|| empty($requester) 
			|| empty($map_name) 
			|| empty($map_id) 
			|| empty($dest_map) 
			|| empty($description) 
		) {
			alert('內容不完全');
		}
		
		$info = $db->query_first('SELECT max(q_id) as q_id FROM a3k_quest');
		$nextIndex = (substr($info['q_id'], 1)+1);
		while(strlen($nextIndex) < 5) {
			$nextIndex = '0'.$nextIndex;
		}
		$nextIndex = 'q'.$nextIndex;

		$db->query('
			INSERT INTO 
			a3k_quest(q_id, q_title, q_requester, q_img, q_map_name, q_map_id, q_show_lv, q_description, q_dest_map, q_expireTime, q_instant)
			VALUES("'.$nextIndex.'", "'.$title.'", "'.$requester.'", "'.$img.'", "'.$map_name.'"
			, "'.$map_id.'",  "'.intval($_POST['limit_show_lv']).'", "'.$description.'", "'.$dest_map.'", '.$expireTime.', '.$instant.')
		');
		
		$db->query('INSERT INTO a3k_quest_limit
		(q_id, limit_lv, limit_job, limit_item, limit_quest, limit_description)
		VALUES("'.$nextIndex.'", "'.$limit['lv'].'", "'.$limit['job'].'", "'.$limit['item'].'", "'.$limit['quest'].'", "'.$limit['description'].'")
		');
		$db->query('INSERT INTO a3k_quest_need
		(q_id, need_monster, need_fight, need_item, need_description)
		VALUES("'.$nextIndex.'", "'.$need['monster'].'", "'.$need['fight'].'", "'.$need['item'].'", "'.$need['description'].'")
		');
		$db->query('INSERT INTO a3k_quest_award
		(q_id, award_exp, award_money, award_item, award_point, award_fellow, award_description)
		VALUES("'.$nextIndex.'", "'.$award['exp'].'", "'.$award['money'].'", "'.$award['item'].'", "'.$award['point'].'", "'.$award['fellow'].'", "'.$award['description'].'")
		');

		$hasTimeLimit = false;
		if($_POST['limit_time']) {
			$hasTimeLimit = true;
			$arr = explode(',', $_POST['limit_time']);
			$db->query('INSERT INTO 
				a3k_quest_time(q_id, q_week, q_hour)
				VALUES("'.$nextIndex.'", "'.$arr[0].'", "'.$arr[1].'")
			');
		}
		
		//建立class檔案
	
		//重建資料
		
		/*$this->rebuildArray($limit['job']);
		$this->rebuildArray($limit['item'], DATATYPE_SECOND);
		$this->rebuildArray($limit['quest']);
		$this->rebuildArray($need['monster'], DATATYPE_SECOND);
		$this->rebuildArray($need['fight'], DATATYPE_SECOND);
		$this->rebuildArray($need['item'], DATATYPE_SECOND);
		$this->rebuildArray($award['item'], DATATYPE_SECOND);
		$this->rebuildArray($award['fellow']);
		
		$str = '<?php
include_once(\'quest_base.class.php\');
class '.$nextIndex.' extends quest_base{
	function '.$nextIndex.'() {
		$this->setQuestType('.($hasTimeLimit?'QUEST_ONCE_PER_DAY':'QUEST_NORMAL').');
		
		$this->setLimit('.var_export($limit, true).');
		
		$this->setNeed('.var_export($need, true).');
		
		$this->setAward('.var_export($award, true).');
	}
}
?>';
		$fp = fopen(__ROOT__.'questdata/'.$nextIndex.'.class.php', 'w+');
		flock($fp, LOCK_EX);
		fputs($fp, $str);
		flock($fp, LOCK_UN);
		fclose($fp);*/
		
		$result = array('success', true);
		echo json_encode($result);
	}
	
	function alive($p_id) {
		global $db;
		$title = htmlspecialchars(trim($_POST['title']));
		$expireTime = intval($_POST['expireTime']);
		$db->query('
			UPDATE a3k_quest
			SET q_expireTime = "'.$expireTime.'"
			WHERE q_title = "'.$title.'"
		');
		$result = array(
			'success' => true
		);
		echo json_encode($result);
	}
	
	function edit($p_id) {
		global $db;
		if(empty($_POST['id'])) {
			alert('無法編輯');
		}
		$limit = array(
			'lv' => $_POST['limit_lv'],
			'job' => $_POST['limit_job'],
			'item' => $_POST['limit_item'],
			'quest' => $_POST['limit_quest'],
			'description' => $_POST['limit_description']
		);
		$need = array(
			'monster' => $_POST['need_monster'],
			'fight' => $_POST['need_fight'],
			'item' => $_POST['need_item'],
			'description' => $_POST['need_description']
		);
		$award = array(
			'exp' => $_POST['award_exp'],
			'money' => $_POST['award_money'],
			'item' => $_POST['award_item'],
			'point' => $_POST['award_point'],
			'fellow' => $_POST['award_fellow'],
			'description' => $_POST['award_description'],
		);
		$title = htmlspecialchars(trim($_POST['title']));
		$requester = htmlspecialchars(trim($_POST['requester']));
		$img = htmlspecialchars(trim($_POST['img']));
		$map_name = htmlspecialchars(trim($_POST['map_name']));
		$map_id = htmlspecialchars(trim($_POST['map_id']));
		$dest_map = htmlspecialchars(trim($_POST['dest_map']));
		$description = htmlspecialchars(trim($_POST['description']));
		$expireTime = htmlspecialchars(trim($_POST['expireTime']));
		$instant = intval($_POST['instant']) ? 1 : 0 ;
		if(!$expireTime) {
			$expireTime = 'null';
		}
		
		//alert('x'.is_null($expireTime));
		if(empty($title) 
			|| empty($requester) 
			|| empty($map_name) 
			|| empty($map_id) 
			|| empty($dest_map) 
			|| empty($description) 
		) {
			alert('內容不完全');
		}
		
		$db->query('
		UPDATE a3k_quest 
		SET q_title = "'.$title.'", q_requester = "'.$requester.'", q_map_name = "'.$map_name.'", q_map_id = "'.$map_id.'", q_dest_map = "'.$dest_map.'", q_description = "'.$description.'", q_instant = "'.$instant.'"
		WHERE q_id = "'.$_POST['id'].'"');
		
		
		$db->query('
		UPDATE a3k_quest_award
		SET award_exp = "'.$award['exp'].'", award_money = "'.$award['money'].'", award_item = "'.$award['item'].'", award_point = "'.$award['point'].'", award_fellow = "'.$award['fellow'].'", award_description = "'.$award['description'].'"
		WHERE q_id = "'.$_POST['id'].'"');
		$db->query('
		UPDATE a3k_quest_limit
		SET limit_lv = "'.$limit['lv'].'", limit_job = "'.$limit['job'].'", limit_item = "'.$limit['item'].'", limit_quest = "'.$limit['quest'].'", limit_description = "'.$limit['description'].'"
		WHERE q_id = "'.$_POST['id'].'"');
		$db->query('
		UPDATE a3k_quest_need
		SET need_monster = "'.$need['monster'].'", need_fight = "'.$need['fight'].'", need_item = "'.$need['item'].'", need_description = "'.$need['description'].'"
		WHERE q_id = "'.$_POST['id'].'"');
		if($_POST['limit_time']) {
			$hasTimeLimit = true;
			$arr = explode(',', $_POST['limit_time']);
			$db->query('REPLACE INTO 
				a3k_quest_time(q_id, q_week, q_hour)
				VALUES("'.$_POST['id'].'", "'.$arr[0].'", "'.$arr[1].'")
			');
		}
		echo json_encode(array('success'=>true));
	}
	
	function getDetail($p_id) {
		global $db;
		$quest = $db->query_first('SELECT a.q_title, a.q_requester, a.q_img, a.q_description, a.q_dest_map, a.q_map_id, a.q_show_lv, a.q_map_name, a.q_expireTime, a.q_instant,
		b.award_exp, b.award_money, b.award_item, b.award_point, b.award_fellow, b.award_description,
		c.limit_lv, c.limit_job, c.limit_item, c.limit_quest, c.limit_description,
		d.need_monster, d.need_fight, d.need_item, d.need_description
		,e.q_week, e.q_hour
		FROM a3k_quest a LEFT JOIN a3k_quest_award b ON b.q_id = a.q_id
		LEFT JOIN a3k_quest_limit c ON c.q_id = a.q_id
		LEFT JOIN a3k_quest_need d ON d.q_id = a.q_id
		LEFT JOIN a3k_quest_time e ON e.q_id = a.q_id
		WHERE a.q_id = "'.$_POST['id'].'"');
		echo json_encode(($quest));
	}
	function getList($p_id) {
		global $db;
		$list = array();
		$query = $db->query('SELECT q_id, q_title, q_requester, q_map_name, q_expireTime FROM a3k_quest order by q_id');
		while($d = $db->fetch_array($query)) {
			$list[] = array(
				'q_id'=>$d['q_id'],
				'q_title'=>$d['q_title'],
				'q_requester'=>$d['q_requester'],
				'q_map_name'=>$d['q_map_name'],
				'q_expire' => ($d['q_expireTime'] && $d['q_expireTime']<time() ? true : false )
			);
		}
		$result = array(
			'list' => $list
		);
		echo json_encode($result);
	}
	
	function remove($p_id) {
		global $db;
		$title = htmlspecialchars(strip_tags(trim($_POST['title'])));
		$db->query('UPDATE a3k_quest SET q_expireTime = "'.time().'" WHERE q_title = "'.$title.'"');
		$result = array(
			'success' => true
		);
		echo json_encode($result);
	}
	
	function rebuildArray(&$data, $type = DATATYPE_ONE) {
		if(!$data) {
			$data = null;
			return;
		}
		switch($type) {
			default:
			case DATATYPE_ONE://有逗號，沒有分號
				$data = explode(',', $data);
			break;
			
			case DATATYPE_SECOND://有逗號，有分號
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