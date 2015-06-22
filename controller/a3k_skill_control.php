<?PHP

include_once("../utilities/function.php");
include_once("../utilities/global.php");	


class skill_class
{
	
/*
toSuic
技能名稱：反間
說明：讓敵方自己互相攻擊
技能型態：主動
消耗精神力：18 + 6*技能等級
運作方式：使用後有機率觸發反間技能，觸發後自身攻擊取消，敵方攻擊時會攻擊自己的武將或玩家角色，如果場上已經沒有同伴時則對自己進行攻擊
公式：觸發機率 -> (0.03*技能等級 + 0.15)*100% 
反間：攻擊者名稱使出技能名稱，使被攻擊者名稱與同伴內鬨
*/	
function toSuic($p, $m)
{
			$ret ="";
			$toSuic = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="toSuic")
				{			
					$toSuicchance = ((0.03*$val[skill_lvl])+0.15) * 100;
					if(rand(1,100) < $toSuicchance  )
					{					
						$manause = 18 + 6 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$toSuic = 1;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; ".$m[p_name]."與同伴內鬨 !</span><br/>" ;			
						}else 
						{
							$ret = "<span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
					}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'toSuic'=>  $toSuic
			);
			//test print_r ($retary);
			return $retary;			
}		
	
/*
toConfuse
技能名稱：混亂
說明：使敵方混亂
技能型態：主動
消耗精神力：20 + 3*技能等級
運作方式：使用之後，下兩回合敵人有可能：攻擊敵方玩家、攻擊敵方武將、攻擊自己、攻擊自己武將、什麼事也不作，每個機率相同（如果觸發了攻擊敵方武將或攻擊自己武將時沒有武將或武將已陣亡，則什麼事也不作）
公式 
混亂：攻擊者名稱使出技能名稱，使被攻擊者名稱進入混亂狀態
*/	
function toConfuse($p, $m)
{
			$ret ="";
			$toConfuse = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="toConfuse")
				{			
						$manause = 20 + 3 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$toConfuse = 1;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; ".$m[p_name]." 進入混亂狀態 !</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'toConfuse'=>  $toConfuse
			);
			//test print_r ($retary);
			return $retary;			
}		

	
/*
toGetHP
技能名稱：吸血
說明：吸血
技能型態：主動
消耗精神力：12 + 3*技能等級
運作方式：使用之後，在戰鬥中攻擊成功造成傷害後，增加造成傷害7%的血
公式：增加的血量：造成的傷害數值*0.01 + 造成的傷害數值*0.006*技能等級
吸血：攻擊者名稱使出技能名稱，對被攻擊者名稱造成xxx點傷害同時也恢復自己xxx點體力   
*/	
function toGetHP($p, $m, $damage)
{
			$ret ="";
			$toGetHP = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="toGetHP")
				{			
						$manause = 12 + 3 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$toGetHP = round($damage * 0.01 + $damage *0.006 * $val[skill_lvl]) ;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; 對 ".$m[p_name]."  的攻擊，造成 ".$toGetHP ." 點傷害 同時也恢復自己
								".$toGetHP ."
								點體力！</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'toGetHP'=>  $toGetHP
			);
			//test print_r ($retary);
			return $retary;			
}		

	
/*
toNuc
技能名稱：自爆
說明：以血換血
技能型態：主動
消耗精神力：2 + 3*技能等級
運作方式：使用之後，玩家與戰場上所有角色（包含武將）同時受到傷害
公式：玩家角色受到的傷害：玩家體力最大值*0.005*技能等級
其他角色受到的傷害：玩家體力最大值*0.003*技能等級 
自爆：攻擊者名稱使出技能名稱，對被攻擊者名稱造成xxx點傷害同時也對自己造成xxx點傷害！ 
*/	
function toNuc($p, $m)
{
			$ret ="";
			$toNuc_self = 0;
			$toNuc_other = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="toNuc")
				{			
						$manause = 2 + 3 * $val[skill_lvl] ;
						if($this->deductMana($m, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$toNuc_self = round($p[p_hpmax] * ( 0.005 * $val[skill_lvl]) );
								$toNuc_other = round($p[p_hpmax] * ( 0.003 * $val[skill_lvl]) );
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; 對 ".$m[p_name]."  的攻擊，造成 ".$toNuc_other ." 點傷害 同時也對自己造成
								".$toNuc_self ."
								點傷害！</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'toNuc_self'=>  $toNuc_self , 'toNuc_other'=> $toNuc_other
			);
			//test print_r ($retary);
			return $retary;			
}		

	
/*
tobunceback
技能名稱：反彈
說明：反彈部份傷害
技能型態：主動
消耗精神力：10 + 5*技能等級
運作方式：使用之後五回合內受到攻擊時，有70%的機率觸發「反彈」技能，觸發後只受到原本80%的傷害，攻擊方受到13%傷害
公式：我方傷害：原本傷害*（1 - 0.025*技能等級 – 0.1）
敵方傷害：原本傷害*（1 - 0.02*技能等級） 
反彈傷害：被攻擊者名稱反彈了攻擊者名稱的攻擊，造成xxx點傷害！ 
*/	
function tobunceback($p, $m, $damage)
{
			$ret ="";
			$tobunceback_attackr = 0;
			$tobunceback_defender = 0;
			foreach ($m['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="tobunceback")
				{			
					$tobuncebackchance = 70;
					if(rand(1,100) < $tobuncebackchance  )
					{
						$manause = 10 + 5 * $val[skill_lvl] ;
						if($this->deductMana($m, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$tobunceback_defender = round($damage * ( 1 - (0.025 * $val[skill_lvl]) - 0.1));
								$tobunceback_attackr = round($damage * ( 1 - (0.02 * $val[skill_lvl])));
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$m[p_name].
								" 名稱反彈了  ".$p[p_name]." 的攻擊，造成 ".$tobunceback_attackr ." 點傷害！ !</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$m[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
					}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'tobunceback_attackr'=>  $tobunceback_attackr , 'tobunceback_defender'=> $tobunceback_defender
			);
			//test print_r ($retary);
			return $retary;			
}		

	
/*
tofreeze
技能名稱：定身
說明：使敵人無法動彈
技能型態：主動
消耗精神力：20 + 5*技能等級
運作方式：使用後，有機率觸發「定身」技能，觸發後敵人
有三回合無法任何動作（攻擊、技能、使用道具）
公式：((0.03*技能等級) + 0.20)*100% 
定身：攻擊者名稱使出技能名稱，被攻擊者名稱無法動彈
*/		
function tofreeze($p, $m)
{
			$ret ="";
			$tofreeze = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="tofreeze")
				{			
					$freezchance = ((0.03*$val[skill_lvl])+0.2) * 100;
					if(rand(1,100) < $freezchance  )
					{
						$manause = 20 + 5 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$tofreeze = 1;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; ".$m[p_name]." 無法動彈 !</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
					}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'tofreeze'=>  $tofreeze
			);
			//test print_r ($retary);
			return $retary;			
}		
	
/*
fellowgain
技能名稱：武將
說明：增加武將屬性
技能型態：主動
消耗精神力：16 + 4*技能等級
運作方式：使用此技能後三回合，武將所有屬性均增加
攻擊力
防禦力
力量
體魄
智力
敏捷
根骨
公式：武將屬性增加比率 -> ((0.035*技能等級) + 0.15)*100% 	
*/
function fellowgain($p)
{
			$ret ="";
			$fellowgain = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="fellowgain")
				{			
						$manause = 16 + 4 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$fellowgain = ((0.035*$val[skill_lvl])+0.15) * 100;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ; 武將屬性增加 !</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;	
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'fellowgain'=>  $fellowgain
			);
			//test print_r ($retary);
			return $retary;			
}	
	
/*
multiply
技能名稱：連擊
說明：增加攻擊次數
技能型態：主動
消耗精神力：16 + 4*技能等級
運作方式：使用後的 5 回合中，每次攻擊時有機率多攻擊一次，連擊觸發時，造成的傷害只有原本攻擊力
contridict to 原本傷害 * 0.65 * 連擊次數 -Chris Ho 2/24/09 6:13 PM
的 60%
公式：連擊觸發時的攻擊力：原本傷害*0.6
連擊率增加 -> ((0.02*技能等級) + 0.1)*100% 
連擊：攻擊者名稱使出技能名稱，連擊機率增加提昇
*/
function multiply($p)
{
			$ret ="";
			$multiply = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="multiply")
				{			
						$manause = 16 + 4 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$multiply = ((0.02*$val[skill_lvl])+0.1) * 100;
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." 連擊機率增加提昇 !</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'multiply'=>  $multiply
			);
			//test print_r ($retary);
			return $retary;			
}

/*
poison
技能名稱：施毒
說明：讓敵人中毒
技能型態：主動
消耗精神力：12 + 3.5*技能等級
運作方式：使用時在該回合進行攻擊，攻擊命中後有機會讓敵人中毒，從中毒後下一回合一開始，中毒的人會減少生命力，每次中毒效果持續3回，
技能效果可重複計算（例如：第一回合中毒，第二回合一開始失血10，第二回合又中毒，第三回合一開始失血10+10，第三回合沒中毒，第四回合一開始失血10+10，第四回合沒中毒，第五回合一開始失血10，第五回合沒中毒，第六回合一開始失血0
公式：單次中毒傷害計算方式：0.01*lvl + 0.02* 敏捷 + 0.03*智力 + 10
中毒機率：( (0.02*技能等級) + 0.1)*100% 
中毒成功：攻擊者名稱使出技能名稱，被攻擊者名稱中毒
中毒傷害：毒素使被攻擊者名稱受到xxx點傷害 
*/
function poison($p, $m)
{
			$ret ="";
			$poison = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="poison")
				{			
					$posionchance = ((0.02*$val[skill_lvl]) + 0.1) * 100; //中毒機率：( (0.02*技能等級) + 0.1)*100% 
					if(rand(1,100) < $posionchance  )
					{						
						$manause = 12 + 3.5 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{		
								$poison =round( 0.01 * $p[p_lv] + 0.02 * $p[p_agl] + 0.03 * $p[p_smart] + 10);
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ".$m[p_name]." 中毒!</span><br/>
								<span class=\"messagetext2\">
								毒素使 ".$m[p_name]." 受到 ".$poison." 點傷害</span><br/>
								" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
					}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'poison'=>  $poison
			);
			//test print_r ($retary);
			return $retary;			
}


/*
weaken
技能名稱：虛弱
說明：降低被攻擊人物攻擊力
技能型態：主動
消耗精神力：12 + 3*技能等級
運作方式：使用後使敵人「虛弱」，敵人攻擊力降低10% 5回合 ，技能效果不可重複計算
公式：敵方攻擊力 -> (1 - 0.03*技能等級)*(敵方攻擊力) 
虛弱：攻擊者名稱使出技能名稱，被攻擊者名稱攻擊力降低
*/
function weaken($p, $m)
{
			$ret ="";
			$weaken = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="weaken")
				{			
						$manause = 12 + 3 * $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
								$weaken = ( 1 + (0.03*$val[skill_lvl])) * $m[p_at];
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name].
								" 使出 ".$val[skill_name]." ".$m[p_name]." 攻擊力降低!</span><br/>" ;			
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'weaken'=>  $weaken
			);
			//test print_r ($retary);
			return $retary;			
}


