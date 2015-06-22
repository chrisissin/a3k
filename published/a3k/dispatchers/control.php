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
		// *********************** all about chat ***********************************//
		case 'blacklist':
			include_once(__ROOT__.'/controller/blacklist.class.php');
			$class = new blacklist;
			switch($act) {
				case 'add':
					$class->add($p_id);
				break;
				case 'getList':
					$class->getList($p_id);
				break;
				
				case 'removeName':
					$class->removeName($p_id);
				break;
			}
		break;
		
		case 'chat':				
			include_once(__ROOT__.'/controller/chat.class.php');
			$class = new chat;
			$class->chatlogName = $conf['chatlogName'];
			$class->listenName = $conf['listenName'];
			$class->bantextName = $conf['bantextName'];
			switch($act) {
				case 'init':
					$class->init($p_id);//
				break;
				case 'post':
					$class->post($p_id);
				break;
				case 'refresh':
					$class->refresh($p_id);
				break;
			}
		break;
		// *********************** all about chat ***********************************//
		
		// *********************** all about quest ***********************************//
			case 'quest':
			include_once(__ROOT__.'/controller/quest.class.php');
			$class = new quest;
			switch($act) {
				case 'getRequester':
					$class->getRequester($p_id);
				break;
				
				case 'getQuestList':
					$class->getQuestList($p_id);
				break;
				
				case 'getQuestDetail':
					$class->getQuestDetail($p_id);
				break;
				
				case 'acceptQuest':
					$class->acceptQuest($p_id);
				break;
				
				case 'cancelQuest':
					$class->cancelQuest($p_id);
				break;
				
				case 'reportQuest':
					$class->reportQuest($p_id);
				break;
				
				case 'getAcceptedList':
					$class->getAcceptedList($p_id);
				break;
				
				case 'getFinishedList':
					$class->getFinishedList($p_id);
				break;
			}
			// *********************** all about quest ***********************************//
		break;
	}	
	// *********************** all about wei's ***********************************//
?>