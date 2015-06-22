<?php
class a3k_act_present{
    function get_present($user_id,$user_source)
	 {
	 		global $DB_site;
			
			$sqlpd = "select * from a3k_presented_df where ps_source='".$user_source."' and expireddate is null";
			$DB_site->query($sqlpd);
			$present = $DB_site->query($sqlpd);
			while($presents=$DB_site->fetch_array($present))
			{				
				include_once("../controller/a3k_store_control.php");
				$addd = new x_store_control;					
				if($presents['class']==0)
				{
					$addd->Specialpackinsert($user_id,$presents['ps_did'] );				
				}
				if($presents['class']==1)
				{
					$DB_site->query("update a3k_player set p_money=p_money+".$presents['ps_did']." where p_id=".$user_id."");
				}				
			}
	 }
}
?>