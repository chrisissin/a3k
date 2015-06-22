<?php
//$servername='192.168.3.109';
//$servername='192.168.3.122';
$servername='127.0.0.1';
$dbusername='root';
$dbpassword='1001ya';
$dbname='a3k';
$connect=mysql_connect($servername,$dbusername,$dbpassword) or die ("connect db error.");
mysql_select_db($dbname,$connect) or die ("use db error.");

$howmany =10000;//rand(5,10);
$beg = time();
for($i = 0 ; $i <= $howmany; $i++)
{
		$user_id = 1003;//rand(1003,1339);
/*
	$f_a =$d_d=$f_lv=$d_lv=99;
	
		$temp_at=($f_a/$d_d);
		$temp_lv=$f_lv-$d_lv;
		if($temp_at < 0){$temp_at=1;}
		if($temp_lv < 0){$temp_lv=1;}
		$temp_d=(($f_a*$temp_at)-$d_d)*$temp_s;
		if($temp_d<=0){$temp_d=1;}
		$temp_rd=$temp_d/$f_a;
		$temp_d=$temp_d+($temp_rd*rand(1,$temp_lv));	

*/


	//	echo $user_id .";";


 $query = mysql_query("  SELECT m.p_id, m.p_name
FROM a3k_monster AS m, a3k_player AS p
WHERE p.p_id=".$user_id." ");
/*
 $query = mysql_query( "  select a.p_id, a.p_name,a.p_hp,a.p_hpmax
		,a.p_img, p_map
		, a.p_mn , a.p_mnmax , a.pf_id , a.role_id
		from a3k_player a   
		where p_id='".$user_id."' and p_hp > 0") or die("Erro!");
		    $query = mysql_query( "       UPDATE `a3k_skill` SET `skill_effect_turns` = 0 where user_id ='".$user_id."' and skill_active = 0");
		   $query = mysql_query(  "       UPDATE `a3k_shortcut` SET `sc_status` = 0 where p_id = '".$user_id."' ") or die("Erro!");
		   $query = mysql_query(  "       select p_id, p_name , p_df  
					,p_hp ,p_hp as p_hpmax, p_img , pf_ids, p_1001_id
					from a3k_monster where p_id = '1' LIMIT 1") or die("Erro!");
		     $query = mysql_query("       select p_id, p_name , p_df  
						,p_hp , p_hpmax, p_img , p_mn, p_mnmax
						from a3k_fellow where p_id = 2 LIMIT 1") or die("Erro!");
		     $query = mysql_query("       select p_id, p_name , p_df  
						,p_hp ,p_hp as p_hpmax, p_img , p_1001_id
						from a3k_monster where p_1001_id = 'a00007'  ORDER BY RAND() LIMIT 1") or die("Erro!");


		     $query = mysql_query("       select p_id, p_name,p_at,p_df,p_agl, 68 as p_hp,p_hpmax,p_lv
		,p_agl, p_smart, p_vit, p_bone, p_str
		,p_exp,p_nextexp,p_img, role_id
		,p_map, p_mn , p_mnmax, pf_id , p_rankname
		from a3k_player    
		where p_id='".$user_id."'") or die("Erro!");
		     $query = mysql_query("       select p_id, p_name ,p_at,p_df 
					,p_agl ,p_lv 
					,30 as p_hp ,p_hp as p_hpmax, p_img , d_id , p_topr , p_1001_id
					from a3k_monster where p_id = 1 LIMIT 1") or die("Erro!");
		     $query = mysql_query("       select p_id, p_name ,p_at,p_df 
				,p_lv 
				,p_agl, p_smart, p_vit, p_bone, p_str
				,70 as p_hp ,p_hp as p_hpmax, p_img , p_mn, p_mnmax
				from a3k_fellow where p_id = 2") or die("Erro!");
				
		     $query = mysql_query("       select p_id, p_name ,p_at,p_df  
					,p_agl ,p_lv 
					, 40 as p_hp ,p_hp as p_hpmax, p_img , d_id , p_topr , p_1001_id
					from a3k_monster where p_id = 7 LIMIT 1") or die("Erro!");
		     $query = mysql_query("       SELECT s.skill_id, s.skill_active, s.skill_lvl, s.skill_type, s.skill_effect_turns, s.skill_name , s.skill_img, 
		s.skill_animat_img, s.skill_point, s.role_skillpointmax
		 FROM `a3k_skill` as s  where user_id ='".$user_id."'  and s.skill_point >= s.role_skillpointmax") or die("Erro!");
		     $query = mysql_query("       UPDATE `a3k`.`a3k_player` SET `p_hp` = '68' WHERE `p_id` = '".$user_id."' LIMIT 1") or die("Erro!");
		     
		     $query = mysql_query("       UPDATE `a3k_player` SET `p_win` = p_win + 1 , p_money = p_money + 2 , p_exp =   156 WHERE `p_id` = '".$user_id."' LIMIT 1") or die("Erro!");
		     $query = mysql_query("       select s.skill_point, s.skill_name, s.role_skillpointmax from a3k_skill as s 
		where s.user_id = '".$user_id."' and s.role_id = 'a01'  LIMIT 1") or die("Erro!");
		     $query = mysql_query("       SELECT  `id`, `item_type1`,`item_type2`, `item_id`, `item_name`, `item_stackable` FROM `a3k_items` WHERE item_id ='i0001'") or die("Erro!");
		     $query = mysql_query("       SELECT p_packsize_3
				FROM `a3k_player` WHERE p_id ='".$user_id."'") or die("Erro!");
		     $query = mysql_query("       SELECT count(*) 
	FROM a3k.a3k_player_item AS pi, a3k.a3k_items AS i
	WHERE pi.p_id = '".$user_id."'
	AND pi.item_id = i.item_id
	AND i.item_type1 = '3'") or die("Erro!");
		     $query = mysql_query("       SELECT *
						FROM `a3k_player_item`
						WHERE item_id = 'i0001'
						AND p_id = '".$user_id."'") or die("Erro!");
		  //   $query = mysql_query("       UPDATE `a3k_player_item` SET `item_stacknum` = `item_stacknum` + 1 WHERE `a3k_player_item`.`id` ='1'") or die("Erro!");
		     $query = mysql_query("       SELECT `p_nextexp` , `p_exp`, `p_lv` FROM `a3k_fellow` WHERE `p_id`=2 LIMIT 1") or die("Erro!") or die("Erro!");
		     
		     $query = mysql_query("       DELETE FROM a3k_quest_status WHERE q_end_time != 0 AND q_end_time < ".time()." ") or die("Erro!") or die("Erro!");
		     $query = mysql_query("       SELECT q_id, q_data FROM a3k_quest_status 
			WHERE p_id = '21' AND q_status = 1 AND q_data is not null");
		     $query = mysql_query("       UPDATE `a3k_skill` SET `skill_effect_turns` = 0 where user_id ='".$user_id."' and skill_active = 0") or die("Erro!");
		     $query = mysql_query("       UPDATE `a3k_shortcut` SET `sc_status` = 0 where p_id = '".$user_id."'") or die("Erro!");
		     $query = mysql_query("       select p_hp , p_hpmax, p_mn, p_mnmax, pf_id from a3k_player where p_id ='".$user_id."'") or die("Erro!");
		     


		   $query = mysql_query(" SELECT a.q_id, a.q_data, b.need_item
		FROM a3k_quest_status a LEFT JOIN a3k_quest_need b ON b.q_id = a.q_id
		WHERE p_id = '".$user_id."' AND q_status = 1 ") or die("Erro!");

		    $query = mysql_query("      SELECT p.p_img, p.p_r_money, p.p_exp, p.p_name, p.p_lv, p.p_rankname, p.p_money, r.role_name
  FROM `a3k_player` as p , `a3k`.`a3k_role` as r where p.p_id= '".$user_id."' and p.role_id = r.role_id ") or die("Erro!");

		     $query = mysql_query("       SELECT p_exp,p_nextexp FROM a3k_player WHERE p_id='".$user_id."'") or die("Erro!");
		*/
	}
	
	$end = time();
	echo $end- $beg.";";
?>
