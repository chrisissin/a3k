<?

class a3k_fight_select{
function switch_fightkind_infight_fellow_sql($fkind , $defencer , $inhp)
{
			switch ($fkind)
			{
				case "npc":
					$sql="select p_id, p_name ,p_at,p_df  
					,p_agl ,p_lv 
					, ".$inhp." as p_hp ,p_hp as p_hpmax, p_img , d_id , p_topr , p_1001_id
					from a3k_monster where p_id = ".$defencer." LIMIT 1";
					break;
				case "buddypk":					
					$sql="select p_id, p_name , p_df  
					,".$inhp." as p_hp , p_hp as p_hpmax, p_img , pf_id
					from a3k_player where p_id = '".$defencer."' LIMIT 1 ";
					break;					
				default:
					$sql ="";
					break;
			}
			return $sql;
}		
function switch_fightkind_infight_sql($fkind , $defencer , $inhp)
{
			switch ($fkind)
			{
				case "npc":
					$sql="select p_id, p_name ,p_at,p_df 
					,p_agl ,p_lv 
					,".$inhp." as p_hp ,p_hp as p_hpmax, p_img , d_id , p_topr , p_1001_id
					from a3k_monster where p_id = ".$defencer." LIMIT 1 ";
					break;
				case "buddypk":					
					$sql="select p_id, p_name , p_df  
					,".$inhp." as p_hp , p_hp as p_hpmax, p_img , pf_id
					from a3k_player where p_id = '".$defencer."' LIMIT 1 ";
					break;					
				default:
					$sql ="";
					break;
			}
			return $sql;
}	
function switch_fightkind_init_sql($fkind ,$defencer )
{
			switch ($fkind)
			{
				case "npc":
					/*$sql="select p_id, p_name , p_df  
					,p_hp ,p_hp as p_hpmax, p_img , pf_ids, p_1001_id
					from a3k_monster where p_map = '".$p[p_map]."' ORDER BY RAND() LIMIT 1 ";*/
					$sql="select p_id, p_name , p_df  
					,p_hp ,p_hp as p_hpmax, p_img , pf_ids, p_1001_id
					from a3k_monster where p_id = '".$defencer."' LIMIT 1 ";
					break;
				case "buddypk":					
					$sql="select p_id, p_name , p_df  
					,p_hp , p_hpmax, p_img , pf_id
					from a3k_player where p_id = '".$defencer."' LIMIT 1 ";
					break;					
				default:
					$sql ="";
					break;
			}
			return $sql;
}
function switch_fightkind_fellow_init_sql($fkind, $mdid)
{
			switch ($fkind)
			{
				case "npc":
						//-- monster's fellow
						$tm_mfary= explode("`", $mdid);
						$rand_key = array_rand($tm_mfary, 1);
						$mfranid = $tm_mfary[$rand_key];				
						$sql="select p_id, p_name , p_df  
						,p_hp ,p_hp as p_hpmax, p_img , p_1001_id
						from a3k_monster where p_1001_id = '".$mfranid."'  ORDER BY RAND() LIMIT 1 ";
					break;
				case "buddypk":
					$sql="select p_id, p_name , p_df  
					,p_hp , p_hpmax, p_img , pf_id
					from a3k_player where p_id = '".$mdid."' LIMIT 1 ";
					break;					
				default:
					$sql ="";
					break;
			}
			return $sql;
}
function fight_npc_init($user_id, $defencer,  $fkind)
	{
		global $DB_site;
	

		$sql="select a.p_id, a.p_name,a.p_hp,a.p_hpmax
		,a.p_img, p_map
		, a.p_mn , a.p_mnmax , a.pf_id , a.role_id
		from a3k_player a   
		where p_id='".$user_id."' and p_hp > 0  
		";
		
		
		if($p=$DB_site->query_first($sql)) // check for if player is ready to fight
		{
			$this->playersFightEnd($user_id); // -- clear out all data from last fight (like skill)
			
			
			$sql = $this->switch_fightkind_init_sql($fkind, $defencer);
			$m=$DB_site->query_first($sql);
			if($m)
			{
				
					//-- player's fellow 
					if($p[pf_id] != NULL)
					{
						$sql="select p_id, p_name , p_df  
						,p_hp , p_hpmax, p_img , p_mn, p_mnmax
						from a3k_fellow where p_id = ".$p[pf_id]." LIMIT 1 ";			
						$pf=$DB_site->query_first($sql);
					} 
					

					//test echo $mfranid ."!!!" .$rand_key;
					if($m[pf_ids]){
						$sql = $this->switch_fightkind_fellow_init_sql($fkind, $m[pf_ids]);
						$mf=$DB_site->query_first($sql);
					}else if($m[pf_id])
					{
						$sql = $this->switch_fightkind_fellow_init_sql($fkind, $m[pf_id]);
						$mf=$DB_site->query_first($sql);						
					}

						$tofuck = array(
							'p'=> $p, 'pf'=>  $pf, 'm'=> $m, 'mf'=> $mf
						);
				
					$attackrs = array ('p'=>$tofuck['p'], 'pf'=>$tofuck['pf']);
					$defendrs = array ('m'=>$tofuck['m'], 'mf'=>$tofuck['mf']);
			
					$lossingteamary = $this->checkFightEnd($lossingteamary, $attackrs, $defendrs);
					if($lossingteamary != NULL) 	// to prevent last fight not finish
					// -- one side all dead fight end
					{	
						$winnername = $lossingteamary[winnername]; 
						$lossername = $lossingteamary[lossername];
						$fightend_data = array( 
								"msg2user" => $lossername . " 無法戰鬥"
								 );
						$this->playersFightEnd($user_id);				 								 
						//echo "<script language=\"JavaScript\" >setTimeout('fight_end(".json_encode($fightend_data).")', 1000);</script>";
						echo "setTimeout('fight_end(".json_encode($fightend_data).")', 1000);";
					}else
					{						
						// -- start output client info for fight_init
						$transary = array (
						"fkind" => $fkind,
						"p_id" => $tofuck['p'][p_id],
						"pf_id" => $tofuck['pf'][p_id],
						"m_id" => $tofuck['m'][p_id],
						"mf_id" => $tofuck['mf'][p_id],
						"p_hp" => $tofuck['p'][p_hp],
						"pf_hp" => $tofuck['pf'][p_hp],
						"m_hp" => $tofuck['m'][p_hp],
						"mf_hp" => $tofuck['mf'][p_hp],
						"p_mn" => $tofuck['p'][p_mn],
						"pf_mn" => $tofuck['pf'][p_mn],																																																						
						"m_mn" => $tofuck['m'][p_mn],
						"mf_mn" => $tofuck['mf'][p_mn]
						);
						$outputjs = "
						fight_init(".json_encode($tofuck).");setTimeout('fight_nexttrun(".json_encode($transary).")', 1500);
						";
						echo $outputjs;
						// end output client info for fight_init
					}
			}
			else
			{
				$fightend_data = array( 
							"msg2user" =>"對方目前無法戰鬥"
							 );// 
				$this->playersFightEnd($user_id);				 
				echo "setTimeout('fight_end(".json_encode($fightend_data).")', 100);";
				//echo "<script language=\"JavaScript\" >notifyactionresult('這裡沒怪');</script>";				
			}
		}else
		{
			$fightend_data = array( 
						"msg2user" => "需要住宿"
						 );
			$this->playersFightEnd($user_id);				 						 						 
			echo "setTimeout('fight_end(".json_encode($fightend_data).")', 100);";
			//echo "<script language=\"JavaScript\" >notifyactionresult('需要住宿');</script>";
		}
		
		unset($m);
		unset($p);
		unset($p_f);
		unset($m_f);

		unset($tofuck);
		unset($transary);
	}

function fight_npc($inary)
{									
		global $DB_site,$a3kclass;
		
		//
		// edited 20090721
	  //echo " p_id ::". $inary;//.":: pf_id ". $pf_id." m_id ". $m_id." mf_id ". $mf_id." m_hp ".  $m_hp."mf_hp ".  $mf_hp." pf_hp ". $pf_hp;
		$sql="select p_id, p_name,p_at,p_df,p_agl, ".$inary['p_hp']." as p_hp,p_hpmax,p_lv
		,p_agl, p_smart, p_vit, p_bone, p_str
		,p_exp,p_nextexp,p_img, role_id
		,p_map, p_mn , p_mnmax, pf_id , p_rankname
		from a3k_player    
		where p_id=".$inary['p_id']." 
		";// getting hp from db for now ;; may change to use pass in depend on 
		
		$p=$DB_site->query_first($sql);
		
		$sql = $this->switch_fightkind_infight_sql($inary['fkind'], $inary['m_id'], $inary['m_hp']);
		$m=$DB_site->query_first($sql);
		
		
		if($p && $m)//check if player and monster are ready to fight in the turn
		{
			// -- player's fellow
			if($inary['pf_id'])
			{
				$sql="select p_id, p_name ,p_at,p_df 
				,p_lv 
				,p_agl, p_smart, p_vit, p_bone, p_str
				, ".$inary['pf_hp']." as  p_hp , p_hpmax, p_img , p_mn, p_mnmax
				from a3k_fellow where p_id = ".$inary['pf_id']."  ";			// ,".$inary['pf_hp']." as  //p_hp as [edited 20090721]
				$pf=$DB_site->query_first($sql);
			}
			if($inary['mf_id'])
			{
				// -- monster's fellow 
				$sql = $this->switch_fightkind_infight_fellow_sql($inary['fkind'], $inary['mf_id'], $inary['mf_hp']);
				$mf=$DB_site->query_first($sql);
			}
			
			//unset ($inary);
			
// -- get and set skill
			// -- player skill set check
	include_once("../controller/a3k_skill_control.php");							
	$a3k_skill = new skill_class;
	$skillset = $a3k_skill->getPlayersUsableSkills($p[p_id]);
	$p['skillset'] = $skillset;

// -- x 20090312	
// -- only for players now
// -- todo get pfellow and monster and monster fellow' skill here
/////////////////////////////////

			$allFighters = array(
					'p'=> $p, 'pf'=>  $pf, 'm'=> $m, 'mf'=> $mf
				);
				
			include_once("../controller/a3k_fight_m_x.php");
			$a3kclass = new a3k;	
			$allFighters =$a3kclass->trytrytry($allFighters);	// -- fight turn loop here, will return result array 
			
			$this->updateUserFightStatus($allFighters);
			

			$attackrs = array ('p'=>$allFighters['p'], 'pf'=>$allFighters['pf']);
			$defendrs = array ('m'=>$allFighters['m'], 'mf'=>$allFighters['mf']);
			
			$fightendmsg = $this->checkFightEnd($lossingteamary, $attackrs, $defendrs);
			
			if($fightendmsg != NULL)
			// -- all dead fight end
			{
				$fightend_data = array( 
						"msg2user" => $fightendmsg
						 );
						 //test ."!mf!".$gotfucked['mf'][p_hp]."!m!".$gotfucked['m'][p_hp]."!pf!".$gotfucked['pf'][p_hp]."!p!".$gotfucked['p'][p_hp]
						 

					$this->playersFightEnd($p[p_id]);			
					
					$this->mysidestatus($p[p_id]);
							 					 	 
					echo "setTimeout('fight_end(".json_encode($fightend_data).")', 1500);";


			}
			else	// -- continue fight
			{		
						//$pf[p_hp] is for temp 
						// -- construct output json array here
						$transary = array (
						"fkind" => $inary['fkind'],
						"p_id" => $allFighters['p'][p_id],
						"pf_id" => $allFighters['pf'][p_id],
						"m_id" => $allFighters['m'][p_id],
						"mf_id" => $allFighters['mf'][p_id],
						"p_hp" => $allFighters['p'][p_hp],
						"pf_hp" => $allFighters['pf'][p_hp],
						"m_hp" => $allFighters['m'][p_hp],
						"mf_hp" => $allFighters['mf'][p_hp],
						"p_mn" => $allFighters['p'][p_mn],
						"pf_mn" => $allFighters['pf'][p_mn],																																																						
						"m_mn" => $allFighters['m'][p_mn],
						"mf_mn" => $allFighters['mf'][p_mn]
						);
																								
						$outputjs = "
						setTimeout('fight_nexttrun(".json_encode($transary).")',1500);";
						//test echo "<br/><br/><br/>!!!!!!!!!!!!!!".$gotfucked['m'][p_hp]."<br/><br/><br/>!!!!!!!!!!!!!!".$gotfucked['mf'][p_hp]."<br/><br/><br/>!!!!!!!!!!!!!!".$gotfucked['p'][p_hp]."<br/><br/><br/>!!!!!!!!!!!!!!".$gotfucked['pf'][p_hp];
					echo $outputjs;
				}
		}
		else	
		// somthing wrong with attacker or defender
		{
			$fightend_data = array( 
						"msg2user" => "無法戰鬥"
							 );
		 			
			$this->playersFightEnd($p[p_id]);
			echo "fight_end(".json_encode($fightend_data).");";
		}



		unset($m);
		unset($p);
		unset($p_f);
		unset($m_f);
		unset($allFighters);
		unset($toBeFucked);
		unset($lossingteamary );
		unset($transary);

}

function playersFightEnd($pid)
{
	include_once("../controller/a3k_skill_control.php");		// -- clear skill effect turns					
	$a3k_skill = new skill_class;
	$a3k_skill->clearActiveSkillEffectTurns($pid);
	include_once("../controller/a3k_shortcut_control.php");	// -- clear shortcut status							
	$a3k_skill = new shortcut_class;
	$a3k_skill->clearActiveShotCuts($pid);	
	//echo "<script language=\"JavaScript\" >fight_end(".json_encode($fightend_data).");</script>";
}

function updateUserFightStatus($allFighters)
{
		
		//玩家角色：戰鬥中耗損的體力（hp）、精神力（mana）與使用的道具均會更新資料庫
		//武將：戰鬥中耗損的體力（hp）會更新資料庫
		//隊友：無
	  // todo write to temp table and write them back at fight end
	  global $DB_site;
		$sql="UPDATE `a3k`.`a3k_player` SET `p_hp` = '".$allFighters['p'][p_hp]."' WHERE `p_id` = ".$allFighters['p'][p_id]." LIMIT 1 ";//,`p_mn` = '".$allFighters['p'][p_mn]."'
		$DB_site->query($sql);
		if($allFighters['pf'])
			$sql="UPDATE `a3k`.`a3k_fellow` SET `p_hp` = '".$allFighters['pf'][p_hp]."' WHERE `p_id` = ".$allFighters['pf'][p_id]." LIMIT 1 ";//,`p_mn` = '".$allFighters['pf'][p_mn]."
		$DB_site->query($sql);
}

function checkFightEnd($lossingteamary, $attackrs, $defendrs)
	// returns msg
	// returns null if not
	// 戰鬥結束: 一方全死 (死了就不打)
	//// very ugly code !!!
	{
		$lossingteamary = NULL;

			// test echo "<br> ".$va[p_name]. " <bR> ".$va[p_hp];
			if($attackrs['p'][p_hp] <= 0 && $attackrs['pf'][p_hp] <= 0  )	
			{// return winner team's main char name
				$lossingteamary = array ('winnername' => $defendrs['m'][p_name], 
				'lossername'=>	$attackrs['p'][p_name]);
				$plost =true;
			}else		// if other's in the team isn't dead then it's not the end
			{
				// test echo "<hr> other not dead   ";
				$lossingteamary = NULL;	
				$plost =false;
			}

		if($lossingteamary == NULL) 
		// -- if the first team isn't all dead yet
		{
				// test echo " <br> ".$va[p_name]. " <bR> ".$va[p_hp];
				if($defendrs['m'][p_hp] <= 0 && $defendrs['mf'][p_hp] <= 0  )	
				{// return winner team's main char name
					$lossingteamary = array ('winnername' => $attackrs['p'][p_name], 
					'lossername'=>	$defendrs['m'][p_name]);
					$mlost = true;
				}else	// if other's in the team isn't dead then it's not the end
				{
					// test echo "<hr>  other not dead   ";
					$lossingteamary = NULL;	
					$mlost = false;
				}
		}
		
		if($lossingteamary != NULL)
			// -- all dead fight end
		{
			if($plost)
				$outmsg .=$this->lossingCostNPC($attackrs['p'][p_id]);
				
			if($mlost)
				$outmsg .=$this->winAwardNPC($attackrs['p'],$defendrs['m'], $defendrs['mf']);
		  
					  
			$winnername = $lossingteamary[winnername]; 
			$lossername = $lossingteamary[lossername];
	
			$outmsg .=  $winnername ."擊敗了".$lossername." <br/>" ;		 
			return $outmsg; 
		}
		else 
			return NULL;
	}
	
	
	
