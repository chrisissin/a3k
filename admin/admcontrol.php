<?php
if(!defined('__ROOT__')) {
	define('__ROOT__', '../');
}

session_start();
include_once(__ROOT__.'utilities/init.inc.php');
$f = $_POST['f'];
$act = $_POST['act'];
$p_id = $_SESSION['adm_id'];
if(!$p_id) {
	$act = 'init';
}
switch($f) {
	case 'adm':
		include_once(__ROOT__.'admin/class/adm.class.php');
		$class = new adm;
		switch($act) {
			case 'init':
				$class->init($p_id);
			break;
		}
	break;
	
	case 'chat':
		include_once(__ROOT__.'controller/chat.class.php');
		$class = new chat;
		$class->chatlogName = $conf['chatlogName'];
		$class->listenName = $conf['listenName'];
		$class->bantextName = $conf['bantextName'];
		switch($act) {
			case 'systemMsg':
				$class->writeSystemMsg(htmlspecialchars(strip_tags(trim($_POST['msg']))));
				$result = array();
				echo json_encode($result);
			break;
		}
	break;
	
	case 'listen':
		include_once(__ROOT__.'admin/class/listen.class.php');
		$class = new _listen;
		$class->listenName = $conf['listenName'];
		$class->listenlogName = $conf['listenlogName'];
		switch($act) {
			case 'add':
				$class->add($p_id);
			break;
			
			case 'getText':
				$class->getText($p_id);
			break;
			
			case 'init':
				$class->init($p_id);
			break;
			
			case 'remove':
				$class->remove($p_id);
			break;
		}
	break;
	
	case 'quest':
		include_once(__ROOT__.'admin/class/quest.class.php');
		$class = new quest;
		switch($act) {
			case 'add':
				$class->add($p_id);
			break;
			
			case 'alive':
				$class->alive($p_id);
			break;
			
			case 'edit':
				$class->edit($p_id);
			break;
			
			case 'getDetail':
				$class->getDetail($p_id);
			break;
			
			case 'getList':
				$class->getList($p_id);
			break;
			
			case 'remove':
				$class->remove($p_id);
			break;
		}
	break;
}
?>