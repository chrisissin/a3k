<?php
class blacklist {
	function add($p_id) {
		global $db;
		$name = htmlspecialchars(strip_tags(trim($_POST['name'])));
		$result = array();
		if(empty($name)) {
			$result['error'] = '錯誤的名稱';
		}
		$p = $db->query_first('SELECT a.p_blacklist, b.p_id FROM a3k_player a, a3k_player b WHERE a.p_id = \''.$p_id.'\' AND b.p_name = \''.$name.'\'');
		if(!$p) {
			$result['error'] = '使用者不存在';
		}
		if($p['p_id'] == $p_id) {
			$result['error'] = '不能將自己加入黑名單';
		}
		$list = empty($p['p_blacklist'])? array() : explode(',', $p['p_blacklist']);
		if(in_array($p['p_id'], $list)) {
			$result['error'] = $name.'已在黑名單內';
		}
		if(!$result['error']) {
			$list[] = $p['p_id'];
			$list = implode(',', $list);
			$db->query('UPDATE a3k_player SET p_blacklist = \''.$list.'\' WHERE p_id = \''.$p_id.'\'');
			$result = array('id'=>$p['p_id'],  'name'=>$name);
		}
		echo json_encode($result);
	}
	
	function getList($p_id) {
		global $db;
		$user = $db->query_first('SELECT p_blacklist FROM a3k_player WHERE p_id = "'.$p_id.'"');
		$nameList = array();
		if($user['p_blacklist']) {
			$query = $db->query('SELECT p_id, p_name FROM a3k_player WHERE p_id in ('.$user['p_blacklist'].')');
			while($d = $db->fetch_array($query)) {
				$nameList[] = $d['p_id'].','.$d['p_name'];
			}
		}
		$result = array(
			'list'=>implode(';', $nameList)
		);
		echo json_encode($result);
	}
	
	function removeName($p_id) {
		global $db;
		$result = array();
		$name = htmlspecialchars(strip_tags(trim($_POST['name'])));
		if(empty($name)) {
			$result['error'] = '對象不存在';
		}
		$user = $db->query_first('SELECT a.p_blacklist, b.p_id FROM a3k_player a,a3k_player b WHERE a.p_id = "'.$p_id.'" AND b.p_name = "'.$name.'"');
		if(!$user) {
			$result['error'] = '對象不存在';
		}
		$list = explode(',', $user['p_blacklist']);
		if(!in_array($user['p_id'], $list)) {
			$result['error'] = '對象不在黑名單中';
		}
		if(!$result['error']) {
			unset($list[array_search($user['p_id'], $list)]);
			$list = implode(',', $list);
			$db->query('UPDATE a3k_player SET p_blacklist = "'.$list.'" WHERE p_id = "'.$p_id.'"');
			$result['success'] = true;
		}
		echo json_encode($result);
	}
}
?>