<?php
try
{
	
	if(!defined('__ROOT__')) {
		define('__ROOT__', '../');
	}
include_once("../utilities/function.php");
include_once("../utilities/global.php");	
require_once("../config/a3k_act_config.php");
	
header('Content-type: text/html; charset=utf-8');

if($_POST["what"] =="checkplayer" )// !isset($HTTP_COOKIE_VARS["a3kplayer"]) && $HTTP_COOKIE_VARS["a3kplayer"] == "") 
{	
		include_once('../controller/fight_control.php');				
		$ya = $HTTP_COOKIE_VARS["a3kplayer"];
		$x_fight = new x_fight_control();
		if($_POST["newb"])
			$newb = $_POST["newb"];
		$x_fight->checkplayer( $ya, $newb);
}
else 
{
	
	switch ($_POST["what"])
	{
		/*	拍賣交易	*/
		case "auctionsell":
			$me=$_POST['me'];
			$thing=$_POST['thing'];
			include_once('../controller/a3k_auction.php');
			$n_auction=new a3k_auction();
			$n_auction->auctionsell($me,$thing);
		break;
		/*	拍賣列表	*/
		case "getauctionlist":
			include_once('../controller/a3k_auction.php');
			$n_auction=new a3k_auction();
			$n_auction->getauctionlist();
		break;
		/*	拍賣設定	*/
		case "set_auction":
			$pack_id=$_POST['pack_id'];
			$price=$_POST['price'];
			$much=$_POST['much'];
			include_once('../controller/a3k_auction.php');
			$n_auction= new a3k_auction();
			$n_auction->set_auction($pack_id,$price,$much);
		break;
		case "deletemail":
			$dais = $_POST['daid'];
			include_once('../controller/a3k_mail.php');
			$n_fellow=new mail_class();
			$n_fellow->deletemail($daid);		
		break;				
		case "getmailcontent":
			$dais = $_POST['daid'];
			include_once('../controller/a3k_mail.php');
			$n_fellow=new mail_class();
			$n_fellow->getmailcontent($daid);		
		break;		
		case "getInbox":
			$me=$_POST['me'];		
			$from = $_POST['from'];
			$to = $_POST['to'];
			include_once('../controller/a3k_mail.php');
			$n_fellow=new mail_class();
			$n_fellow->getInbox($me,$from, $to);		
		break;			
		case "getpinfo":
			$sname = $_POST['daid'];
			include_once('../controller/a3k_plist.php');
			$n_fellow=new plist_class();
			$n_fellow->getpinfo($sname);			
		break;		
		case "getplist":
			$me=$_POST['me'];
			$sname = $_POST['sname'];
			$from = $_POST['from'];
			$to = $_POST['to'];
			include_once('../controller/a3k_plist.php');
			$n_fellow=new plist_class();
			$n_fellow->getplist($me,$sname,$from, $to);			
		break;
		case "fellowsell":
			$me=$_POST['me'];
			$who=$_POST['who'];
			include_once('../controller/a3k_fellow_sell.php');
			$n_fellow=new a3k_fellow_sell();
			$n_fellow->fellowsell($me,$who);
		break;
		//取武將資料
		case "getfellowsinfo":
			$who=$_POST['who'];
			include_once('../controller/a3k_fellow_sell.php');
			$n_fellow=new a3k_fellow_sell();
			$n_fellow->getfellowsinfo($who);
		break;
		//取武將名列表
		case "getfellowlist":
			include_once('../controller/a3k_fellow_sell.php');
			$n_fellow=new a3k_fellow_sell();
			$n_fellow->getfellowlist();
		break;
// all about mix item  start	
		case "onconfirmmix":
			$tobetraditid = $_POST['tobetraditid'];
			$me = $_POST['me'];
			if($tobetraditid)
			{		
	    	include_once('../controller/a3k_mix.php');
				$x_fight = new mix_control();			
				$x_fight->onconfirmmix($tobetraditid, $me);	
			}
		break;
		case "getMixfullInfo":
			$itid = $_POST['itid'];
			if($itid)
			{		
	    	include_once('../controller/a3k_mix.php');
				$x_fight = new mix_control();			
				$x_fight->getMixfullInfo($itid);	
			}
		break;	
		case "getMixItemInfo":
			$itid = $_POST['itid'];
			if($itid)
			{		
	    	include_once('../controller/a3k_mix.php');
				$x_fight = new mix_control();			
				$x_fight->getMixItemInfo($itid);	
			}
		break;
		case "getMixList":
	    	include_once('../controller/a3k_mix.php');
				$x_fight = new mix_control();			
				$x_fight->getMixList();	
		break;
// all about mix item  end		
// all about fellow trade start
		case "getfellow_info":
			$who = $_POST['who'];
			if($who)
			{
	    	include_once('../controller/fellow_trade_control.php');
				$x_fight = new fellow_trade_control();			
				$x_fight->getfellow_info($who);	
			}
		break;		
		case "res_onconfirmtrade":
			$tobetradflid = $_POST['tobetradflid'];
			$me = $_POST['me'];
			if($me && $tobetradflid)
			{
	    	include_once('../controller/fellow_trade_control.php');
				$x_fight = new fellow_trade_control();			
				$x_fight->res_onconfirmtrade($me , $tobetradflid);	
			}
		break;
		case "getfellow_tradeinfo":
			$fid = $_POST['fid'];
			if($fid)
			{
	    	include_once('../controller/fellow_trade_control.php');
				$x_fight = new fellow_trade_control();			
				$x_fight->getfellow_tradeinfo($fid);	
			}
		break;
    case "getfellow_tradelist":
    	include_once('../controller/fellow_trade_control.php');
			$x_fight = new fellow_trade_control();			
			$x_fight->getfellow_tradelist();	
		break;
// all about fellow trade end		
	
		// all about npclist start
    case "getNPClist":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			if($me)
			{
				$x_fight = new x_fight_control();			
				$x_fight->getNPClist($me);	
			}
		break;
// all about npclist end	
// all about brotherhood start
    case "getBroInfo":
    	include_once('../controller/a3k_brohood.class.php');
			$me = $_POST['me'];
			$from = $_POST['from'];
			$to = $_POST['to'];
			if($me)
			{
				$x_fight = new brohood_class();			
				$x_fight->getBroInfo($me, $from, $to);	
			}
		break;
// all about brotherhood end		
// all about bank start
    case "loadbalance":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			if($me)
			{
				$x_fight = new x_fight_control();			
				$x_fight->loadbalance($me);	
			}
		break;
    case "getMoneyInMe":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			if($me)
			{
				$x_fight = new x_fight_control();			
				$x_fight->getMoneyInMe($me);	
			}
		break;
    case "withdrawfrombank":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$howmuch = $_POST['howmuch'];
			if($me)
			{
				$x_fight = new x_fight_control();			
				$x_fight->withdrawfrombank($me, $howmuch);	
			}
		break;

    case "save2bank":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$howmuch = $_POST['howmuch'];			
			if($me)
			{
				$x_fight = new x_fight_control();			
				$x_fight->save2bank($me, $howmuch);	
			}
		break;
// all about bank end 		
    case "loadfightend":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			if($me)
			{
			$x_fight = new x_fight_control();			
			$x_fight->loadfightend($me);	
			}
		break;		

		case "checkplayer":
				include_once('../controller/fight_control.php');				
				$ya = $HTTP_COOKIE_VARS["a3kplayer"];
				$x_fight = new x_fight_control();
				$x_fight->checkplayer( $ya);
		break;		

		case "createcharacter":
			include_once('../controller/fight_control.php');
			$roleid = $_POST['roleid'];				
			$gender = $_POST['gender'];		
			$pname = $_POST['pname'];		
			$promocode = $_POST['promocode'];	
			$img =$_POST['img'];		
			$ya = $HTTP_COOKIE_VARS["a3kplayer"];
			$dawhere = $HTTP_COOKIE_VARS["a3kfromwher"];
				$x_fight = new x_fight_control();
				$x_fight->createplayer( $ya,$pname,$gender,$roleid, $img, $promocode,$dawhere );
		break;					
		case "gettheskillinfo":
			include_once('../controller/a3k_skill_control.php');
			$theid = $_POST['theid'];				
			if($theid)
			{
				$skillobj = new skill_class();			
				$skillobj->gettheskillinfo($theid);	
			}
		break;			
		case "listshortcut":
			include_once('../controller/a3k_shortcut_control.php');
			$me = $_POST['me'];				
			if($me)
			{
				$skillobj = new shortcut_class();			
				$skillobj->listshortcut($me);	
			}
		break;			
    case "loadquestionlist":
    	include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			if($me)
			{
			$x_fight = new x_fight_control();			
			$x_fight->loadquestionlist($me);	
			}
		break;
		case "checkReportable":
			include_once('../controller/quest.class.php');
			$me = $_POST['me'];
			if($me)
			{
			$x_quest = new quest();			
			$x_quest->checkReportable($me);	
			}
		break;
		case "clickonshortcut":
			include_once('../controller/a3k_shortcut_control.php');
			$me = $_POST['me'];				
			$blk = $_POST['blk'];	
			if($me)
			{
				$skillobj = new shortcut_class();			
				$skillobj->useshortcut($blk, $me);	
			}
		break;			
		case "shortcutskill":
			include_once('../controller/a3k_shortcut_control.php');
			$me = $_POST["me"];
			$skid = $_POST["skid"];
			$scp = $_POST["scp"];
			if($skid)
			{
				$skillobj = new shortcut_class();			
				$skillobj->shortcutskill($me, $skid, $scp);	
			}
		break;		
		case "shortcutitem":
			include_once('../controller/a3k_shortcut_control.php');
			$me = $_POST["me"];
			$skid = $_POST["itemid"];
			$scp = $_POST["scp"];
			if($itemid)
			{
				$skillobj = new shortcut_class();			
				$skillobj->shortcutitem($me, $itemid, $scp);	
			}
		break;	
		case "loadskilllist":
			include_once('../controller/a3k_skill_control.php');
			$me = $_POST['me'];			
			if($me)
			{
				$skillobj = new skill_class();			
				$skillobj->loadskilllist($me);	
			}
		break;		
		case "lossitem":
			include_once('../controller/fight_control.php');
			$itemid = $_POST['itemid'];
			$me = $_POST['me'];
			$theid = $_POST['theid'];
			$x_fight = new x_fight_control();			
			$x_fight->lossitem($theid,$itemid, $me);	
		break;
		case "eqptitem":
			include_once('../controller/fight_control.php');
			$itemid = $_POST['itemid'];
			$me = $_POST['me'];
			$theid = $_POST['theid'];
			$x_fight = new x_fight_control();			
			$x_fight->eqptitem($theid,$itemid, $me);	
		break;						
		case "gettheiteminfo":
			include_once('../controller/fight_control.php');
			$itemid = $_POST['itemid'];
			$x_fight = new x_fight_control();			
			$x_fight->gettheiteminfo( $itemid);
		break;				
		case "getPackInfo":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$type1 = $_POST['type1'];
			$x_fight = new x_fight_control();			
			$x_fight->getPackInfo( $me, $type1);
		break;		
		case "toDownTown":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->toDownTown($me);	
		break;
		case "changerole":
			include_once('../controller/fight_control.php');
			$roleid = $_POST['roleid'];
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->changerole( $roleid, $me);	
		break;
		case "getARoleInfo":
			include_once('../controller/fight_control.php');
			$roleid = $_POST['roleid'];
			$x_fight = new x_fight_control();
			$x_fight->getARoleInfo( $roleid);
		break;
		case "getAllRoleTree":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->getAllRoleTree( $me);	
		break;
		case "getFullInfo": 
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->getFullInfo( $me);	
		break;
		case "geteqptInfo":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->geteqptInfo( $me);	
		break;
		case "getMoneyInfo":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->getMoneyInfo( $me);	
		break;
    case "getprimeInfo": 
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->getprimeInfo( $me);	
		break;
		case "moveme2citi":
			include_once('../controller/fight_control.php');
			$citi = $_POST['citi'];
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->moveme2citi($citi, $me);	
		break;
		case "loadimat":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->loadimat($me);	
		break;
		case "loadciti":
			include_once('../controller/fight_control.php');
			$state = $_POST['state'];
			$x_fight = new x_fight_control();
			$x_fight->loadciti($state);
		break;
		case "fight_init":
			include_once('../controller/fight_control.php');
			$fkind = $_POST['fkind'];
			$attacker = $_POST['me'];
			$defencer = $_POST['defencer'];
			if (strlen($attacker) > 0 ) // do nothing if no input
			{
					$x_fight = new x_fight_control();
			    $x_fight->fight_init($attacker , $defencer, $fkind);
			}
		break;
		case "fight":		
			include_once('../controller/fight_control.php');
			//echo $_POST['m_id'];
			if (isset($_POST['p_id'])   )
			{
					$fkind = $_POST['fkind'];
					$p_id = $_POST['p_id'];
					$pf_id = $_POST['pf_id'];
					$m_id = $_POST['m_id'];
					$mf_id = $_POST['mf_id'];
					$p_hp = $_POST['p_hp'];
					$pf_hp = $_POST['pf_hp'];
					$m_hp = $_POST['m_hp'];
					$mf_hp = $_POST['mf_hp'];
					$p_mn = $_POST['p_mn'];
					$pf_mn = $_POST['pf_mn'];
					$m_mn = $_POST['m_mn'];
					$mf_mn = $_POST['mf_mn'];								
					//todo use json or xml
					$transary = array (
							"fkind" => $fkind,
							"p_id" => $p_id,
							"pf_id" => $pf_id,
							"m_id" => $m_id,
							"mf_id" => $mf_id,
							"p_hp" => $p_hp,
							"pf_hp" => $pf_hp,
							"m_hp" => $m_hp,
							"mf_hp" => $mf_hp,
							"p_mn" => $p_mn,
							"pf_mn" => $pf_mn,
							"m_mn" => $m_mn,
							"mf_mn" => $mf_mn
							);
			    $x_fight = new x_fight_control();
			    $x_fight->fight_check($transary );
			    							
			}else{// do nothing if no input
			}
		break;		
		case "heal":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->heal($me);
		break;
		case "expcount":
			include_once('../controller/fight_control.php');
			$me=$_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->expcount($me);
		break;
		case "newbaward":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->newbaward($me);
		break;
		case "newbaward2":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->newbaward2($me);
		break;
		case "newbaward3":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->newbaward3($me);
		break;
		case "newbaward4":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->newbaward4($me);
		break;
		case "gohome":
			include_once('../controller/fight_control.php');
			$me = $_POST['me'];
			$x_fight = new x_fight_control();
			$x_fight->gohome($me);
		break;
		//-----------fellowinfo------------
		case "getfellowinfo":
			include_once('../controller/a3k_fellow_control.php');
			$fellowid = $_POST['fellowid'];
			if($fellowid)
			{
				$fellowobj = new fellow_class();			
				$fellowobj->getfellowinfo($fellowid);	
       // $fellowobj->display_fellow_body($fellowid);
			}
		break;	
		case "loadfellowlist":
			include_once('../controller/a3k_fellow_control.php');
			$me = $_POST['me'];
			if($me)
			{
				$fellowobj = new fellow_class();			
				$fellowobj->loadfellowlist($me);	
			}
		break;
    
		case "equipfellow":
			include_once('../controller/a3k_fellow_control.php');
			$flid = $_POST['flid'];
			$me = $_POST['me'];
      if ($flid){
				$fellowobj = new fellow_class();			
				$fellowobj->equipfellow($flid,$me);
        }
		break;	
		//-----------end of fellowinfo----------
		//-----------shop dispatch--------------
		case "getshopInfo":
			include_once('../controller/a3k_shop_control.php');
			$me = $_POST['me'];
			$type1 = $_POST['type1'];
			$x_shop = new x_shop_control();			
			$x_shop->getshopInfo( $me, $type1);
		break;

		case "buyitem":
			include_once('../controller/a3k_shop_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_shop = new x_shop_control();			
			$x_shop->buyitem($theid,$itemid);	
		break;	
		
		case "sellitem":
			include_once('../controller/a3k_shop_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_shop = new x_shop_control();			
			$x_shop->sellitem($theid,$itemid);	
		break;
		//-----------end of shop dispatch-------
		//-----------store dispatch-------------
				case "getstoreInfo":
			include_once('../controller/a3k_store_control.php');
			$x_store = new x_store_control();			
			$x_store->getstoreInfo();
		break;
	
		case "buystoreitem":
			include_once('../controller/a3k_store_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_store = new x_store_control();			
			$x_store->buystoreitem($theid,$itemid);	
		break;	
		case "getSpecialPackInfo":
			include_once('../controller/a3k_store_control.php');
			$me = $_POST['me'];
			$x_store = new x_store_control();				
			$x_store->getSpecialPackInfo($me);
		break;
		case "usespecialitem":
			include_once('../controller/a3k_store_control.php');
			$me = $_POST['me'];
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_store = new x_store_control();				
			$x_store->usespecialitem($me,$theid,$itemid);	
		break;
		//-----------end of store dispatch------
		default:
			break;
	}
	
	$f = $_POST['f'];
	$act = $_POST['act'];
	$p_id =  $_POST['me'];
	$im =  $_POST['im'];//for chat refresh request.. to avoid log user time too much
	/*if(!$p_id || !$im) {
		exit;
		//$act = 'init';
	}
*/
	// *********************** all about wei's ***********************************//
	switch($f) 
	{
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
					include_once('../controller/fight_control.php');				
					$ya = $HTTP_COOKIE_VARS["a3kplayer"];
					$x_fight = new x_fight_control();
					if($x_fight->getppout( $ya,$im))
						$class->refresh($im);
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
	

}
		
	
}catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
?>