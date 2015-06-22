<?


class a3k{

	var $fight_msg_html="";


	
	function fight_basic($f_a,$f_lv,$d_d,$d_lv) //屬性傷害比例function
	{ //攻擊力*(攻擊力/敵方防禦力) – 敵方防禦力 + 1.5(等級 – 敵方等級)
// f_lv => attacker's level	
// d_lv => defender's lever
// f_a => attacker's attack strength
// d_d => defender's defence strength

		$damged = 1;
		$damged = $f_a * ($f_a/$d_d) -$d_d+1.5*($f_lv- $d_lv);
		
		return round($damged);
		unset ($damged);
	}

	function fight_basic_x($a,$d) //屬性傷害比例function
	{ 

// a == attacker
// d == defender
		$a_at = 0;
		if($a[p_at])
			$a_at = $a[p_at];
			
		$a_str = 0;
		if($a[p_str])
			$a_str = $a[p_str];
			
		$a_lv = 0;			
		if($a[p_lv])
			$a_lv = $a[p_lv];	
			
		$d_df = 0;						
		if($d[p_df])
			$d_df = $d[p_df];	
						
		$d_vit = 0;						
		if($d[p_vit])
			$d_vit = $d[p_vit];	
			
		$d_lv = 0;						
		if($d[p_lv])
			$d_lv = $d[p_lv];	
					
/* 
(攻擊力 + (力量*1.2 + Lv*0.8 + 4 ))* 
( 攻擊力 + (力量*1.2 + Lv*0.8 + 4 ) /  (敵方防禦力 + (敵方體魄*1.0 + 敵方Lv*1 + 2 )))
 – 敵方防禦力 + (敵方體魄*1.0 + 敵方Lv*1 + 2 ) + 1.5*(等級 – 敵方等級)
 */						
		$damged = 1;
		$damged =  ($a_at + ($a_str * 1.2 + $a_lv * 0.8 + 4) ) * 
		( $a_at + ( $a_str * 1.2 + $a_lv * 0.8 + 4 ) / ( $d_df + ( $d_vit  * 1.0 + $d_lv *1 +2 ) ) )
		- $d_df + ( $d_vit * 1.0 + $d_lv * 1 + 2 ) + 1.5 * ( $a_lv - $d_lv);
		
		/* test 
		global $fight_msg_html;
		$fight_msg_html .= "attack ####" .( $a_at + ($a_str * 1.2 + $a_lv * 0.8 + 4) ) ;
		$fight_msg_html .= "defend ######" . ( 
		 ( $a_at + ( $a_str * 1.2 + $a_lv * 0.8 + 4 ) / ( $d_df + ( $d_vit  * 1.0 + $d_lv *1 +2 ) ) ) );
		 test */
		 
		return round($damged);

	}
	
	function fight_dodgecount($m)
	{
//閃避率公式：0.3*(速度 – 7)/(5*玩家等級)
// 閃避率公式：0.18*(速度 – 7)/(5*玩家等級) [edited 20090720]
		$dodgecount=0;
		if($m[p_lv])
			$dodgecount = 0.18 * ($m[p_agl] -7)/(5*$m[p_lv]);	
		
		return  $dodgecount;
	}
	
