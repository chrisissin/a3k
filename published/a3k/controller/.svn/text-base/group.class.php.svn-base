<?php
class group {
	function checkGroup($p_id) {
		global $db;
		$p = $db->query_first('SELECT p_guild FROM a3k_player WHERE p_id = "'.$p_id.'"');
		$result = array('in_group'=> $p && $p['p_guild'] ? true : false);
		echo json_encode($result);
	}
	
	function checkPower($p_id) {
		$this->checkLeader($p_id);
		$result = array();
		echo json_encode($result);
	}
	
	function checkLeader($p_id) {
		global $db;
		$g = $db->query_first('SELECT b.g_leader 
		FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild 
		WHERE a.p_id = "'.$p_id.'"');
		if(!$g) {
			alert('沒有工會');
		}
		if($g['g_leader'] != $p_id) {
			alert('沒有執行的權限');
		}
	}
	
	function create($p_id) {
		include_once("../config/a3k_act_config.php");
		global $db, $a3k_config;
		$name = htmlspecialchars(trim($_POST['name']));
		$p = $db->query_first('SELECT p_guild , p_lv , p_money FROM a3k_player WHERE p_id = "'.$p_id.'"');
		if($p['p_guild']) {
			alert('已有所屬工會');
		}
		if( $p["p_lv"] < $a3k_config["create_group_lvl_contr"]  ) {
			alert('角色等級不夠 需要 '.$a3k_config["create_group_lvl_contr"].'級');
		}
		if( $p["p_money"] < $a3k_config["create_group_money_contr"]  )  {
			alert('費用不夠 需要 '.$a3k_config["create_group_money_contr"] );
		}				
		$g = $db->query_first('SELECT g_id FROM a3k_group WHERE g_name = "'.$name.'"');
		if($g) {
			alert('同名的工會已存在');
		}
		$db->query('INSERT INTO a3k_group(g_name, g_leader, g_count, g_text)VALUES("'.$name.'", "'.$p_id.'", "1", "沒有內容")');
		$g = $db->query_first('SELECT g_id FROM a3k_group WHERE g_name = "'.$name.'"');
		$db->query('UPDATE a3k_player SET p_guild = "'.$g['g_id'].'" , p_money = p_money - '. $a3k_config["create_group_money_contr"].' WHERE p_id = "'.$p_id.'"');
		$result = array('name'=>$name);
		echo json_encode($result);
	}
	
	function fire($p_id) {
		global $db;
		$this->checkLeader($p_id);
		$id = htmlspecialchars($_POST['id']);
		$g = $db->query_first('SELECT a.g_id, a.g_leader FROM a3k_group a, a3k_player b WHERE a.g_id = b.p_guild AND b.p_id = "'.$p_id.'"');
		if($g['g_leader'] == $id) {
			alert('工會會長無法踢除');
		}
		$db->query('UPDATE a3k_player SET p_guild = 0 WHERE p_id = "'.$id.'"');
		$db->query('UPDATE a3k_group SET g_count = g_count-1 WHERE g_id = "'.$g['g_id'].'"');
		$result = array();
		echo json_encode($result);
	}
	
	//取得成員列表
	function getInvitation($p_id) {
		global $db;
		$list = array();
		$query = $db->query('SELECT a.g_name, a.g_id 
		FROM a3k_group a, a3k_group_invitation b
		WHERE b.p_id = "'.$p_id.'" AND a.g_id = b.g_id');
		while($d = $db->fetch_array($query)) {
			$list[] = array('name'=>$d['g_name'], 'id'=>$d['g_id']);
		}
		array_reform($list);
		$result = array('list'=>$list);
		echo json_encode($result);
	}
	
	function getMember($p_id) {
		global $db;
		$list = array();
		$result = array();
		$name = htmlspecialchars($_POST['name']);
		$g = $db->query_first('SELECT a.p_guild, b.g_count, b.g_leader 
		FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild
		WHERE a.p_id = "'.$p_id.'"');
		$result['in_group'] = $g && $g['p_guild'] ?true:false;
		if($result['in_group']) {
			$limit = '';
			$page = intval($_POST['page']);
			if($page < 1) {
				$page = 1;
			}
			if($name) {
				$page = 1;
				$limit = 'a.p_guild = "'.$g['p_guild'].'" AND a.p_name LIKE "%'.$name.'%" LIMIT 10';
			} else {
				$start = ($page - 1) * 10;
				$limit = 'a.p_guild = "'.$g['p_guild'].'" LIMIT '.$start.', 10';
			}
			$query = $db->query('SELECT a.p_id, a.p_name, a.p_lv, b.role_name 
			FROM a3k_player a LEFT JOIN a3k_role b ON b.role_id = a.role_id
			WHERE '.$limit);
			while($d = $db->fetch_array($query)) {
				$list[] = array('id'=>$d['p_id'], 'name'=>$d['p_name'], 'lv'=>$d['p_lv'], 'role'=>$d['role_name']);
			}
			array_reform($list);
			$result['list'] = $list;
			$result['is_leader'] = $g['g_leader'] == $p_id ? true : false;
			$result['count'] = $g['g_count'];
		}
		$result['page'] = $page;
		echo json_encode($result);
	}
	//取得公告
	function getMessage($p_id) {
		global $db;
		$result = array();
		$message = array();
		
		$g = $db->query_first('SELECT a.p_guild, b.g_name, b.g_count, c.p_name AS leader_name 
		FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild
		LEFT JOIN a3k_player c ON (c.p_id = b.g_leader) 
		WHERE a.p_id = "'.$p_id.'"');
		$result['in_group'] = $g && $g['p_guild'] ?true:false;
		if($result['in_group']) {
			$result['group'] = array(
				'name'=>$g['g_name'], 
				'count'=>$g['g_count'], 
				'leader'=>$g['leader_name']
			);
			
			$query = $db->query('SELECT g_message, g_writetime FROM a3k_group_message WHERE g_id = "'.$g['p_guild'].'" ORDER BY g_writetime DESC LIMIT 10');
			while($d = $db->fetch_array($query)) {
				$message[] = array('msg'=>$d['g_message'], 'time'=>date('Y-m-d h:i', $d['g_writetime']));
			}
			array_reform($message);
		}
		$result['message'] = $message;
		echo json_encode($result);
	}
	
	function getText($p_id) {
		global $db;
		$result = array();
		
		$g = $db->query_first('SELECT a.p_guild, b.g_name, b.g_text, b.g_count, c.p_name AS leader_name 
		FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild
		LEFT JOIN a3k_player c ON (c.p_id = b.g_leader) 
		WHERE a.p_id = "'.$p_id.'"');
		$result['in_group'] = $g && $g['p_guild'] ?true:false;
		if($result['in_group']) {
			$result['group'] = array(
				'name'=>$g['g_name'], 
				'count'=>$g['g_count'], 
				'leader'=>$g['leader_name'], 
				'text'=>$g['g_text']
			);
		}
		echo json_encode($result);
	}
	
	function invite($p_id) {
		global $db;
		$g = $db->query_first('SELECT a.p_guild, b.g_leader
		FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild
		WHERE a.p_id = "'.$p_id.'"');
		if($g['p_guild'] == 0) {
			alert('沒有所屬工會');
		}
		/* x 20090818 原本軍團的「邀請加入」只有軍團長能使用，修改成軍團內的所有人都可以使用，使用流程不變
		if($g['g_leader'] != $p_id) {
			alert('不是工會會長，沒有邀請的權限');
		}*/
		$name = htmlspecialchars(trim($_POST['name']));
		$p = $db->query_first('SELECT p_id, p_guild FROM a3k_player WHERE p_name = "'.$name.'"');
		if($p['p_guild']) {
			alert('對象已有所屬工會');
		}
		
		$invite = $db->query_first('SELECT g_id FROM a3k_group_invitation WHERE g_id = "'.$g['p_guild'].'" AND p_id = "'.$p['p_id'].'"');
		if($invite) {
			alert('已發出過邀請');
		}
		$db->query('INSERT INTO a3k_group_invitation(g_id, p_id)VALUES("'.$g['p_guild'].'", "'.$p['p_id'].'")');
		$result = array('success'=>true);
		echo json_encode($result);
	}
	
	function join($p_id) {
		global $db;
		$p = $db->query_first('SELECT p_guild FROM a3k_player WHERE p_id = "'.$p_id.'"');
		if(!$p) {
			alert('玩家不存在');
		}
		if($p['p_guild'] != 0) {
			alert('已有工會');
		}
		
		$id = intval($_POST['id']);
		$invite = $db->query_first('SELECT b.g_id, b.g_name FROM a3k_group_invitation a, a3k_group b WHERE a.g_id = "'.$id.'" AND a.p_id = "'.$p_id.'" AND b.g_id = a.g_id');
		if(!$invite) {
			alert('該公會沒有向您提出邀請');
		}
		$db->query('UPDATE a3k_player SET p_guild = "'.$invite['g_id'].'" WHERE p_id = "'.$p_id.'"');
		$db->query('UPDATE a3k_group SET g_count = g_count+1 WHERE g_id = "'.$invite['g_id'].'"');
		$db->query('DELETE FROM a3k_group_invitation WHERE p_id = "'.$p_id.'"');
		$result = array('name'=>$invite['g_name']);
		echo json_encode($result);
	}
	
	function leave($p_id) {
		global $db;
		$g = $db->query_first('SELECT a.p_guild, b.g_name, b.g_leader FROM a3k_player a LEFT JOIN a3k_group b ON b.g_id = a.p_guild WHERE a.p_id = "'.$p_id.'"');
		if(empty($g['g_name'])) {
			alert('沒有所屬工會');
		}
		if($g['g_leader'] ==  $p_id) {
			$db->query('DELETE FROM a3k_group WHERE g_id = "'.$g['p_guild'].'"');
			$db->query('DELETE FROM a3k_group_message WHERE g_id = "'.$g['p_guild'].'"');
			$db->query('DELETE FROM a3k_group_invitation WHERE g_id = "'.$g['p_guild'].'"');
			$db->query('UPDATE a3k_player SET p_guild = 0 WHERE p_guild = "'.$g['p_guild'].'"');
		} else {
			$db->query('UPDATE a3k_player SET p_guild = 0 WHERE p_id = "'.$p_id.'"');
			$db->query('UPDATE a3k_group SET g_count=g_count-1 WHERE g_id = "'.$g['p_guild'].'"');
		}
		$result = array('name'=>$g['g_name']);
		echo json_encode($result);
	}
	
	function reject($p_id) {
		global $db;
		$id = intval($_POST['id']);
		$invite = $db->query_first('SELECT b.g_name FROM a3k_group_invitation a, a3k_group b WHERE a.g_id = "'.$id.'" AND a.p_id = "'.$p_id.'" AND b.g_id = a.g_id');
		if(!$invite) {
			alert('該公會沒有向您提出邀請');
		}
		$db->query('DELETE FROM a3k_group_invitation WHERE g_id = "'.$id.'" AND p_id = "'.$p_id.'"');
		$result = array('name'=>$invite['g_name']);
		echo json_encode($result);
	}
	
	function writeMessage($p_id) {
		global $db;
		$this->checkLeader($p_id);
		$p = $db->query_first('SELECT p_guild FROM a3k_player WHERE p_id = "'.$p_id.'"');
		//alert($_POST['text']);
		$text = strip_tags(trim($_POST['text']), '<strong><em><ol><ul><li><a>');
		//alert($text);
		$db->query('INSERT INTO a3k_group_message(g_id, g_message, g_writetime)VALUES("'.$p['p_guild'].'", "'.$text.'", "'.time().'")');
		$result = array();
		echo json_encode($result);
	}
	
	function writeText($p_id) {
		global $db;
		$this->checkLeader($p_id);
		$p = $db->query_first('SELECT p_guild FROM a3k_player WHERE p_id = "'.$p_id.'"');
		$text = strip_tags(trim($_POST['text']), '<strong><em><ol><ul><li><a>');
		$db->query('UPDATE a3k_group SET g_text = "'.$text.'" WHERE g_id = "'.$p['p_guild'].'"');
		$result = array();
		echo json_encode($result);
	}
}
?>