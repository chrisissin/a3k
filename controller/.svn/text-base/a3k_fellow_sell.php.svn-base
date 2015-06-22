<?php
class a3k_fellow_sell
{
	function getfellowlist()
	{
		global $DB_site;
		$fellowlist=$DB_site->query("SELECT fl_id, p_name,p_img FROM a3k_fellowshop WHERE fl_cash >0");
		while($rows=$DB_site->fetch_array($fellowlist))
		{
			$newarray[]=$rows;
		}
		echo (json_encode($newarray));
	}
	function getfellowsinfo($fl_id)
	{
		global $DB_site;
		$fellowinfo=$DB_site->query_first("SELECT f.fl_cash,f.p_at, f.p_df, f.p_agl, f.p_str, f.p_smart, f.p_vit, f.p_bone, f.p_hpmax, f.p_mnmax, r.role_name
			FROM a3k_fellowshop AS f, a3k_role AS r
			WHERE f.role_id = r.role_id and f.fl_id=".$fl_id);
		echo json_encode($fellowinfo);
	}	
	
	function fellowsell($me,$who)
	{
		global $DB_site;
		$player=$DB_site->query_first("SELECT p_money FROM a3k_player WHERE p_id=".$me);
		$fellow=$DB_site->query_first("SELECT fl_cash,p_name FROM a3k_fellowshop WHERE fl_id=".$who);
		if ($fellow["fl_cash"] > $player["p_money"])
		{
			echo ("金額不足!");
			return ;
		}
		else
		{
			include_once("../controller/a3k_fellow_control.php");
			$fcomtrol = new fellow_class();
			if($fcomtrol->getfellow($who, $me))
			{	
				$newdollar = $player["p_money"]-$fellow["fl_cash"];
				$sql ="UPDATE a3k_player SET p_money =".$newdollar." WHERE p_id=".$me;
				$DB_site->query($sql);
				echo "成功僱用".$fellow["p_name"];
				return;
			}else
				{
					echo "你已擁有10個武將";
					return;
				}
			
		}
	}
}
?>