	function winAwardNPC( $player, $defender, $dfellow)
	{
		

		global $DB_site;
		//經驗值公式：10 + 1.8*敵方等級 + 1.8*(敵方等級 – 玩家等級)
		//經驗值公式：10 + 1.5*敵方等級 + 1.8*(敵方等級 – 玩家等級) [edited 20090720]
		$expGainedShow = $expGained = $FLexpGained = round(10 + (1.5 * $defender[p_lv]) + 1.8 * ($defender[p_lv] - $player[p_lv]));
		if( $expGained <= 0 ) // prevent exp equqtion out put negative
		{
			$expGainedShow = $expGained = $FLexpGained = 0;
		}
		// todo : check level up
		
		//金錢公式：2 + 0.1*敵方等級 + 0.2*(敵方等級 – 玩家等級)
		$moneyGained = round( 2 + (0.1 * $defender[p_lv]) + 0.2 * ($defender[p_lv] - $player[p_lv]));
		if( $moneyGained <= 0 ) // prevent money equqtion out put negative
		{
			$moneyGained = 0;
		}
				
		//勝場+1
		
		if(($expGained + $player[p_exp]) >= $player[p_nextexp]) // -- check if level up 
		{
			$player[p_exp] = $expGained = ($expGained + $player[p_exp]) - $player[p_nextexp];	//-- the leftover exp point back
			 
			$awardmsg .= $this->LvlUp($player); // -- level up process here;
		}else
		{
			$player[p_exp] = $player[p_exp]+$expGained;				
		}

		
		// test	echo "!!!!!!!!!!!".$moneyGained."!!!!!!!!!!!".$expGained."!!!!!!!!!!!".$player[p_nextexp]."!!!!!!!!!!!".($expGained + $player[p_exp]) ;
		$sql="UPDATE `a3k_player` SET `p_win` = p_win + 1 , p_money = p_money + ".$moneyGained ." , p_exp =   ".$player[p_exp] ." WHERE `p_id` = ".$player[p_id]." LIMIT 1 ";
		$DB_site->query($sql);
		
		$awardmsg .= "得到 exp ".$expGainedShow." 點<br/>";
		$awardmsg .= "得到 ".$moneyGained." 元<br/>";
		
		$awardmsg .= $this->awardforrole($player[p_id], $player[role_id]);///職業
		
		
		//  -- 物品掉落項目與機率參照npc設定
try{
				  $awarditemmsg ="";
   				$awarditemnames ="";
   				
					$tm_mfary= explode("`", $defender[d_id]);
					foreach ($tm_mfary as $value) {
   				 			$itemdropratecp = rand(1, 100);
   				 			if($defender[p_topr] > $itemdropratecp)
   				 			{
   				 				include_once("../controller/a3k_pack.php");							
									$a3k_pack = new a3k_pack;
									$awarditemnames=$a3k_pack->addToPack($value,$player[p_id]);
   				 				switch($awarditemnames)
   				 				{
   				 					case "":
   				 						$awarditemmsg.="沒有得到物品因為背包滿了<br/>";
   				 					break;
   				 					case null:
   				 						$awarditemmsg .="";
   				 					break;
   				 					default:
   				 						$awarditemmsg.="幸運撿到 ".$awarditemnames."<br/>";
   				 					break;
   				 				}
   				 			}
					}		
      
					$awardmsg .= $awarditemmsg;
}catch (Exception $e) {
   // echo 'Caught exception: ',  $e->getMessage(), "\n";
}
		
		//武將：加入戰鬥的武將可得到與主人相同的經驗值，但不會得到錢、物品等其他獎勵
		if($player[pf_id])
		{
		    include('../controller/a3k_fellow_control.php');
			$fellowobj = new fellow_class();	
			$fellowobj->fellowexp($player[pf_id], $FLexpGained);	   
		}
		
		// -- mission status update
		  include('../controller/quest.class.php');
      $class = new quest;
      $enemy = array($defender['p_1001_id'], $dfellow['p_1001_id']);	
      $class->updateNeed($player[p_id], $enemy, 1, $player[p_map]);
		
		
		return $awardmsg;
	}
	
