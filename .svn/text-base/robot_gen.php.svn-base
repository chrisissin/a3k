<?php
$servername='127.0.0.1';
$dbusername='root';
$dbpassword='1001ya';
$dbname='a3k';
$connect=mysql_connect($servername,$dbusername,$dbpassword) or die ("connect db error.");
mysql_select_db($dbname,$connect) or die ("use db error.");

$query = mysql_query('SET NAMES utf8;'); 
$query = mysql_query('SET CHARACTER_SET_CLIENT=utf8;'); 
$query = mysql_query('SET CHARACTER_SET_RESULTS=utf8;');


			$list = explode(",", file_get_contents("C:\\bot.txt"));

			$mail="robot@1001ya.com.tw";
			$pid=1000;
			
			
				$query = mysql_query("select map_id from a3k_map where 1 ") or die("Erro!");
				$mapres = mysql_fetch_array($query);	

			for ($i=0;$i< sizeof($list); $i++)
			{
		
			
				$query = mysql_query("INSERT INTO `a3k`.`a3k_player` (
`p_id` ,
`p_capt_attempts` ,
`p_locktime` ,
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
'".$pid."' , '0', NULL , '".$list[$i]."', '20', '20', '10', '10', '10', '10', '50', '50', 'a01', '100', '1', '90', '100', '1', '1', '".rand(0,1)."',
 'p0050', NULL , NOW() , '".$mapres[array_rand($mapres)]."', '0', 'robot', '30', '30', NULL , '墨門弟子', '10', NULL , '0', '0', '', '25', '25', '25', '25', '0', '0', NULL
);
");
			echo $p_id;
			$pid++;
			
		}


