<?PHP

include_once("../utilities/function.php");
include_once("../utilities/global.php");	


class brohood_class
{
	
			function insertReferedFriends($me){
      		global $DB_site;
      		$b4insertnew = $DB_site->query_first("select count(p_id) from a3k_brohood where p_id = ".$me);   
	       	$list1 = $DB_site->query("insert into a3k_brohood (p_id, b_p_id) 
	       	(select promo_code as p_id, p_id as b_p_id from a3k_player
	       	 where promo_code = ".$me.") 
	       	on duplicate key update  a3k_brohood.p_id  = ".$me." ");	 
	       	$affected =  mysql_affected_rows();
	       	if($affected  > 0)
	       	$this->givereferalaward($b4insertnew[0],$affected, $me );
      }
      
      function givereferalaward($lastcount, $affected, $me)
      {
      	global $DB_site;
      	$theaward = $DB_site->query("select next_ref,	award_itemid,	award_item_no from a3k_referral_award where 1");   
 				while($rows =$DB_site->fetch_array($theaward))
				{
					$awardlist[] = $rows;	
				}       	
				include_once('../controller/a3k_store_control.php');
				$x_store = new x_store_control();		
				for($i = 0; $i <= count(	$awardlist ); ++$i)
				{
					if($lastcount+$affected >= $awardlist[$i]["next_ref"])
					{/*
						$affected = $awardlist[$i+1]["next_ref"] - $awardlist[$i]["next_ref"];
						$lastcount = $awardlist[$i]["next_ref"];
*/
						for($j= 0; $j< $awardlist[$i]["award_item_no"]; ++$j)
						{
							$x_store->Specialpackinsert($me, $awardlist[$i]["award_itemid"]);	
						}
					}
				}		
      }
		
      function getBroInfo($me, $from, $to){
      		global $DB_site;
      		$this->insertReferedFriends($me);
	       	$broinfo = $DB_site->query("SELECT a3k_player.p_id, a3k_player.p_name , a3k_player.p_lv, a3k_player.role_id , a3k_role.role_name
FROM a3k_player , a3k_role
WHERE a3k_player.p_id
IN (
SELECT b_p_id
FROM a3k_brohood
WHERE p_id =
 ".$me." ) and a3k_role.role_id = a3k_player.role_id
 LIMIT ".$from.",".$to);
 				while($rows =$DB_site->fetch_array($broinfo))
				{
					$brolist[] = $rows;	
				} 	
					echo (json_encode($brolist));
      }
		
}

?>