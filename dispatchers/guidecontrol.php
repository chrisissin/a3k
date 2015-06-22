<?php
	if(!defined('__ROOT__')) {
		define('__ROOT__', '../');
	}
	//session_start();
	
	include_once(__ROOT__.'utilities/init.inc.php');
	
	$f = $_POST['f'];
	$act = $_POST['act'];
	$p_id =  $_POST['me'];//$_SESSION['p_id']; //$_POST['me'];
	
	if(!$p_id) {
		exit;
		//$act = 'init';
	}
	// *********************** all about wei's ***********************************//
	switch($f) {
		// *********************** all about chat ***********************************/
		case 'group':
			include_once(__ROOT__.'/controller/group.class.php');
			$class = new group;
			switch($act) {
				case 'checkGroup':
					$class->checkGroup($p_id);
				break;
				case 'checkPower':
					$class->checkPower($p_id);
				break;
				
				case 'create':
					$class->create($p_id);
				break;
				
				case 'fire':
					$class->fire($p_id);
				break;
				
				case 'getInvitation':
					$class->getInvitation($p_id);
				break;
				case 'getMessage':
					$class->getMessage($p_id);
				break;
				
				case 'getMember':
					$class->getMember($p_id);
				break;
				
				case 'getText':
					$class->getText($p_id);
				break;
				
				case 'invite':
					$class->invite($p_id);
				break;
				
				case 'join':
					$class->join($p_id);
				break;
				
				case 'leave':
					$class->leave($p_id);
				break;
				
				case 'reject':
					$class->reject($p_id);
				break;
				case 'writeMessage':
					$class->writeMessage($p_id);
				break;
				case 'writeText':
					$class->writeText($p_id);
				break;
			}
		break;
	}	
	// *********************** all about wei's ***********************************//
?>