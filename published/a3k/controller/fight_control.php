<?PHP





class x_fight_control
{
	

	
	
      function getNPClist($me){
      		global $DB_site;
	       	$npclist = $DB_site->query("SELECT m.p_id, m.p_name
FROM a3k_monster AS m, a3k_player AS p
WHERE p.p_id =".$me." 
AND m.p_map = p.p_map ");
				while($rows =$DB_site->fetch_array($npclist))
				{
					$thelist[]=$rows ;
				}
					echo (json_encode($thelist));
      }

// all about bank start
      function getMoneyInMe($me){
      		global $DB_site;
	       	$MoneyInfo = $DB_site->query_first("SELECT p_money FROM `a3k_player`  where p_id= ".$me." ");
      		//echo "<script language=\"JavaScript\" >disp_money(".json_encode($MoneyInfo).");</script>";
					echo (json_encode($MoneyInfo['p_money']));
      }
	function loadbalance($me)
	{											
		try
		{		
				global $DB_site;
				$res = $DB_site->query_first("select p_bank from a3k_player WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
				
				echo $res['p_bank'];
		}catch (Exception $e) {
		    //echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	function withdrawfrombank($me, $howmuch)
	{											
		try
		{		
				global $DB_site;
				$res = $DB_site->query_first("select p_bank from a3k_player WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
				if($res['p_bank'] < $howmuch)
					echo json_encode("金額不足");
				else
					{
								$DB_site->query("UPDATE `a3k_player` SET `p_money` = `p_money` +  ".$howmuch." WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
								$DB_site->query("UPDATE `a3k_player` SET `p_bank` = `p_bank` -  ".$howmuch." WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
								echo json_encode("OK");
					}
						
		}catch (Exception $e) {
		    //echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	function save2bank($me, $howmuch)
	{			
				try
		{										
				global $DB_site;
				$res = $DB_site->query_first("select p_money, p_bank from a3k_player WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
				
				if($res['p_bank'] >= 10000000) //存款上限：1000萬
					  {
					  	echo json_encode("金額超出");
					  }else{
						if($res['p_money'] < $howmuch)
						{
							echo json_encode("金額不足");
						}
						else
							{
								$DB_site->query("UPDATE `a3k_player` SET `p_money` = `p_money` -  ".$howmuch." WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
								$DB_site->query("UPDATE `a3k_player` SET `p_bank` = `p_bank` +  ".$howmuch." WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
								echo json_encode("OK");
							}
				}
						}catch (Exception $e) {
		    //echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}	
// all about bank end

	function logmylastactiontime($me)
	{											
		try
		{		
				global $DB_site;
				$DB_site->query("UPDATE `a3k_player` SET `p_act_time` = CURRENT_TIMESTAMP() WHERE `a3k_player`.`p_id` ='".$me."' LIMIT 1 ;");
		}catch (Exception $e) {
		    //echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
		
//@display question
	function loadquestionlist($me)
	{											
		try
		{		
			/*0330 liao */
		  	include_once("../controller/quest.class.php");		
				$a3k_quest_class = new quest;
				$a3k_quest_class->checkReportable($me);
			//0330 liao	
				global $DB_site;
				//$questlist = $DB_site->query(" SELECT q_title,q_id,q_status
          //            FROM `a3k_quest` WHERE q_id IN (select q_id FROM `a3k_quest_status` WHERE p_id='".$me."' AND (q_status=1 OR q_status=2)) ");
				//liao 0330
				$questlist = $DB_site->query("SELECT q.q_title,q.q_id,s.q_status
                      FROM a3k_quest as q , a3k_quest_status as s WHERE s.p_id ='".$me."' AND s.q_status!=-1 AND s.q_id=q.q_id");
				while($rows =$DB_site->fetch_array($questlist))
				{
					$newarray[]=$rows ;
				}
      
				//echo("<script language=\"JavaScript\" >display_question_list(".json_encode($newarray).");</script>");
				echo (json_encode($newarray));

		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
  

	//****************** all about fight *****************//		
	function fight_check($transary )
	{											
include_once("../config/a3k_act_config.php");
include_once("../controller/a3k_fight_select_x.php");		
				$a3k_act_class = new a3k_fight_select;
				$a3k_act_class->fight_npc($transary);
					
				unset($a3kclass);
				unset($a3k_act_class);

	}
	
	function fight_init($attacker, $defencer, $fkind)
	{
include_once("../config/a3k_act_config.php");
		global $a3k_config, $DB_site;
		
		if( $a3k_config["enable_capt"]== 1 &&  $a3k_config["capt_chance"] > rand(1, 100))
		{
			$DB_site->query("update a3k_player set p_capt_attempts = p_capt_attempts + 1 where p_id ='".$attacker."'");
			echo "<script>invocapt();</script>";
		}
		else
		{
					include_once("../controller/a3k_fight_select_x.php");				
					$a3k_act_class = new a3k_fight_select;
					
					$a3k_act_class->fight_npc_init($attacker, $defencer , $fkind);
					
					unset($a3kclass);
					unset($a3k_act_class);			
		}
	}
	
	function updateFightTimeNStatus($userid, $curHP, $curMn)
	{
		global $DB_site;
		$storedJSONAry = array ( "hp" => $curHP , 
		"mn" => $curMn);
		// todo check qurery think about data field timestamp vs integer
		$DB_site->query("update a3k_player set p_fight_time = TIMESTAMP() , p_fight_status = '". json_encode($storedJSONAry)."' where p_id = ".$userid);

	}
	
	//****************** all about fight *****************//
		
	//****************** all about heal *****************//
	function heal($me)
	{
		global $DB_site;
		$daplayer = $DB_site->query_first("select p_lv, p_money, pf_id, p_id from a3k_player where p_id = ".$me);
		$healcost = 	(($daplayer[p_lv] - 16)*2)+12;
		//(玩家等級 – 36)*(3)+20
		//(玩家等級 – 10)*(5)+20  [edited 20090720]
		//(玩家等級 – 14)*(5)+20  [edited 20090721]
		// (玩家等級 – 16)*(2)+12 [edited 20090818]
		if($healcost <= 0) $healcost =0; //算出來的數值為負數時，不對玩家收費
		if($healcost > $daplayer[p_money])
		{
				echo "金錢不足無法住宿,需要 ".($healcost)." 金錢";
		}else		{
			$DB_site->query("update a3k_player  set p_hp = p_hpmax, p_mn = p_mnmax , p_money = ".($daplayer[p_money]-$healcost )." where p_id= ".$me);
			if($daplayer[pf_id])
				$DB_site->query("update a3k_fellow  set p_hp = p_hpmax, p_mn = p_mnmax  where p_id = ".$daplayer[pf_id]);
		//echo "0";
		//	echo "<script language=\"JavaScript\" >setTimeout('sleepmsg(".json_encode($healcost).")', 1000);</script>";	
		//	echo(json_encode("住宿完成,花了 ".($healcost)." 金錢"));
			echo "住宿完成,花了 ".($healcost)." 金錢";
		}
	
	}
	//****************** all about heal *****************//	
	
	
	//****************** all about map *****************//	
	function loadciti($state)
	{
		
		global $DB_site;
		$daCiti = $DB_site->query("select map_id, map_city_name from a3k_map where map_state_name ='".$state."'");
		while($rows =$DB_site->fetch_array($daCiti))
		{
			$newarray[]=$rows ;
		}  
		//echo "<script language=\"JavaScript\" >loadcities_back(".json_encode($newarray).");</script>";
			echo json_encode($newarray);
 
	}
	function loadimat($me)
	{
			global $DB_site;
			$daMap = $DB_site->query_first("select  m.map_state_name, m.map_city_name, m.map_id, m.map_html, m.map_img , p.p_id from a3k_map as m , a3k_player as p where p.p_id = ".$me." and p.p_map = m.map_id");
			//圖檔名(多個) (rand)
			$tm_mfary= explode("`", $daMap[map_img]);
			$rand_key = array_rand($tm_mfary, 1);
			$daMap[map_img] = $tm_mfary[$rand_key];		
			
			//echo "<script language=\"JavaScript\" >showimat(".json_encode($daMap).");</script>";
			echo (json_encode($daMap));
			unset($daMap);
			unset($tm_mfary);
			unset($rand_key);
			
			
	}
	function moveme2citi($citi, $me)
	{
		global $DB_site;
		$sql = "";
		$daMap = $DB_site->query_first("select id from a3k_map where map_id = '".$citi."' ");	

      if($daMap)
      {
      	//圖檔名(多個) (rand)
      	$DB_site->query("update a3k_player set p_map = '".$citi."' where p_id=".$me);      
      	$daMap = $DB_site->query_first("select  m.map_state_name, m.map_city_name, m.map_id, m.map_html, m.map_img , m.map_control , p.p_id from a3k_map as m , a3k_player as p where p.p_id = ".$me." and p.p_map = m.map_id");
				$tm_mfary= explode("`", $daMap[map_img]);
				$rand_key = array_rand($tm_mfary, 1);
				$daMap[map_img] = $tm_mfary[$rand_key];      	
	      
	      //echo "<script language=\"JavaScript\" >notifyactionresult('移動到'+\"".$daMap[map_state_name]."\"+' '+\"".$daMap[map_city_name]."\");</script>";      
	      echo "mapmovemsg('".$daMap[map_state_name]." ".$daMap[map_city_name]."');";      
				if($daMap[map_html] != null && $daMap[map_control] != 0  )
				{
					echo "loadmaindiv(\"".$daMap[map_html]."\");";
					//echo "<script language=\"JavaScript\" >showimat(".json_encode($daMap).");</script>";
				}else{
					//echo "<script language=\"JavaScript\" >showimat(".json_encode($daMap).");</script>";
					echo "showimat(".json_encode($daMap).");";
				}      
    	}else{
    		echo "notifyactionresult('錯誤');";      
    	}

			unset($daMap);
			unset($tm_mfary);
			unset($rand_key);
				
	}
	//****************** all about map *****************//	



	//****************** all about player_info *****************//	
	function getFullInfo($me)
	{
		
		global $DB_site;
		$daPlayerShit = $DB_site->query_first(" SELECT p.p_img, p.p_name, p.p_lv, p.p_rankname, p.p_exp, p.p_nextexp, p.p_map, p.p_win, p.p_lost, p.p_money, p.p_hp, p.p_mn, p.p_hpmax, p.p_mnmax, p.p_str, p.p_smart, p.p_agl, p.p_vit, p.p_bone, p.p_at, p.p_df, p.pf_id, p.role_id, p.p_hpmax, p.p_mnmax, m.map_state_name, m.map_city_name, r.role_id, r.role_name, g.g_name, s.role_skillpointmax, s.skill_point
FROM `a3k`.`a3k_player` AS p
LEFT JOIN a3k_group g ON g.g_id = p.p_guild
LEFT JOIN a3k_skill s ON s.user_id = p.p_id
AND s.role_id = p.role_id, `a3k`.`a3k_map` AS m, `a3k`.`a3k_role` AS r
WHERE p.p_id = '".$me."'
AND p.p_map = m.map_id
AND p.role_id = r.role_id
LIMIT 1   ");

$dafellowshit = $DB_site->query_first("SELECT 
 f.p_name as pf_name , f.p_lv as pf_lv , f.p_img as pf_img
 FROM `a3k`.`a3k_player` as p , `a3k`.`a3k_fellow` as f  where p.p_id= ".$me." and p.pf_id = f.p_id  ");
    if($dafellowshit)
    {
    	$daPlayerShit['pf_name'] = $dafellowshit['pf_name'];
    	$daPlayerShit['pf_lv'] = $dafellowshit['pf_lv'];
    	$daPlayerShit['pf_img'] = $dafellowshit['pf_img'];
    }
    
    echo (json_encode($daPlayerShit));
    
    //$this->geteqptInfo($me);
 
	}
  
  
function getprimeInfo($me)
	{
		global $DB_site;
		$primeinfo = $DB_site->query_first("SELECT p.p_img, p.p_r_money, p.p_exp, p.p_name, p.p_lv, p.p_rankname, p.p_money, r.role_name, g.g_name
FROM `a3k_player` AS p
LEFT JOIN a3k_group g ON g.g_id = p.p_guild, `a3k`.`a3k_role` AS r where p.role_id = r.role_id and p.p_id= ".$me."  ");
	
   echo(json_encode($primeinfo));

	}
  
  
  
  //@@@@@@@@@@@@@@@all about player equipment@@@@@@@@@@@@@@
  
  function geteqptInfo($me)
	{
		global $DB_site;
		$eqpt = $DB_site->query("SELECT item_name,item_type2
                FROM `a3k_items` where item_id IN (select item_id from `a3k_player_item` where p_id=".$me." and item_eq=1) ");  
    while($rows =$DB_site->fetch_array($eqpt))
				{
					$newarray[]=$rows ;
				}
		echo (json_encode($newarray));
	}
  
  
  
	//****************** all about player_info *****************//	



	//****************** all about role_info *****************//	


	function getAllRoleTree($me)
	{
// ----- due to the lack of usage of the code, thus do not constrct tree info at server
		global $DB_site;
		$myshit = $DB_site->query_first("SELECT p.role_id, p.p_lv, p.p_str, p.p_smart, p.p_agl, p.p_vit, p.p_bone, 
	r.role_id, r.role_name, r.role_skillpointmax, r.role_parentid, r.role_lmt_lvl, r.role_lmt_str, r.role_lmt_bone,
	r.role_lmt_agl, r.role_lmt_smart, r.role_lmt_vit, r.role_skillname, r.role_descri, r.role_theegg, r.role_parentname, r.role_skillimg
 FROM a3k_player as p , a3k_role as r where p.p_id= ".$me." and p.role_id = r.role_id");
		$roletree = $DB_site->query("SELECT  r.role_id, r.role_name, 
		 r.role_parentid, r.role_lmt_lvl, r.role_lmt_str, r.role_lmt_bone, r.role_lmt_agl, r.role_lmt_smart, 
		 r.role_lmt_vit, r.role_descri, r.role_skillname, r.role_img	
 FROM a3k_role as r where r.role_theegg like '%".$myshit[role_theegg]."%' ");
 
		while($rows =$DB_site->fetch_array($roletree))
		{// -- decide if the player can change to the role or not
			if($myshit[p_str] >= $rows[role_lmt_str] 
			&& $myshit[p_smart] >= $rows[role_lmt_smart] 
			&& $myshit[p_agl] >= $rows[role_lmt_agl] 
			&& $myshit[p_vit] >= $rows[role_lmt_vit] 
			&& $myshit[p_bone] >= $rows[role_lmt_bone] 
			&& $myshit[p_lv] >= $rows[role_lmt_lvl] )
			{// alow to click
				$rows[abc] = "cnn";
			}
			$newarray[]=$rows ;
		}
		 
		 $finalout = array(
		 		"myrole"=> $myshit ,
			 "mytree"=> $newarray
		 );
		 echo (json_encode($finalout));
		 //echo("<script>getRoldInfo_back(".json_encode($finalout).");</script>");
		 //print_r($finalout);
 
	}
	
	function getARoleInfo($roleid)
	{
		global $DB_site;
		$myshit = $DB_site->query_first("SELECT 
	r.role_id, r.role_name, r.role_skillpointmax, r.role_parentid, r.role_lmt_lvl, r.role_lmt_str, r.role_lmt_bone,
	r.role_lmt_agl, r.role_lmt_smart, r.role_lmt_vit, r.role_skillname, r.role_descri, r.role_theegg, r.role_parentname, r.role_skillimg
 FROM a3k_role as r where r.role_id= '".$roleid."' " );

			 echo (json_encode($myshit));
			 //echo("<script>display_arole_desc(".json_encode($myshit).");</script>");
		 //print_r($finalout);
 
 	}
	
	function changerole( $roleid, $me)
	{
		/*
有父系職業的職業必須在父系職業熟練度100%之後，加上該職業本身的等級與屬性限制均符合的情況之下才能轉職
每個職業熟練度到達100%時會給一個職業專屬技能		
		*/
		global $DB_site;
		$myshit = $DB_site->query_first("SELECT p.role_id, p.p_lv, p.p_str, p.p_smart, p.p_agl, p.p_vit, p.p_bone, 
		r.role_id, r.role_name, r.role_skillpointmax, r.role_parentid, r.role_lmt_lvl, r.role_lmt_str, r.role_lmt_bone,
		r.role_lmt_agl, r.role_lmt_smart, r.role_lmt_vit, r.role_skillname, r.role_descri, r.role_theegg, r.role_parentname, r.role_skillimg
 		FROM a3k_player as p , a3k_role as r where p.p_id= ".$me." and  r.role_id = '".$roleid."' ");
 		if($myshit[p_str] >= $rows[role_lmt_str] 
			&& $myshit[p_smart] >= $rows[role_lmt_smart] 
			&& $myshit[p_agl] >= $rows[role_lmt_agl] 
			&& $myshit[p_vit] >= $rows[role_lmt_vit] 
			&& $myshit[p_bone] >= $rows[role_lmt_bone] 
			&& $myshit[p_lv] >= $rows[role_lmt_lvl] )
			{// -- alow to change role
				// -- todo insert skill here if not already there
				$DB_site->query("update a3k_player set role_id = '".$roleid."' where p_id=".$me);
				
	include_once("../controller/a3k_skill_control.php");							
	$a3k_skill = new skill_class;
	$gotskill = $a3k_skill->addSkillToPlayer($me, $roleid);				
				echo ("<script>getARoleInfo('".$roleid."');notifyactionresult('轉職成功');</script>");
			}
			else
			{
				echo ("<script>notifyactionresult('不能轉職');</script>");
			}

 		
	}
	
	
			//****************** all about role_info *****************//	
			
			//****************** all about downtown *****************//				
			function toDownTown($me)
			{	
						global $DB_site;
						$myshit = $DB_site->query_first("SELECT m.map_id, m.map_state_name FROM a3k_player as p , a3k_map as m where p.p_id = '".$me."' and p.p_map = m.map_id   ");
						$damap = $DB_site->query_first("SELECT m.map_id, m.map_state_name, m.map_html, m.map_control FROM a3k_map as m where m.map_state_name = '".$myshit[map_state_name]."' and m.map_control ='1'");
				 		$dthtml = $damap[map_html];

						$DB_site->query("update a3k_player set p_map = '".$damap[map_id]."' where p_id=".$me);
				 		if($dthtml== null)
				 			$dthtml = "city.html";
				 		echo "loadmaindiv(\"".$dthtml."\");";
				 		

			}
			//****************** all about downtown *****************//				
			
			//****************** all about pack *****************//				
			function getPackInfo($me, $type1)
			{
						global $DB_site;
						$myshit = $DB_site->query("
						SELECT pi.id, i.item_img, i.item_name, pi.item_stacknum, pi.item_eq, pi.item_id FROM a3k_player_item as pi , a3k_items as i WHERE i.item_type1 
						= '".$type1."' and pi.p_id = '".$me."' and pi.item_id = i.item_id");
					  
					  while($rows =$DB_site->fetch_array($myshit))
						{
							$newarray[]=$rows ;
						}
					 
            echo (json_encode($newarray));
						//echo("<script language=\"JavaScript\" >display_pack(".json_encode($newarray).");</script>");
				 		//print_r($newarray);
            
             //$this->getMoneyInfo($me);
            
            
				 		

				 		unset($myshit);
				 		unset($newarray);
			}
			
			function gettheiteminfo($itemid) 
			{
					global $DB_site;
					$myshit = $DB_site->query_first("SELECT `id`,`item_type1`,`item_type2`,`item_price`, `item_r_price`,`item_id`, `item_name`, `item_ef_at`, `item_ef_df`, `item_ef_str`, `item_ef_bone`, `item_ef_vit`, `item_ef_agl`, `item_ef_smart`, `item_ef_hp`, `item_ef_mn` , item_desc
					FROM `a3k_items` 
					where item_id = '".$itemid."' " );
					
				// echo("<script>disp_singleitem(".json_encode($myshit).");</script>");
			 		echo (json_encode($myshit));
			 //print_r($finalout);
		
					unset($myshit);				
			}
			
			function eqptitem($theid, $itemid, $me) 
			{
							
					global $DB_site;
					$myshit = $DB_site->query_first("SELECT p_id FROM a3k_player_item where p_id ='".$me."'  and item_id = '".$itemid."' " );
					if($myshit)// --  check if the user has this item or not		
					{
						// -- pass to a3k_pack
						include_once("../controller/a3k_pack.php");							
						$a3k_pack = new a3k_pack;
						if($a3k_pack->init($theid,$itemid, $me)) // -- operation 
						{
							echo "<script>notifyactionresult('完成');</script>";		
						}else
						{
							echo  "<script>notifyactionresult('錯誤');</script>";		
						}
					}else{
									 echo("<script>notifyactionresult('錯誤');</script>");
					}

		
					unset($myshit);								
			}		
			
			function lossitem($theid, $itemid, $me) 
			{
							
					global $DB_site;
					$myshit = $DB_site->query_first("SELECT p_id FROM a3k_player_item where p_id ='".$me."'  and item_id = '".$itemid."' and id = '".$theid."' " );
					if($myshit)// --  check if the user has this item or not		
					{
						// -- pass to a3k_pack
						include_once("../controller/a3k_pack.php");							
						$a3k_pack = new a3k_pack;
						if($a3k_pack->lossitem($theid)) // -- operation 
						{
							echo "<script>notifyactionresult('丟棄成功');</script>";		
						}else
						{
							echo  "<script>notifyactionresult('錯誤');</script>";		
						}
					}else{
									 echo("<script>notifyactionresult('錯誤');</script>");
					}

	
					unset($myshit);								
			}		
      
      function getMoneyInfo($me){
      		global $DB_site;
	       	$MoneyInfo = $DB_site->query_first("SELECT p_money,p_r_money FROM `a3k_player`  where p_id= ".$me." ");
      		//echo "<script language=\"JavaScript\" >disp_money(".json_encode($MoneyInfo).");</script>";
					echo (json_encode($MoneyInfo));
        
      }
      
			//****************** all about pack *****************//				
			
      
function expcount($me){
	global $DB_site;
	$expinfo=$DB_site->query_first("SELECT p_exp,p_nextexp FROM a3k_player WHERE p_id=".$me." ");
	
		if ($expinfo){
			while (($expinfo[p_exp] > $expinfo[p_nextexp])||($expinfo[p_exp] == $expinfo[p_nextexp]))
				{
					$expinfo[p_exp]=$expinfo[p_exp]-$expinfo[p_nextexp];
					$sql="UPDATE `a3k_player` SET  p_exp =   ".$expinfo[p_exp] ." WHERE `p_id` = ".$me." LIMIT 1 ";
					$DB_site->query($sql);
					$Pinfo="SELECT * FROM `a3k_player` WHERE `p_id`= '".$me."' LIMIT 1 ";
					$player=$DB_site->query_first($Pinfo);
				  //$player[p_exp]=$expinfo[p_exp];
				  include_once('../controller/a3k_fight_select_x.php');
					$S_fight = new a3k_fight_select();
					$S_fight->LvlUp($player);	
					}
			}
}
  

        

      

function createplayer($ya, $pname,$gender, $roleid , $img, $promocode, $dawhere) 
{ 
	if(!$ya||$ya=='null')
	{
		$outmsg = array( 
		"msg" => "請由官網登入",
		"code" => -1
		);		
		echo (json_encode($outmsg));
		return;
	}
	
	if(!$this->checkplayer_atcreate($ya))
	{
		global $DB_site;
	 	$eed =$DB_site->query_first("SELECT p_name FROM a3k_player WHERE p_name = '".$pname."' ");

		if ($eed){//名子不能重複
			$outmsg = array( 
			"msg" => "有人用過這個名子了",
			"code" => -2
			);
		
			echo (json_encode($outmsg));
			return;			
		}
		
      $pid="SELECT MAX(p_id) FROM `a3k_player`";
      $newpid=$DB_site->query_first($pid);
      $newpid[0]++;
      			
			$sql =
			"
 INSERT INTO `a3k`.`a3k_player`(
`p_id` ,
`p_name` ,
`p_at` ,
`p_df` ,
`p_str` ,
`p_vit` ,
`p_smart` ,
`p_agl` ,
`p_hp` ,
`p_hpmax` ,
`role_id` ,
`p_money` ,
`p_lv` ,
`p_exp` ,
`p_nextexp` ,
`p_win` ,
`p_lost` ,
`p_sex` ,
`p_img` ,
`p_act_time` ,
`p_createdate` ,
`p_map` ,
`p_bank` ,
`f_1001ya` ,
`p_mn` ,
`p_mnmax` ,
`pf_id` ,
`p_rankname` ,
`p_bone` ,
`p_fight_time` ,
`p_guild` ,
`p_team` ,
`p_blacklist` ,
`p_packsize_1` ,
`p_packsize_2` ,
`p_packsize_3` ,
`p_packsize_4` ,
`p_learn` ,
`p_r_money` ,
`promo_code` 
)
VALUES (
'".$newpid[0]."' , '".$pname."', '20', '20', '10', '10', '10', '10', '50', '50', '".$roleid."'
, '100', '1', '0', '100', '0', '0', '".$gender."', '".$img."', NOW(), NOW(), 'z01'
, '0', '".$ya."' , '30', '30', NULL , '墨門弟子' , '10', NULL , '0', '0', '', '10', '10', '10', '25', '0', '0' , '".$promocode."'
) ";
//		20	20		10	10	10	10	50	50		100	1	0	100	0	0							z01	0		30	30		墨門弟子	10	0	0	0		25	25	25	25	0	
     

		$DB_site->query($sql);
		$sql =
		"
		INSERT INTO `a3k`.`a3k_skill` (
`skill_id` ,
`role_id` ,
`user_id` ,
`skill_point` ,
`role_skillpointmax` ,
`skill_lvl` ,
`skill_type` ,
`skill_effect_turns` ,
`skill_active` ,
`skill_default_turns` ,
`skill_img` ,
`skill_animat_img` ,
`skill_name` ,
`skill_descr`
)
VALUES (
NULL , '".$roleid."', '".$newpid[0]."', '3', '3', '1', 'addattack', '0', '0', '1' ,'n1001' , 'e03' , '強襲' 
, '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害'
);
";
// 17	a04	1	3	3	1	addattack	0	0	1	icon_2	e03	強襲	所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害																													

				$DB_site->query($sql);

			include_once("../controller/a3k_act_present.php");
			$a3k_act_present = new a3k_act_present;		
			$a3k_act_present->get_present($newpid[0], $dawhere);
				
				if (!$eed){
				$outmsg = array( 
				"msg" => "1",
				"code" => $newpid[0]
				);					
				echo (json_encode($outmsg));
				return;
			}			
																		
	}
}


function checkplayer_atcreate($ya){
	global $DB_site;
	$meid=$DB_site->query_first("SELECT p_id FROM a3k.a3k_player WHERE f_1001ya ='".$ya."' ");
	if($meid)
	{
		$outmsg = array( 
			"msg" => "",
			"code" => $newpid[0]
		);					
		echo (json_encode($outmsg));
		return true;
	}else
	{
		return false;
	}
}



function getppout($ya ,$pid){
	include_once("../config/a3k_act_config.php");

	if(!$ya || $ya === 'null' || $ya === '')
	{
		$outmsg = array( 
		"sysmsg" => "請由遊戲官網登入",
		"sesout" => 1
		);		
		echo (json_encode($outmsg));
		return false;
	}
		
	global $DB_site , $a3k_config;
	$abcd=$DB_site->query_first("SELECT serverout FROM announcement WHERE 1 order by id desc limit 1	");	
	if(  $abcd["serverout"]  )
	{
		$outmsg = array( 
		"sysmsg" => $abcd["serverout"],//"系統維修中 請稍後回來 ",
		"serverout" => 1
		);		
		echo (json_encode($outmsg));		
		return false;
	}
	
	$meid=$DB_site->query_first("SELECT f_1001ya , p_lv, p_capt_attempts , p_locktime FROM a3k.a3k_player WHERE p_id ='".$pid."'
	");

	if($meid['f_1001ya'] != $ya )
	{
		$outmsg = array( 
		"sysmsg" => "請由遊戲官網登入",
		"sesout" => 1
		);		
		echo (json_encode($outmsg));
		return false;
	}	

	$mysqldate = date( 'Y-m-d H:i:s', time()+ $a3k_config["unfreeze"] );// x bug
	if( $meid['p_locktime']  != null )
	{
		if($meid['p_locktime'] >=  $mysqldate)
		{
			$outmsg = array( 
			"sysmsg" => "被鎖了",
			"lock" => 1
			);		
			echo (json_encode($outmsg));		
			return false;
		}
	}

	if( $a3k_config["enable_capt"] === 1 && $meid['p_capt_attempts'] > 0 )
	{
		$outmsg = array( 
		"sysmsg" => $meid['p_id'],
		"capt" => 1
		);		
		echo (json_encode($outmsg));		
		return false;
	}
	
	return true;
		
}


function checkplayer($ya, $newb){
	include_once("../config/a3k_act_config.php");

	if(!$ya || $ya === 'null' || $ya === '')
	{
		$outmsg = array( 
		"msg" => "請由遊戲官網登入",
		"code" => -1
		);		
		echo (json_encode($outmsg));
		return false;
	}
		
	global $DB_site , $a3k_config;
	$meid=$DB_site->query_first("SELECT p_id , p_lv, p_capt_attempts , p_locktime FROM a3k.a3k_player WHERE f_1001ya ='".$ya."'
	");
	if($newb != null)
	{
		if( $meid['p_lv'] >=$a3k_config["newb_allow_lv"])
			{
				$outmsg = array( 
				"msg" => "不是新手",
				"code" => -999
				);		
				echo (json_encode($outmsg));		
				return false;				
			}
	}

	$mysqldate = date( 'Y-m-d H:i:s', time()+ $a3k_config["unfreeze"] );
	//echo $mysqldate ;
	if( $meid['p_locktime']  != null )
	{
		if($meid['p_locktime'] >=  $mysqldate)
		{
			$outmsg = array( 
			"msg" => "被鎖了",
			"code" => -666
			);		
			echo (json_encode($outmsg));		
			return false;
		}else{
				$query = mysql_query("update a3k_player set p_locktime = NULL  where p_id=".$meid['p_id']." ");
				$outmsg = array( 
				"msg" => "",
				"code" => $meid['p_id']
				);		
				echo (json_encode($outmsg));		
				return true;			
		}
	}

	if( $a3k_config["enable_capt"] === 1 && $meid['p_capt_attempts'] > 0 )
	{
		$outmsg = array( 
		"msg" => $meid['p_id'],
		"code" => -777
		);		
		echo (json_encode($outmsg));		
		return false;
	}
		
	if($meid)
	{
		$outmsg = array( 
		"msg" => "",
		"code" => $meid['p_id']
		);		
		echo (json_encode($outmsg));		
		return true;
	}else
	{
		$outmsg =array ('msg'=> '請創立角色', 'code'=> -3);
		echo (json_encode($outmsg));
		return false;
	}
}

function loadfightend($me)
{
				include_once("../config/a3k_act_config.php");
				include_once("../controller/a3k_fight_select_x.php");		
				$a3k_act_class = new a3k_fight_select;
				$a3k_act_class->mysidestatus($me);
					
				unset($a3kclass);
				unset($a3k_act_class);

}
//經驗值+50,得到新手劍
function newbaward($me)
{
	global $DB_site;
	$meid=$DB_site->query_first("UPDATE a3k_player SET p_exp=p_exp+50 WHERE p_id ='".$me."' ");
	
	
	include_once('../controller/a3k_pack.php');
	$x_pack = new a3k_pack();			
	$checkpack=$x_pack->addToPack('f0001',$me);		
	}
//經驗值+50,得到物品：新手頭巾一個、武將：墨門小師弟
function newbaward2($me)
{
	global $DB_site;
	$meid=$DB_site->query_first("UPDATE a3k_player SET p_exp=p_exp+50 WHERE p_id ='".$me."' ");
	
	
	include_once('../controller/a3k_pack.php');
	$x_pack = new a3k_pack();			
	$checkpack=$x_pack->addToPack('a0001',$me);	
	include_once('../controller/a3k_fellow_control.php');
	$fellowClass = new fellow_class;	
	$fellowClass->getfellow('53', $me);
	}
//經驗值+50,金錢+100
function newbaward3($me)
{
	global $DB_site;
	$meid=$DB_site->query_first("UPDATE a3k_player SET p_exp=p_exp+50 ,p_money=p_money+100 WHERE p_id ='".$me."' ");
}
//經驗值+50,得到新手服一件、新手披肩一件
function newbaward4($me)
{
	global $DB_site;
	$meid=$DB_site->query_first("UPDATE a3k_player SET p_exp=p_exp+50  WHERE p_id ='".$me."' ");
	include_once('../controller/a3k_pack.php');
	$x_pack = new a3k_pack();			
	$checkpack=$x_pack->addToPack('b0001',$me);	
	$checkpack=$x_pack->addToPack('c0001',$me);	
}

function gohome($me)
{
	global $DB_site;
	$meid=$DB_site->query_first("UPDATE a3k_player SET p_map='z01'  WHERE p_id ='".$me."' ");	
	}

}
?>