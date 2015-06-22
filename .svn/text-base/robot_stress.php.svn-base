<?php
//$servername='192.168.3.109';
$servername='127.0.0.1';
$dbusername='root';
$dbpassword='1001ya';
$dbname='a3k';
$connect=mysql_connect($servername,$dbusername,$dbpassword) or die ("connect db error.");
mysql_select_db($dbname,$connect) or die ("use db error.");

$howmany =$_POST['howmany'];
$beg = time();
for($i = 0 ; $i <= $howmany; $i++)
{
		$user_id = rand(1003,1300);

	$f_a =$d_d=$f_lv=$d_lv=99;
	
		$temp_at=($f_a/$d_d);
		$temp_lv=$f_lv-$d_lv;
		if($temp_at < 0){$temp_at=1;}
		if($temp_lv < 0){$temp_lv=1;}
		$temp_d=(($f_a*$temp_at)-$d_d)*$temp_s;
		if($temp_d<=0){$temp_d=1;}
		$temp_rd=$temp_d/$f_a;
		$temp_d=$temp_d+($temp_rd*rand(1,$temp_lv));	





	//	echo $user_id .";";


 $query = mysql_query("  SELECT m.p_id, m.p_name
FROM a3k_monster AS m, a3k_player AS p
WHERE p.p_id=".$user_id." 
AND m.p_map = p.p_map");

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
		
	}
	
	$end = time();
	///////////////////////////////////////`~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$outs = "C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqld-nt, Version: 5.0.67-community-nt-log (MySQL Community Edition (GPL)). started with:
TCP Port: 3306, Named Pipe: (null)
Time                 Id Command    Argument
090320 14:49:32	      2 Connect     root@localhost on 
		      3 Connect     root@localhost on 
		      1 Connect     root@localhost on 
		      4 Connect     root@localhost on 
		      4 Init DB     a3k
		      2 Init DB     a3k
		      4 Query       SET NAMES utf8
		      3 Init DB     a3k
		      2 Query       SET NAMES utf8
		      1 Init DB     a3k
		      1 Query       SET NAMES utf8
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      1 Query       SET CHARACTER_SET_CLIENT=utf8
		      4 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Connect     root@localhost on 
		      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      1 Query       SET CHARACTER_SET_RESULTS=utf8
		      4 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       select sc_id, sc_pos, sc_type, sc_status,  sc_type_id, sc_img, sc_usename
				from a3k_shortcut
				where p_id = '2'
		      4 Query       select  m.map_state_name, m.map_city_name, m.map_id, m.map_html, m.map_img , p.p_id from a3k_map as m , a3k_player as p where p.p_id = 2 and p.p_map = m.map_id
		      1 Query       SELECT p.p_img, p.p_r_money, p.p_exp, p.p_name, p.p_lv, p.p_rankname, p.p_money, r.role_name
  FROM `a3k_player` as p , `a3k`.`a3k_role` as r where p.p_id= 2 and p.role_id = r.role_id
		      2 Query       SELECT q_title,q_id
                      FROM `a3k_quest` WHERE q_id IN (select q_id FROM `a3k_quest_status` WHERE p_id='2' AND q_status=1 )
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:49:33	      6 Connect     root@localhost on 
		      6 Init DB     a3k
		      6 Query       SET NAMES utf8
		      6 Query       SET CHARACTER_SET_CLIENT=utf8
		      6 Query       SET CHARACTER_SET_RESULTS=utf8
		      6 Query       select map_id, map_city_name from a3k_map where map_state_name ='²D¦{'
090320 14:49:43	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:49:53	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:03	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:13	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:23	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:33	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:43	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:50:54	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:04	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:14	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:24	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:34	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:44	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:51:54	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:52:04	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:52:14	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:52:24	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:52:34	      5 Init DB     a3k
		      5 Query       SET NAMES utf8
		      5 Query       SET CHARACTER_SET_CLIENT=utf8
		      5 Query       SET CHARACTER_SET_RESULTS=utf8
		      5 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 14:52:44	      7 Connect     root@localhost on 
		      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:04:04	      8 Connect     root@localhost on 
		      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '1'
090320 15:04:18	      9 Connect     root@localhost on 
		      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:04:29	      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:04:39	      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:04:49	      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:04:54	      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:04	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:15	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:25	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:35	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:45	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:05:55	      7 Init DB     a3k
		      7 Query       SET NAMES utf8
		      7 Query       SET CHARACTER_SET_CLIENT=utf8
		      7 Query       SET CHARACTER_SET_RESULTS=utf8
		      7 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:06:05	      8 Quit       
		      1 Quit       
		      2 Quit       
		      9 Quit       
		      6 Quit       
		      5 Quit       
		      7 Quit       
		      3 Quit       
		      4 Quit       
090320 15:06:06	     10 Connect     root@localhost on 
		     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:06:13	     11 Connect     root@localhost on 
		     11 Init DB     a3k
		     11 Query       SET NAMES utf8
		     11 Query       SET CHARACTER_SET_CLIENT=utf8
		     11 Query       SET CHARACTER_SET_RESULTS=utf8
		     11 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:06:23	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:06:33	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:06:43	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:06:53	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:03	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:13	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:23	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:33	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:43	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:07:53	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:03	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:13	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:23	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:33	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:44	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:08:54	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:04	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:14	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:24	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:34	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:44	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:09:54	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:04	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:14	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:24	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:34	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:44	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:10:54	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:11:04	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
090320 15:11:14	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '5'
C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqld-nt, Version: 5.0.67-community-nt-log (MySQL Community Edition (GPL)). started with:
TCP Port: 3306, Named Pipe: (null)
Time                 Id Command    Argument
090320 15:23:23	      1 Connect     root@localhost on 
		      1 Init DB     a3k
		      1 Query       SET NAMES utf8
		      1 Query       SET CHARACTER_SET_CLIENT=utf8
		      1 Query       SET CHARACTER_SET_RESULTS=utf8
		      1 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:23:34	      2 Connect     root@localhost on 
		      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:23:45	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:23:55	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:06	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:16	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:27	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:37	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:47	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:24:58	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:08	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:18	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:28	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:38	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:48	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:25:58	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:08	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:18	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:28	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:38	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:48	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:26:58	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:08	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:18	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:28	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:38	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:48	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:27:58	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:08	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:18	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:29	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:39	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:49	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:28:59	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:09	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:19	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:29	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:39	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:49	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:29:59	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:30:09	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:30:20	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:30:30	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:30:40	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:30:50	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:00	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:11	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:21	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:31	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:41	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:31:51	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:01	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:11	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:21	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:31	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:41	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:32:51	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:01	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:12	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:22	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:32	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:42	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:33:52	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:02	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:12	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:22	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:32	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:42	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:34:52	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:02	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:12	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:22	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:32	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:42	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:35:52	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:02	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:12	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:22	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:32	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:42	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:36:52	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
090320 15:36:53	      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:03	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:13	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:23	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:33	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:43	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:37:53	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:03	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:13	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:23	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:33	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:43	      2 Init DB     a3k
		      2 Query       SET NAMES utf8
		      2 Query       SET CHARACTER_SET_CLIENT=utf8
		      2 Query       SET CHARACTER_SET_RESULTS=utf8
		      2 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:38:53	      3 Connect     root@localhost on 
		      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:39:03	      4 Connect     root@localhost on 
		      4 Init DB     a3k
		      4 Query       SET NAMES utf8
		      4 Query       SET CHARACTER_SET_CLIENT=utf8
		      4 Query       SET CHARACTER_SET_RESULTS=utf8
		      4 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:39:13	      4 Init DB     a3k
		      4 Query       SET NAMES utf8
		      4 Query       SET CHARACTER_SET_CLIENT=utf8
		      4 Query       SET CHARACTER_SET_RESULTS=utf8
		      4 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '3'
090320 15:39:24	      5 Connect     Access denied for user '192.168.0.178'@'localhost' (using password: YES)
090320 15:39:33	      6 Connect     Access denied for user '192.168.0.178'@'localhost' (using password: YES)
090320 15:40:27	      7 Connect     Access denied for user '192.168.0.178'@'localhost' (using password: YES)
090320 15:42:17	      8 Connect     root@localhost on 
		      8 Init DB     a3k
		      8 Query       SET NAMES utf8
		      8 Query       SET CHARACTER_SET_CLIENT=utf8
		      8 Query       SET CHARACTER_SET_RESULTS=utf8
		      8 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:42:21	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:42:28	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:42:31	      9 Connect     root@localhost on 
		      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:42:38	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:42:41	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:42:48	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:42:51	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:42:58	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:01	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:08	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:11	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:18	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:21	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:28	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:31	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:38	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:41	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:48	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:43:51	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:43:58	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:02	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:08	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:13	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:18	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:23	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:28	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:33	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:38	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:43	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:48	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:44:54	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:44:58	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:04	      3 Init DB     a3k
		      3 Query       SET NAMES utf8
		      3 Query       SET CHARACTER_SET_CLIENT=utf8
		      3 Query       SET CHARACTER_SET_RESULTS=utf8
		      3 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '6'
090320 15:45:08	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:18	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:28	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:38	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:48	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:45:58	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:08	      9 Init DB     a3k
		      9 Query       SET NAMES utf8
		      9 Query       SET CHARACTER_SET_CLIENT=utf8
		      9 Query       SET CHARACTER_SET_RESULTS=utf8
		      9 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:19	     10 Connect     root@localhost on 
		     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:29	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:39	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:49	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:46:59	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
090320 15:47:09	     10 Init DB     a3k
		     10 Query       SET NAMES utf8
		     10 Query       SET CHARACTER_SET_CLIENT=utf8
		     10 Query       SET CHARACTER_SET_RESULTS=utf8
		     10 Query       SELECT p_map, p_guild, p_team, p_blacklist FROM a3k_player WHERE p_id = '2'
C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqld-nt, Version: 5.0.67-community-nt-log (MySQL Community Edition (GPL)). started with:
TCP Port: 3306, Named Pipe: (null)
Time                 Id Command    Argument
090714 12:17:21	      1 Connect     root@localhost on 
		      1 Query       SELECT VERSION()
090714 12:17:22	      1 Query       SET NAMES utf8
		      1 Query       SET collation_connection = 'utf8_unicode_ci'
		      1 Query       SET NAMES utf8
		      1 Query       SET collation_connection = 'utf8_unicode_ci'
		      1 Query       SHOW SESSION VARIABLES LIKE 'collation_connection'
		      1 Query       SHOW SESSION VARIABLES LIKE 'character_set_connection'
		      1 Query       SHOW CHARACTER SET
		      1 Query       SHOW COLLATION
		      1 Query       SHOW DATABASES
		      1 Quit       
		      2 Connect     root@localhost on 
		      2 Query       SELECT VERSION()
		      2 Query       SET NAMES utf8
		      2 Query       SET collation_connection = 'utf8_unicode_ci'
		      2 Query       SET NAMES utf8
		      2 Query       SET collation_connection = 'utf8_unicode_ci'
		      2 Query       SHOW SESSION VARIABLES LIKE 'collation_connection'
		      2 Query       SHOW SESSION VARIABLES LIKE 'character_set_connection'
		      2 Query       SHOW CHARACTER SET
		      2 Query       SHOW COLLATION
		      2 Query       SHOW DATABASES
		      3 Connect     root@localhost on 
		      3 Query       SELECT VERSION()
		      3 Query       SET NAMES utf8
		      3 Query       SET collation_connection = 'utf8_unicode_ci'
		      3 Query       SET NAMES utf8
		      3 Query       SET collation_connection = 'utf8_unicode_ci'
		      3 Query       SHOW SESSION VARIABLES LIKE 'collation_connection'
		      3 Query       SHOW SESSION VARIABLES LIKE 'character_set_connection'
		      3 Query       SHOW CHARACTER SET
		      3 Query       SHOW COLLATION
		      3 Query       SHOW DATABASES
		      3 Query       SELECT COUNT(*) FROM mysql.user
		      2 Query       SHOW TABLES FROM `a3k`
		      2 Query       SHOW TABLES FROM `aoh`
		      2 Query       SHOW TABLES FROM `coreuser2`
		      2 Query       SHOW TABLES FROM `funland`
		      2 Query       SHOW TABLES FROM `mysql`
		      2 Query       SHOW TABLES FROM `test`
		      2 Query       SHOW TABLES FROM `test1`
		      2 Query       SHOW TABLES FROM `wog`
		      3 Query       SELECT COUNT(*) FROM mysql.user
		      3 Query       SHOW GRANTS
		      2 Quit       
		      3 Query       SELECT COUNT(*) FROM mysql.user
		      3 Query       SELECT USER()
		      3 Query       SHOW MASTER LOGS
		      3 Quit       
090714 12:17:25	      4 Connect     root@localhost on 
		      4 Query       SELECT VERSION()
		      4 Query       SET NAMES utf8
		      4 Query       SET collation_connection = 'utf8_unicode_ci'
		      4 Query       SET NAMES utf8
		      4 Query       SET collation_connection = 'utf8_unicode_ci'
		      4 Query       SHOW SESSION VARIABLES LIKE 'collation_connection'
		      4 Query       SHOW SESSION VARIABLES LIKE 'character_set_connection'
		      4 Query       SHOW CHARACTER SET
		      4 Query       SHOW COLLATION
		      4 Query       SHOW DATABASES
		      5 Connect     root@localhost on 
		      5 Query";
	///////////////////////////////////////`~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	$outdate[sss] = $outs;
	$outdate[time] = $end- $beg;
	echo json_encode($outdate);
?>
