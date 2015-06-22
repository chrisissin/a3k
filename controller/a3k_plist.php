<?PHP

include_once("../utilities/function.php");
include_once("../utilities/global.php");	


class plist_class
{

	function getpinfo($me)
	{
		
		global $DB_site;
		$daPlayerShit = $DB_site->query_first(
 " SELECT p.p_img, p.p_name, p.p_lv, p.p_rankname, p.p_exp, p.p_nextexp, p.p_map, p.p_win, p.p_lost, p.p_money, p.p_hp, p.p_mn, p.p_hpmax, p.p_mnmax, p.p_str, p.p_smart, p.p_agl, p.p_vit, p.p_bone, p.p_at, p.p_df, p.pf_id, p.role_id, p.p_hpmax, p.p_mnmax, m.map_state_name, m.map_city_name, r.role_id, r.role_name, g.g_name, s.role_skillpointmax, s.skill_point
FROM `a3k`.`a3k_player` AS p
LEFT JOIN a3k_group g ON g.g_id = p.p_guild
LEFT JOIN a3k_skill s ON s.user_id = p.p_id
AND s.role_id = p.role_id, `a3k`.`a3k_map` AS m, `a3k`.`a3k_role` AS r
WHERE p.p_id = '".$me."'
AND p.p_map = m.map_id
AND p.role_id = r.role_id
LIMIT 1    ");
 		//$daguild = $DB_site->query_first("SELECT q.g_name as p_guild from a3k_player as p , a3k_group as q where p.p_id= ".$me." and p.p_guild = q.g_id ");
 		//$daPlayerShit[p_guild] = $daguild[p_guild];
 		echo json_encode($daPlayerShit);
	}	
		
			function getplist($me,$sname,$from, $to){
      		global $DB_site;
      		if($sname ==""){
	       	$plst = $DB_site->query("
 SELECT a3k_player.p_id, a3k_player.p_name, a3k_player.p_lv, a3k_player.role_id, a3k_role.role_name
FROM a3k_player, a3k_role
WHERE a3k_role.role_id = a3k_player.role_id
AND a3k_player.p_map = (
SELECT p_map
FROM a3k_player
WHERE p_id = ".$me." )
AND (a3k_player.p_lv <= (
SELECT p_lv
FROM a3k_player
WHERE p_id = ".$me." ) +3
OR a3k_player.p_lv >= (
SELECT p_lv
FROM a3k_player
WHERE p_id = ".$me." ) -3)
 LIMIT ".$from.",".$to);	       	
				}else
				{
$plst = $DB_site->query("SELECT a3k_player.p_id, a3k_player.p_name , a3k_player.p_lv, a3k_player.role_id , a3k_role.role_name
FROM a3k_player , a3k_role
WHERE a3k_player.p_name LIKE '%".$sname."%'
  and a3k_role.role_id = a3k_player.role_id
 LIMIT ".$from.",".$to);					
				}
 				while($rows =$DB_site->fetch_array($plst))
				{
					$ppllist[] = $rows;	
				} 	
					echo (json_encode($ppllist));
      }

		
}

?>