	function fight_damage_x($p,$m)//基本攻擊function
	{

			global $fight_msg_html; // output html for fight msg
			include_once("../controller/a3k_skill_control.php");							
			$a3k_skill = new skill_class;		

//  start //施毒技能
		if($p['skillset'])
		{	
			$skilled =  $a3k_skill->poison($p, $m);			 //施毒技能
			if($skilled['poison']!= 0)
			{
				$m[p_hp] = $m[p_hp] - $skilled['poison'];
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //施毒技能

/// start calc if missed  ///
			$dodgecount = $this->fight_dodgecount($m); //敵方閃避率
//  start //閃避技能			
			if($m['skillset'])
			{	
				$skilled_dodge =  $a3k_skill->dodge($m);			 //閃避技能
				if($skilled_dodge['dodge']!= 0)
				{
					$dodgecount += $skilled_dodge['dodge'];
				}
					$fight_msg_html .= $skilled_dodge['msg']; 	// 技能 out msg				
			}			
//  end //閃避技能			
		
			//命中率公式：1 – 敵方閃避率 + 0.1*(敏捷/(敏捷 + 敵方敏捷))
			$temp_agl = 1 - $dodgecount + 0.1 * ($p[p_agl]/($p[p_agl] +$m[p_agl])) ;		
			$tempr = rand(1,100);
			
			if(round($temp_agl*100) < $tempr)
			{
				$temp_d=0;// 閃避ed
				$fight_msg_html = "<span class=\"messagetext1\">".$m[p_name]."閃避了".$p[p_name]." 的攻擊!</span><br/>".$fight_msg_html  ;				
			}
/// end calc if missed ///

/// start calc fight damage ///				
			else
			{

//  start //強襲技能
				if($p['skillset'])
				{	
					$skilled =  $a3k_skill->addattack($p);			 //強襲技能
					if($skilled['addattack']!= 0)
					{
						$p[p_at] = $skilled['addattack'];
					}
					$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
				}
// end  //強襲技能

//  start //虛弱技能
				if($p['skillset'])
				{	
					$skilled =  $a3k_skill->weaken($p, $m);			 //強襲技能
					if($skilled['weaken']!= 0)
					{
						$m[p_at] = $skilled['weaken'];
					}
					$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
				}
// end  //虛弱技能

/// ~~~~~ start basic fight calc ///				
						$temp_d=$this->fight_basic($p[p_at],$p[p_lv],$m[p_df],$m[p_lv]); 
						//$temp_d=$this->fight_basic_x($p,$m); 
/// ~~~~~  end basic fight calc ///

//  start //必殺技能
				if($p['skillset'])
				{	
					$skilled =  $a3k_skill->tokill($p);			 //必殺技能
					if($skilled['tokill']!= 0)
					{
						//戰鬥每回合開始前，增加使用者出現必殺攻擊的機率15% 
						// no 必殺攻擊 ?????????????? x 20090312 
						// -- temp code $temp_d = $temp_d *2
						$temp_d = $temp_d *2;
					}
					$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
				}
// end  //必殺技能
				
/// start 連擊 calc ///
						//$temp_aa = (0.3 * ($p[p_agl]-7)/(5*$p[p_lv]))*100;	
						$temp_aa = (0.3 * ($p[p_agl]- $m[p_agl]-5) + ($p[p_agl] - $m[p_agl])/(5*$p[p_lv]))*100;	
						//連擊率公式：0.3*(速度 – 7)/(5*玩家等級) 
						// 連擊率公式：0.3*((攻擊方速度-被攻擊方速度) – 5) + (攻擊方等級-被攻擊方等級)/(5*玩家等級) [edited 20090720]
//  start //連擊技能
				if($p['skillset'])
				{	
					$skilled =  $a3k_skill->multiply($p);			 //連擊技能
					if($skilled['multiply']!= 0)
					{
						$temp_aa += $skilled['multiply'];	
					}
					$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
				}
// end  //連擊技能						
						$tempt =rand(1,100);
						if( $temp_d > 0 && round($temp_aa) > $tempt)
						{
							$temp_hit=2;//連擊觸發後，只會攻擊兩次（除非有技能影響）
							$temp_d=$temp_d*0.65*$temp_hit; 	// 原本傷害 * 0.65 * 連擊次數
							$fight_msg_html.= "<span class=\".messagetext5\">".$p[p_name]."快速攻擊".round($temp_hit)."次, 造成".round($temp_d)."點傷害!</span><br/>";
						}
			}
/// end 連擊 calc ///	
			if($temp_d<=0)
				$temp_d=1; //最小數值為：1，沒有負數
			else 
				$temp_d = round($temp_d);	
				
//  start //減傷技能
		if($p['skillset'])
		{	
			$skilled =  $a3k_skill->deductDamage($p, $temp_d );			 //減傷技能
			if($skilled['deductDamage']!= 0)
			{
				$temp_d = $skilled['deductDamage'];
				$temp_d = round($temp_d);	
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //減傷技能
				
			
				
/// end calc fight damage ///		
			
			if($temp_d<1)
			{
				$fight_msg_html = "<span class=\"messagetext1\">".$m[p_name]." 沒有受到 ".$p[p_name]." 的攻擊!</span><br/>".$fight_msg_html  ;
			}else if($temp_d==1)
			{
				$fight_msg_html = "<span class=\"messagetext1\">".$m[p_name]." 不痛不癢的被叮了一下，只受到1點傷害!</span><br/>".$fight_msg_html  ;
			}else
			{
				$fight_msg_html = "<span class=\"messagetext1\">".$p[p_name]."擊中".$m[p_name]." 造成</span><span class=\"messagetext3\">".$temp_d."</span><span class=\"messagetext1\">點傷害! </span><br/>".$fight_msg_html  ;
			}
			
		return $temp_d;
	}
	
	function trytrytry($allFighters)
	{
			global $fight_msg_html; // output html for fight msg
			include_once("../controller/a3k_skill_control.php");							
			$a3k_skill = new skill_class;		
					
		//戰鬥順序:速度+1.2*等級(數字越大者出手順序越前面)
		$fightSequence = array( 
		"p" => $allFighters['p'][p_agl] + (1.2*$allFighters['p'][p_lv]),
		"pf" => $allFighters['pf'][p_agl] + (1.2*$allFighters['pf'][p_lv]),
		"m" => $allFighters['m'][p_agl] + (1.2*$allFighters['m'][p_lv]),
		"mf" => $allFighters['mf'][p_agl] + (1.2*$allFighters['mf'][p_lv])
		);
		arsort($fightSequence, SORT_NUMERIC );
		
		
//  start //武將技能			
			if($allFighters['p']['skillset'])
			{	
				$skilled=  $a3k_skill->fellowgain($allFighters['p']);			 //武將技能
				if($skilled['fellowgain']!= 0)
				{
					$allFighters['pf'][p_at] += $skilled['fellowgain'];
					$allFighters['pf'][p_df] += $skilled['fellowgain'];
					$allFighters['pf'][p_str] += $skilled['fellowgain'];
					$allFighters['pf'][p_vit] += $skilled['fellowgain'];
					$allFighters['pf'][p_agl] += $skilled['fellowgain'];
					$allFighters['pf'][p_bone] += $skilled['fellowgain'];
				}
				$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
			}		
			if($m['skillset'])
			{	
				$skilled=  $a3k_skill->fellowgain( $allFighters['m']);			 //武將技能
				if($skilled['fellowgain']!= 0)
				{
					$allFighters['mf'][p_at] += $skilled['fellowgain'];
					$allFighters['mf'][p_df] += $skilled['fellowgain'];
					$allFighters['mf'][p_str] += $skilled['fellowgain'];
					$allFighters['mf'][p_vit] += $skilled['fellowgain'];
					$allFighters['mf'][p_agl] += $skilled['fellowgain'];
					$allFighters['mf'][p_bone] += $skilled['fellowgain'];
				}
				$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
			}						
//  end //武將技能		

		
		$tobefuckintheass = array();
		foreach ($fightSequence as $key => $val) 
		{			
			$attackrs = array ('p'=>$allFighters['p'], 'pf'=>$allFighters['pf']);
			$defendrs = array ('m'=>$allFighters['m'], 'mf'=>$allFighters['mf']);
			if($key == "p" || $key == "pf")// 戰鬥對手選擇:隨機, 如回合中死亡則找下一個打  
			{
					$toAttack = $attackrs[$key];
					$akey=array_rand($defendrs); 	//戰鬥對手選擇:隨機, 如回合中死亡則找下一個打
					
					$toDefend = $defendrs[$akey];
					if($toDefend[p_hp] <= 0)//如回合中死亡則找下一個打
					{
						if($akey == "m")
						{
							$toDefend = $defendrs["mf"];
							$akey = "mf";
						}
							else{
								$toDefend = $defendrs["m"];
								$akey = "m";
							}
					}
			}
			else if($key == "m" || $key == "mf") //戰鬥對手選擇:隨機, 如回合中死亡則找下一個打  
			{
				$toAttack = $defendrs[$key];
				$akey=array_rand($attackrs); //戰鬥對手選擇:隨機, 如回合中死亡則找下一個打
				
				$toDefend = $attackrs[$akey];
				if($toDefend[p_hp] <= 0)//如回合中死亡則找下一個打
				{
						if($akey == "p")
						{
							$toDefend = $defendrs["pf"];
							$akey = "pf";
						}
						else
						{
							$toDefend = $defendrs["p"];
							$akey = "p";
						}
				}
			}
			
				if($toAttack[p_hp]<=0 || $toDefend[p_hp]<=0 ) //(死了就不打)
				{}else
				{	
			
					
//  start //回血技能			
			if($toDefend['skillset'])
			{	
				$skilled_addHP =  $a3k_skill->getHP($toDefend);			 //閃避技能
				if($skilled_addHP['getHP']!= 0)
				{
					$toDefend[p_hp] += $skilled_addHP['getHP'];
				}
				$fight_msg_html .= $skilled_addHP['msg']; 	// 技能 out msg
			}			
//  end //回血技能			

//  start //定身技能			
					$gotfreezed = false;
					if($toDefend['skillset'])
					{	
						$skilled=  $a3k_skill->tofreeze($toDefend, $toAttack);			 //定身技能
						if($skilled['tofreeze']!= 0)
						{
							$gotfreezed = true;
						}
						$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
					}		
//  end //定身技能				

//  start //反間技能
		$gottoSuic = false;
		if($toDefend['skillset'])
		{	
			$skilled =  $a3k_skill->toSuic( $toDefend, $toAttack );			 //反間技能
			if($skilled['toSuic']!= 0)
			{
				$gottoSuic = true;
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		} 
// end  //反間技能	

					if(!$gotfreezed && !$gottoSuic)//定身技能 //反間技能
					{
						// -- !!!!!!!!!!!! the attack !!!!!!!!!!!!!!!!!
						$theBlood = $this->fight_damage_x($toAttack, $toDefend); 
					}									
					
//  start //反彈技能
		if($toDefend['skillset'])
		{	
			$skilled =  $a3k_skill->tobunceback($toAttack, $toDefend,  $theBlood );			 //反彈技能
			if($skilled['tobunceback_defender']!= 0)
			{
				$theBlood = $skilled['tobunceback_defender'];
				$theBlood = round($theBlood);	
				$toAttack[p_hp] = $toAttack[p_hp] - $skilled['tobunceback_attackr'];
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //反彈技能	

//  start //混亂技能
		if($toAttack['skillset'])
		{	
			$skilled =  $a3k_skill->toConfuse($toAttack, $toDefend );			 //混亂技能
			if($skilled['toConfuse']!= 0)
			{	
				$theaccidentkey=array_rand($allFighters);
				$allFighters[$theaccidentkey][p_hp] = $allFighters[$theaccidentkey][p_hp] - $theBlood;
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //混亂技能	

//  start //自爆技能
		if($toAttack['skillset'])
		{	
			$skilled =  $a3k_skill->toNuc($toAttack, $toDefend );			 //自爆技能
			if($skilled['toNuc_self']!= 0)
			{
				$theBlood = $skilled['toNuc_self'];
				$theBlood = round($theBlood);	
				$toAttack[p_hp] = $toAttack[p_hp] - $skilled['toNuc_other'];
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //自爆技能	

//  start //吸血技能
		if($toAttack['skillset'])
		{	
			$skilled =  $a3k_skill->toGetHP($toAttack, $toDefend, $theBlood );			 //吸血技能
			if($skilled['toGetHP']!= 0)
			{
				$theBlood = $skilled['toGetHP'];
				$theBlood = round($theBlood);	
				$toAttack[p_hp] = $toAttack[p_hp] + $skilled['toGetHP'];
			}
			$fight_msg_html .= $skilled['msg']; 	// 技能 out msg
		}
// end  //吸血技能	
	
//  start //反間技能 effect			
					if($gottoSuic)//反間技能
					{	
						if($akey == "m")
						{
							$toDefend = $defendrs["mf"];
							$akey = "mf";
						}
						else
						{
							$toDefend = $defendrs["m"];
							$akey = "m";
						}	
						if($akey == "p")
						{
							$toDefend = $defendrs["pf"];
							$akey = "pf";
						}
						else
						{
							$toDefend = $defendrs["p"];
							$akey = "p";
						}												
						// -- !!!!!!!!!!!! the attack for 反間 !!!!!!!!!!!!!!!!!	
						if($toDefend)
							$theBlood = $this->fight_damage_x($toAttack, $toDefend); 		
					}		
//  end //反間技能 effect							
								
					$toDefend[p_hp] = $toDefend[p_hp] - $theBlood;
					if($toDefend[p_hp] <= 0)
					{
						$thedead = $akey;
						$toDefend[p_hp] = 0;
					}
					$allFighters[$akey] = $toDefend;
					$allFighters[$key] = $toAttack;		
					$this->outputJS4eachhit($key,$akey, $allFighters[$key],$allFighters, $thedead);
				}
				// echo "<br/>".$key." ".$akey." -- " . $theBlood . " :: ". $allFighters[$akey][p_id]." :hp: ".$allFighters[$akey][p_hp];			
		}		

		echo "fight_llp(750);";
		return $allFighters;	
	}
	
function outputJS4eachhit($key,$akey, $attackr,$allFighters, $thedead)
{// animation data for each hit
		global $fight_msg_html;
		//if($thedead) 
		//$fight_msg_html .= $thedead."dead";
		
		
		$dispary = array ( 
				"side" => $key,
				"defendside" => $akey,
				
			 	"p_name" => $attackr[p_name],
	 		  "p_img" => $attackr[p_img],
	 		  
	 		  "p_hp" => $allFighters['p'][p_hp],
	 		  "pf_hp" => $allFighters['pf'][p_hp],
	 		  "m_hp" => $allFighters['m'][p_hp],
	 		  "mf_hp" => $allFighters['mf'][p_hp],
	 		  
	 		  "p_mn" => $allFighters['p'][p_mn],
	 		  "pf_mn" => $allFighters['pf'][p_mn],
	 		  "m_mn" => $allFighters['m'][p_mn],
	 		  "mf_mn" => $allFighters['mf'][p_mn],	 		  
	 		  
		   "msg2user" => $fight_msg_html, 
		   "pickle" => 375,
		   "dead" => $thedead
			); // json array for client
		$outputjs = "fight_now( ".json_encode($dispary).");";
			// end output client info for fight_now // for display in msg box
			$fight_msg_html ="";
		echo $outputjs;
		unset($outputjs);
}	
	
}
?>