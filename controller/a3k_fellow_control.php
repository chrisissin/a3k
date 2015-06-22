<?PHP
/*
include_once("../utilities/function.php");
include_once("../utilities/global.php");	
*/

class fellow_class
{
	//@@@@@@@@@@@@@@@@@about fellow@@@@@@@@@@@@@@@@@@@
  //@to get the fellow list of a play 
	function loadfellowlist($me)
	{					
		try
		{		
				global $DB_site;
				$fellowlist = $DB_site->query(" SELECT `p_id` , `p_name` , `p_img`
                      FROM a3k_fellow WHERE p_owner = '".$me."'  ");
				while($rows =$DB_site->fetch_array($fellowlist))
				{
					$newarray[]=$rows ;	
				}
				//echo("<script language=\"JavaScript\" >display_fellow_list(".json_encode($newarray).");</script>");
        echo(json_encode($newarray));
				
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
  

  
 
 //@to get ihe information of a fellow that a player clicked
  function getfellowinfo($fellowid) 
	{
		try{		

					global $DB_site;
					$fellowinfo = $DB_site->query_first("SELECT f.p_img, f.p_name, f.p_lv, f.p_rankname, f.p_exp, f.p_nextexp,f.faith,
          f.p_hp, f.p_mn, f.p_hpmax, f.p_mnmax, f.p_str, f.p_smart, f.p_agl ,f.p_vit, f.p_bone, f.p_at, f.p_df, f.role_id
          , r.role_id, r.role_name
					FROM `a3k_fellow` as f, `a3k_role` as r
					where f.p_id = '".$fellowid."' and f.role_id = r.role_id");
					
				 echo(json_encode($fellowinfo));
       //  echo("<script language=\"JavaScript\" >display_fellow_body(".json_encode($fellowinfo).");</script>");
			 //print_r($finalout);
							
					unset($fellowinfo);		
			}catch (Exception $e) {
    			echo 'Caught exception: ',  $e->getMessage(), "\n";
					}
		
	}
      
  //@to update the fellow that equiped by a player
  
  function equipfellow($flid, $me) 
	{
	try{
		//test 0311 $this->getfellow(1,2);
			global $DB_site;
      $sql="UPDATE `a3k`.`a3k_player` SET `pf_id` = '".$flid."' WHERE `a3k_player`.`p_id` =".$me." LIMIT 1";	
      echo($DB_site->query($sql));
   }catch (Exception $e) {
    	echo 'Caught exception: ',  $e->getMessage(), "\n";
			}	
	}		
    
   //@@2cases  first: level up    second:earm exp woth level up
   function fellowexp($pfid,$FLexpGained)
   {        							
  		try{
  			global $DB_site;
        $next="SELECT `p_nextexp` , `p_exp`, `p_lv` FROM `a3k_fellow` WHERE `p_id`=".$pfid." LIMIT 1 ";
		    $FL=$DB_site->query_first($next);
		    if($FL)
		    {
				    if (($FLexpGained+$FL[p_exp]>$FL[p_nextexp])||($FLexpGained+$FL[p_exp]==$FL[p_nextexp])) // -- check if level up 
				    {
				        $FL[p_exp]=($FLexpGained+$FL[p_exp])-$FL[p_nextexp];//-- the leftover exp point back
		            $sql="UPDATE `a3k_fellow` SET  p_exp =   ".$FL[p_exp] ." WHERE `p_id` = ".$pfid." LIMIT 1 ";
			        	$DB_site->query($sql);
				      //@ $FL[p_lv]++;
				      //@  $sql="UPDATE `a3k`.`a3k_fellow` SET  p_exp =  ".$FL[p_exp]." ,p_lv= ".$FL[p_lv]." WHERE `p_id` = ".$pfid." LIMIT 1 ";
					   //@ $DB_site->query($sql);
					    $FLinfo="SELECT * FROM `a3k_fellow` WHERE `p_id`= '".$pfid."' LIMIT 1 ";
					    $fellow=$DB_site->query_first($FLinfo);
		          $fellow[p_exp]=$FL[p_exp];
		          $this->fellowLvlUp($fellow);
				    }
				    else{
					$sql="UPDATE `a3k_fellow` SET  p_exp = p_exp + ".$FLexpGained." WHERE `p_id` = ".$pfid." LIMIT 1 ";
					$DB_site->query($sql);
						}
				}
			}catch (Exception $e) {
  		  echo 'Caught exception: ',  $e->getMessage(), "\n";
			}	
   }


	function fellowLvlUp($player)
	{
		// todo : check if ready for level up
		// update p_nextexp
		// update p_lv
		// return msg
		/*
update 玩家升級所需經驗值TABLE
玩家每次升級時，會依照目前職業的提昇屬性表隨機提昇各項屬性
升級訊息
後台
體力最大值：玩家等級*5 +根骨*1.5 + 30 (@升級)
精神力最大值：玩家等級*3 + 智力*2 + 7 (@升級)
攻擊力：玩家力量*1.5 + 玩家等級*1 + 4 (@升級)
防禦力：體魄*1.2 + 玩家等級*1 + 7 (@升級)
玩家稱號欄位會顯示玩家在該等級得到的稱號，各等級稱號參照企劃設定的table		
		*/				
	try{
		
		global $DB_site;
		
		$player[p_lv] = $player[p_lv] +1;  // level up	
		$sql= "select level, nextexp, lvl_rankname
		from a3k_lvlchart 
		where level = ".$player[p_lv]."  LIMIT 1 ";
		$res = $DB_site->query_first($sql);
					// test	echo "<script>notifyactionresult($player[p_lv]);</script>";
		$player[p_nextexp] = $res[nextexp]; // next exp up
		$player[p_rankname] = $res[lvl_rankname]; // rank name up
		
		$theups = $this->checkJobChartForLvlUp($player[role_id]);
		
		$player[p_str] = $player[p_str]+$theups["up_str"]; //力量 up
		$player[p_agl] = $player[p_agl]+$theups["up_agl"]; //敏捷 up
		$player[p_smart] = $player[p_smart]+$theups["up_smart"]; //智力 up
		$player[p_vit] = $player[p_vit]+$theups["up_vit"]; //體魄 up
		$player[p_bone] = $player[p_bone]+$theups["up_bone"]; //根骨 up		
				
		$player[p_hpmax] = round(($player[p_lv] * 5 ) + ($player[p_bone] * 1.5) +30); // 體力(HP)公式
		$player[p_mnmax] = round(($player[p_lv] * 3 ) + ($player[p_smart] * 2 ) +7); // 精神力公式
		
		$player[p_at] = round(($player[p_str] *1.5) + ($player[p_lv] * 1)  +4); //攻擊力公式
		$player[p_df] = round(($player[p_vit] *1.2) + ($player[p_lv] * 1)  +7); //防禦力公式
		
		$sql="UPDATE `a3k_fellow` SET 
		    p_lv = " .$player[p_lv] 
		.", p_nextexp = ".$player[p_nextexp]
		.", p_rankname = '".$player[p_rankname]."'"
		.", p_str = ".$player[p_str]
		.", p_agl = ".$player[p_agl]
		.", p_smart = ".$player[p_smart]
		.", p_vit = ".$player[p_vit]
		.", p_bone = ".$player[p_bone]
		.", p_at = ".$player[p_at]
		.", p_df = ".$player[p_df]			
		.", p_hpmax = ".$player[p_hpmax]
		.", p_mnmax = ".$player[p_mnmax]

		." WHERE `p_id` = ".$player[p_id]." LIMIT 1 ";

		$DB_site->query($sql);
		 // test echo "<script>notifyactionresult('裝');</script>";
		$leftovers = $player[p_name]." 升級<br/>";
		echo ("msgonchatboard('武將升級了!');");		
		return $leftovers;
		unset($res);
		}catch (Exception $e) {
    		echo 'Caught exception: ',  $e->getMessage(), "\n";
			}	
}

	function checkJobChartForLvlUp($roleid)
	{
		try{
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
		}catch (Exception $e) {
    		echo 'Caught exception: ',  $e->getMessage(), "\n";
	}	
}

//@@test get fellow
  function getfellow($flid, $me) 
	{
		try{
			global $DB_site;
   
      $fnum="SELECT COUNT(p_id) FROM a3k_fellow WHERE p_owner='".$me."'";
      $fmaxnum=$DB_site->query_first($fnum);
   	 	if ($fmaxnum[0]>=10) {
   			return false;
   		}
   		
      $sql="SELECT * FROM a3k_fellowshop WHERE fl_id= '".$flid."' LIMIT 1 ";
      $FQ=$DB_site->query_first($sql);
      
      $fid="SELECT MAX(p_id) FROM `a3k_fellow`";
      $newfid=$DB_site->query_first($fid);
      $newfid[0]++;
      

      $FLget=" INSERT INTO a3k_fellow (p_owner ,p_id ,p_at ,p_df ,p_agl ,p_rankname ,p_str ,p_smart ,p_vit ,p_bone ,p_name 
      ,p_hp ,p_lv ,p_img ,p_hpmax ,p_mn ,p_mnmax ,p_exp ,p_nextexp ,role_id ,faith, fl_id)
      VALUES (
        '".$me."','".$newfid[0]."' ,'".$FQ[p_at]."','".$FQ[p_df]."','".$FQ[p_agl]."','".$FQ[p_rankname]."','".$FQ[p_str]."','".$FQ[p_smart]."',
        '".$FQ[p_vit]."','".$FQ[p_bone]."','".$FQ[p_name]."','".$FQ[p_hp]."','".$FQ[p_lv]."','".$FQ[p_img]."' ,'".$FQ[p_hpmax]."','".$FQ[p_mn]."',
        '".$FQ[p_mnmax]."','".$FQ[p_exp]."','".$FQ[p_nextexp]."','".$FQ[role_id]."','".$FQ[faith]."','".$FQ[fl_id]."');
        "; 
        $test=$DB_site->query($FLget);
      return $test;

		}catch (Exception $e) {
    		echo 'Caught exception: ',  $e->getMessage(), "\n";
		}	
	}		
	
	function removefellow($me, $fl_id)
	{
						global $DB_site;
						$whoihaveonme = $DB_site->query_first("SELECT pf_id  from a3k_player where p_id = '".$me."'"); 	
						$DB_site->query("update a3k_fellow set p_owner = '".$me * -1 ."'  where p_owner = '".$me."' and p_id = ".$fl_id ."  ");
							
							if($whoihaveonme["pf_id"] == $fl_id)
							{// delete if on player
								 		$DB_site->query("update a3k_player set pf_id = null  where p_id = '".$me."'  ");
							}
							 				
	} 	
}
?>