/*
?????????????? x 20090312 
技能名稱：必殺
技能型態：被動
消耗精神力：0
說明：增加必殺攻擊機率
運作方式：戰鬥每回合開始前，增加使用者出現必殺攻擊的機率15%
公式：原本必殺攻擊機率 + 必殺技能增加機率（15%） 
攻擊者名稱使出技能名稱，必殺攻擊機率提昇
*/
function tokill($p)
{
			$ret ="";
			$tokill = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="tokill")
				{			
							if(rand(1,100) < 15) // -- temp test code
							{
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name]." 使出 ".$val[skill_name]." 必殺攻擊機率提昇 !</span><br/>" ;			
							}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'tokill'=>  $tokill
			);
			//test print_r ($retary);
			return $retary;			
}


/*
deductDamage
技能名稱：減傷
說明：減少受到的傷害
技能型態：主動
消耗精神力：5 + 5*技能等級
運作方式：使用後3回合內受到攻擊時，最多只受到原本傷害的90%，最少60%
公式：傷害值： 原本傷害 – (原本傷害*(0.1 + (0.03*技能等級))  
檢傷：攻擊者名稱使出技能名稱，所受傷害減少
*/
function deductDamage($p, $damage)
{
			$ret ="";
			$deductDamage = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="deductDamage")
				{
						$manause = 5 + 5* $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
							if(rand(1,100) > 50) //每回合有50%機率觸發 
							{					
								$deductDamage = $damage - ( $damage * 0.1 + (0.03*$val[skill_lvl]));
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name]." 使出 ".$val[skill_name]." 所受傷害減少; 傷害".$damageAfterDeduct." 點體力 !</span><br/>" ;			
							}
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'deductDamage'=>  $deductDamage
			);
			//test print_r ($retary);
			return $retary;			
}

	
/*
getHP
技能名稱：回血
說明：恢復血量
技能型態：主動
消耗精神力：5 + 5*技能等級
運作方式：每回合開始時有50%機率觸發「回血」技能
公式：增加血量： 10*技能等級 + 0.5*lvl + 0.08*體力 + 10 ]
msg : 攻擊者名稱使出技能名稱，恢復xxx點體力
*/	
function getHP($p)
{
			$ret ="";
			$getHP = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="getHP")
				{
						$manause = 5 + 5* $val[skill_lvl] ;
						if($this->deductMana($p, $manause)>=0) // -- evil deduct mana before calc the chance
						{						
							if(rand(1,100) > 50) //每回合有50%機率觸發 
							{					
								//公式：10*技能等級 + 0.5*lvl + 0.08*體力 + 10 ])
								$getHP = 10 * $val[skill_lvl] + 0.5 * $p[lv] + 0.08 * $p[hp] + 10; 
								$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$p[p_name]." 使出 ".$val[skill_name]." 恢復 ".$getHP." 點體力 !</span><br/>" ;			
							}
						}else 
						{
							$ret = "  <span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'getHP'=>  $getHP
			);
			//test print_r ($retary);
			return $retary;			
}
	
	function addattack($p)
	{
/*
addattack
技能名稱：強襲
說明：全力攻擊敵人
技能型態：主動
消耗精神力：12 + 3*技能等級
// 消耗精神力：15 + 5*技能等級 [edited 20090720]
運作方式：使用後攻擊敵人的攻擊力增加（效果只有一次）
公式：攻擊力 -> (1 + 2. 5*技能等級)*(攻擊力)
// 公式：攻擊力 -> (1 + 0.18*技能等級)*(攻擊力) [edited 20090720]
msg : 攻擊者名稱使出技能名稱
*/		
			$ret ="";
			$addattack = 0;
			foreach ($p['skillset'] as $key => $val) 
			{					
				
				if($val[skill_type]=="addattack")
				{
					$manause = 15 + 5* $val[skill_lvl] ;
					if($this->deductMana($p, $manause) >= 0)
						{
							$addattack += (1 + 0.18 * $val[skill_lvl]) *$p[p_at]; 
							$ret = "<script>skill_effect('".$val[skill_animat_img]."');</script><span class=\"messagetext2\">".$p[p_name]." 使出 ".$val[skill_name]." !</span><br/>" ;			
						}else 
						{
							$ret = "<span class=\"messagetext1\">".$p[p_name]." 精神力 不夠使用 ".$val[skill_name]." !</span><br/>" ;			
						}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'addattack'=>  $addattack
			);
			//test print_r ($retary);
			return $retary;		
	}
	
	function dodge($m)
	{	
// -- skill effect // 20090303 主動 and 90 % for   testing
		/*
技能名稱：閃避
說明：閃避對方攻擊
技能型態：被動
消耗精神力：0
運作方式：每回合有10%機率觸發，觸發後該回合
玩家的閃避率增加
公式：閃避率增加 -> ((0.02*技能等級) + 0.1)*100% 		
msg :攻擊者名稱使出技能名稱，閃避機率增加提昇
		*/		
			$ret ="";
			$dodge = 0;
			foreach ($m['skillset'] as $key => $val) 
			{					
				if($val[skill_type]=="dodge")
				{
					if(rand(1,100) < 10) //每回合有10%機率觸發 
					{
						$dodge += ((0.02*$val[skill_lvl])+0.1)*100; //公式：閃避率增加 -> ((0.02*技能等級) + 0.1)*100% 		
						$ret = "<script>skill_effect('".$val[skill_animat_img]."')</script><span class=\"messagetext2\">".$m[p_name]."使出 ".$val[skill_name]." 閃避機率增加提昇!</span><br/>" ;			
					}
				}			
			}	
			
			$retary = array(
					'msg'=> $ret, 'dodge'=>  $dodge
			);
			//test	print_r ($retary);
			return $retary;
	}
	
function deductMana($p, $manatodeduct)
{
		global $DB_site;	
	$toRetrun = false;
	$theupdatedmn = $p['p_mn'] - $manatodeduct;
	if($theupdatedmn < 0)
		$theupdatedmn = -1;
	else
	{
		$toRetrun = $DB_site->query("
		UPDATE `a3k_player` SET `p_mn` = '".$theupdatedmn."' WHERE `a3k_player`.`p_id` ='".$p[p_id]."' LIMIT 1 ;");	
	}
	
	return $theupdatedmn;
}
	
	function getPlayersUsableSkills($pid)
	{

		global $DB_site;
		$daskill= $DB_site->query("
		SELECT s.skill_id, s.skill_active, s.skill_lvl, s.skill_type, s.skill_effect_turns, s.skill_name , s.skill_img, 
		s.skill_animat_img, s.skill_point, s.role_skillpointmax
		 FROM `a3k_skill` as s  where user_id = '".$pid."'  and s.skill_point >= s.role_skillpointmax ");
	
				while($rows =$DB_site->fetch_array($daskill))
				{
					if($rows[skill_active] == 0 ) //主動技能
					{
						if($rows[skill_effect_turns] > 0) 
						// -- add to array which is activated
						// -- deduct the effect turns
						// -- update the short cut status; so the short cut can be use again
						{
							$DB_site->query(" UPDATE a3k_shortcut SET sc_status = '0' WHERE p_id = '".$pid."' and sc_type ='1' and sc_type_id = '".$rows[skill_id]."' LIMIT 1 ");					
							$DB_site->query(" UPDATE `a3k_skill` SET `skill_effect_turns` = `skill_effect_turns` - 1 where skill_id = '".$rows[skill_id]."'  ");						
							$res[]=$rows ;
						}
					}else
						$res[]=$rows ;			//被動技能	
				}	
	  
		return $res;							
	}
	
	
	function clearActiveSkillEffectTurns($pid)
	{
		global $DB_site;
		$DB_site->query(" UPDATE `a3k_skill` SET `skill_effect_turns` = 0 where user_id = '".$pid."' and skill_active = 0 ");						
	}
	
	
	function useshortcutskill($scid)
	{// -- set skill effect turn to skill_default_turn
		try
		{		
				global $DB_site;
				$res = $DB_site->query(" 
				UPDATE `a3k_skill` SET skill_effect_turns = skill_effect_turns + skill_default_turns 
				where skill_id = '".$scid."'   ");
				return ($res);

		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		    return false;
		}		
	}
	
	function loadskilllist($me)
	{											
		try
		{		
				global $DB_site;
				$fellowlist = $DB_site->query(" SELECT r.role_id ,	r.role_name, s.skill_name, s.skill_img, s.skill_point, s.skill_id, s.role_skillpointmax , s.skill_active
				FROM `a3k_skill` as s ,a3k_role as r WHERE user_id =  '".$me."' and r.role_id = s.role_id");// and r.role_skillpointmax <= s.skill_point
				// -- short cut control skill full filled here
				while($rows =$DB_site->fetch_array($fellowlist))
				{
					$newarray[]=$rows ;
				}
			//	echo("<script language=\"JavaScript\" >dispskilllist(".json_encode($newarray).");</script>");
			echo(json_encode($newarray));
			

		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	
	function addSkillToPlayer($me, $roleid)
	{
		try
		{		
				global $DB_site;
				$sql = "SELECT skill_id
FROM `a3k_skill`
WHERE role_id = '".$roleid."'
AND user_id = '".$me."' ";
				$res = $DB_site->query_first($sql);
				
				if($res)
					return true;
				else 
				{
					$sql =
"INSERT INTO a3k_skill
(role_id, user_id, skill_type, skill_active, skill_default_turns, skill_animat_img, skill_name, skill_img, skill_descr , role_skillpointmax )
SELECT  role_id,  '".$me."' as user_id, skill_type, skill_active, skill_default_turns, skill_animat_img, role_skillname as skill_name, role_skillimg as skill_img, skill_descr , role_skillpointmax
FROM a3k_role
WHERE role_id = '".$roleid."' ";
					return( $DB_site->query($sql));					
				}				
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}		
	}
	
	function gettheskillinfo($theid)
	{
				global $DB_site;
				$sql = "SELECT skill_id, skill_name, skill_descr
FROM `a3k_skill`
WHERE skill_id = '".$theid."' ";
				$res = $DB_site->query_first($sql);
				echo(json_encode($res));
	}
	
}
?>