	function awardforrole($playerid, $roleid)
	{
		global $DB_site;
		
		$sql= "select s.skill_point, s.skill_name, s.role_skillpointmax from a3k_skill as s 
		where s.user_id = ".$playerid." and s.role_id = '".$roleid."'  LIMIT 1 ";
		$res = $DB_site->query_first($sql);
		if($res)
		{
			 // -- check if the role skill point is at max -- if max no need to add
			if($res[skill_point] >= $res[role_skillpointmax])
			{
				//  -- at max already do nothing
				$retmsg="";
			}else
			{
						//職業熟練度加1
						$sql="UPDATE a3k_skill SET  skill_point = skill_point + 1 WHERE user_id = '".$playerid."' and role_id = '".$roleid."' LIMIT 1 ";
						$DB_site->query($sql);
						
						if(($res[skill_point]+1) >= $res[role_skillpointmax])
						{
							//-- if skill is at max this time == tell user that 得到技能 xxx
							$retmsg .= "職業熟練度 完成 得到技能 " .$res[role_skillname]."<br/>";
						}
			}
		//職業熟練度100%之後才會得到出生職業的技能			
		}else
		{// -- no skill for this user's role...
			// todo change to switch job func which has restrictions .. if not passed should display error
			// -- todo pass to skill (insert role_skillpointmax)
			$sql ="
			select role_id, role_name, role_skillpointmax, role_skillname, role_skillimg, skill_default_turns, 
			skill_active, skill_type, skill_animat_img
			from a3k_role where role_id = '".$roleid."'
			";
			$role = $DB_site->query_first($sql);
			$sql ="
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
`skill_name`,
`skill_descr`
)
VALUES (
NULL , '".$roleid."', '".$playerid."',  '1', '".$role[role_skillpointmax]."',
 '1',  '".$role[skill_type]."', '0',  '".$role[skill_active]."', '".$role[skill_default_turns]."', 
 '".$role[role_skillimg]."' ,  '".$role[skill_animat_img]."' ,  '".$role[role_skillname]."' , '".$role[skill_descr]."'
);			
			";

			$DB_site->query($sql);			
		}
		return $retmsg;
	}
	
	function lossingCostNPC($pid)
	{
		/*
隊友：無
戰敗不影響經驗值與金錢
玩家敗場+1 (@fight end)
		*/
		global $DB_site;
		$sql="UPDATE `a3k`.`a3k_player` SET `p_lost` = p_lost + 1 WHERE `p_id` = ".$pid." LIMIT 1 ";
		$DB_site->query($sql);
		return " ";
	}
	
	function LvlUp($player)
	{
		// todo : check if ready for level up
		// update p_nextexp
		// update p_lv
		// return msg
		/*
update 玩家升級所需經驗值TABLE
玩家每次升級時，會依照目前職業的提昇屬性表隨機提昇各項屬性
防禦力公式：體魄*1.15 + Lv*1.05 + 2 (@升級) [edited 20090721] 
玩家稱號欄位會顯示玩家在該等級得到的稱號，各等級稱號參照企劃設定的table		
		*/
							
		global $DB_site;
		// x todo 20090729 take off all equipt items (effects) before lvl up
		// x todo 20090729 equip back all items after lvl up
		$player[p_lv] = $player[p_lv] +1;  // level up	
		$sql= "select level, nextexp, lvl_rankname
		from a3k_lvlchart 
		where level = ".$player[p_lv]."  LIMIT 1 ";
		$res = $DB_site->query_first($sql);
		
		if($res[nextexp])
			$player[p_nextexp] = $res[nextexp]; // next exp up
			
		$player[p_rankname] = $res[lvl_rankname]; // rank name up
		
		$theups = $this->checkJobChartForLvlUp($player[role_id]);
		
		$player[p_str] = $player[p_str]+$theups["up_str"]; //力量 up
		$player[p_agl] = $player[p_agl]+$theups["up_agl"]; //敏捷 up
		$player[p_smart] = $player[p_smart]+$theups["up_smart"]; //智力 up
		$player[p_vit] = $player[p_vit]+$theups["up_vit"]; //體魄 up
		$player[p_bone] = $player[p_bone]+$theups["up_bone"]; //根骨 up		
		
		// x update basic attribute to player
		$sql="
				UPDATE `a3k`.`a3k_player` SET 
		    p_lv = '" .$player[p_lv] ."'"
		.", p_nextexp = '".$player[p_nextexp]."'"
		.", p_rankname = '".$player[p_rankname]."'"				
		.", `p_str` =  ".$player[p_str]
		.", `p_vit` = ".$player[p_agl]
		.", `p_smart` =  ".$player[p_smart]
		.", `p_agl` =  ".$player[p_vit]
		.", `p_bone` =  ".$player[p_bone]
		." WHERE `a3k_player`.`p_id` = '".$player[p_id]."' LIMIT 1 ;
		";			
		$DB_site->query($sql);

		
		// x re-equipt all equipment items to players
		// this will recalc the player's st, df, hp, mn
		include_once("../controller/a3k_pack.php");							
		$pack = new a3k_pack;
		$sql= "select *
		from a3k_player_item
		where p_id = ".$player[p_id]." and item_eq = 1 ";
		$res = $DB_site->query($sql);		
		while($rows =$DB_site->fetch_array($res))
		{
			$sql = "SELECT * FROM `a3k_items` WHERE item_id ='".$rows['item_id']."' ";
			$myshit = $DB_site->query_first($sql);			
			$thecalcs = $pack->toEquip($rows['id'], $myshit, $player[p_id]);	
		}		
		
		
		$DB_site->query($sql);
		$leftovers = "恭喜 ".$player[p_name]." 升級<br/>";
		echo ("msgonchatboard('升級了!');");	
		return $leftovers;
		unset($res);
			
	}
	
	
	function checkJobChartForLvlUp($roleid)
	{
		global $DB_site;
		
		$sql= "select *
		from a3k_role 
		where role_id = '".$roleid."'  LIMIT 1 ";
		$res = $DB_site->query_first($sql);
				
		$theups = array (
		"up_str" => rand($res[role_skill_str_init] , $res[role_skill_str_max]),
		"up_vit" => rand($res[role_skill_vit_init] , $res[role_skill_vit_max]),
		"up_bone" => rand($res[role_skill_bone_init] , $res[role_skill_bone_max]),
		"up_agl" => rand($res[role_skill_agl_init] , $res[role_skill_agl_max]),
		"up_smart" => rand($res[role_skill_smart_init] , $res[role_skill_smart_max])
		);		
		
		return $theups ;
		
		unset ($res);
	}

	function mysidestatus($me)
	{
		global $DB_site;
		
		$sql= "select p_hp , p_hpmax, p_mn, p_mnmax, pf_id from a3k_player where p_id ='".$me."' ";

		$res = $DB_site->query_first($sql);
		if($res['pf_id'])
			$fres = 	$DB_site->query_first("select p_hp , p_hpmax, p_mn, p_mnmax from a3k_fellow where p_id ='".$res['pf_id']."' ");			
					
						$dispary = array ( 
									"side" => null,
									"defendside" => null,
									
								 	"p_name" => null,
						 		  "p_img" => null,
						 		  
						 		  "p_hp" => $res[p_hp],
						 		  "p_hpmax" => $res[p_hpmax],				 		  
						 		  "pf_hp" => $fres[p_hp],
				 		  		"pf_hpmax" => $fres[p_hpmax],								 		  
						 		  "m_hp" => null,
						 		  "mf_hp" => null,
						 		  
						 		  "p_mn" => $res[p_mn],
						 		  "pf_mn" => $fres[p_mn],
						 		  "p_mnmax" => $res[p_mnmax],
						 		  "pf_mnmax" => $fres[p_mnmax],						 		  
						 		  "m_mn" => null,
						 		  "mf_mn" => null,	 		  
						 		  
							   "msg2user" => "", 
							   "pickle" => 10,
							   "dead" => null
								); // json array for client
						//echo "<script language=\"JavaScript\" >setTimeout('fight_animat(".json_encode($dispary).")', 1000);</script>";	
						echo "setTimeout('fight_animat(".json_encode($dispary).")', 1000);";	
	}

}
?>
