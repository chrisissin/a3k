<?php

class a3k_pack{
	
	
	function toEquip($theid,$tobeinstalltheitem, $me) // -- 裝備  all
	{


		global $DB_site;
		$allgood = true;
		$sql = "
		SELECT pi.id, i.item_id, `item_type1` , `item_type2` , 
		`item_ef_at` ,
		 `item_ef_df` ,
		  `item_ef_str` ,
		   `item_ef_bone` , 
		   `item_ef_vit` ,
		    `item_ef_agl` ,
		     `item_ef_smart` , 
		     `item_ef_hp` , 
		     `item_ef_mn` , `item_ef_exp` , `item_stackable` , `item_tradable` , `item_price` 
FROM `a3k_items` AS i, a3k_player_item AS pi
WHERE pi.p_id = '".$me."'
AND pi.item_id = i.item_id
AND i.item_type1 = '".$tobeinstalltheitem['item_type1']."'
AND i.item_type2 = '".$tobeinstalltheitem['item_type2']."'
AND pi.item_eq = '1'
";	// 1: select the same type
		$toberemoveditemsarray = $DB_site->query($sql);
		while($rows =$DB_site->fetch_array($toberemoveditemsarray))
		{		// --	should be only one, but just to be sure...
		// 	1: update a3k_player_item
			if($allgood){
			$allgood = $this->eqptItemToPlayer($rows['id'], "0");
		}
		// 	2: update a3k_player minus effects
			if($allgood){
				$allgood = $this->effectOnPlayer($rows, $me, "-");		
			}
		}

		if($allgood){	
			// 2 : update a3k_player_item 
			$mshit = $DB_site->query_first($sql);
			if($allgood){
				$allgood = $this->eqptItemToPlayer($theid, "1");
			}
			
			// 3 : update a3k_player add effects
			if($allgood){
				$allgood = $this->effectOnPlayer($tobeinstalltheitem, $me, "+");		
			}
		}

		return $allgood;
	}
	
	function toAddOn($theid,$tobeinstalltheitem, $me) // -- 道具 – 補血 / 補 MANA / 雙補
	{
			global $DB_site;
			// -- deduct after use of 物品類別1 == 2
			$sql ="
						SELECT item_stacknum
						FROM `a3k_player_item`
						WHERE id = '".$theid."' ";
			$thestackitem = $DB_site->query_first($sql);	
			if($thestackitem[item_stacknum] > 1)		
			{ // -- deduct one if is stacking
				$DB_site->query("UPDATE `a3k_player_item` SET `item_stacknum` = `item_stacknum` -1 WHERE `a3k_player_item`.`id` = '".$theid."' LIMIT 1 ");
			}else
			{ // -- delete the whole item if only one left
				$DB_site->query("DELETE FROM `a3k_player_item` WHERE `a3k_player_item`.`id` = '".$theid."' LIMIT 1");
			}	
			switch ($tobeinstalltheitem['item_type2'])
			{
				case 1:
						return $DB_site->query("UPDATE `a3k_player` SET `p_hp` = `p_hp` + '".$tobeinstalltheitem[item_ef_hp]."'
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");
				break;
				case 2:
						return $DB_site->query("UPDATE `a3k_player` SET `p_mn` = `p_mn` + '".$tobeinstalltheitem[item_ef_mn]."'
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");
				break;
				case 3:
						return $DB_site->query("UPDATE `a3k_player` SET `p_hp` = `p_hp` + '".$tobeinstalltheitem[item_ef_hp]."'
						 , `p_mn` = `p_mn` + '".$tobeinstalltheitem[item_ef_mn]."'
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");
				break;		
				case 4: //經驗單
						return $DB_site->query("UPDATE `a3k_player` SET `p_exp` = `p_exp` + '".$tobeinstalltheitem[item_ef_exp]."'
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");
				break;
				case 6: //背包
						return $DB_site->query("UPDATE `a3k_player` SET 
						`p_packsize_1` = `p_packsize_1` + '".$tobeinstalltheitem[p_packsize_1]."'
						 , `p_packsize_2` = `p_packsize_2` + '".$tobeinstalltheitem[p_packsize_2]."'
						 , `p_packsize_3` = `p_packsize_3` + '".$tobeinstalltheitem[p_packsize_3]."'
						 , `p_packsize_4` = `p_packsize_4` + '".$tobeinstalltheitem[p_packsize_4]."'						 						 
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");						
				break;							
				case 7: //屬性丹
						return $this->effectOnPlayer($tobeinstalltheitem, $me, "+");
				break;				
				case 8: //+遊戲幣
						return $DB_site->query("UPDATE `a3k_player` SET `p_money` = `p_money` + '".$tobeinstalltheitem[p_money]."'
						 WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ");
				break;			
				case 9: //fellow 經驗單
						return $DB_site->query("UPDATE `a3k_fellow` ,
a3k_player SET `a3k_fellow`.`p_exp` = `a3k_fellow`.`p_exp` + '2' WHERE `a3k_player`.`p_id` = '".$me."' AND a3k_fellow.p_id = `a3k_player`.`pf_id` ");
				break;																				
				default:
					return false;
				break;
			}	
	}
	
	function eqptItemToPlayer($id, $onoroff)
	{
		global $DB_site;
		return $DB_site->query("UPDATE `a3k`.`a3k_player_item` SET `item_eq` = '".$onoroff."' 
		WHERE `a3k_player_item`.`id` = '".$id."'  LIMIT 1");
	}
	
	function effectOnPlayer($toberemoveeffet, $me, $effecttype)
	{
			global $DB_site;
	
				$sql="
				UPDATE `a3k`.`a3k_player` SET 
		`p_str` = p_str ".$effecttype." ".$toberemoveeffet['item_ef_str'].",
		`p_vit` = p_vit ".$effecttype." ".$toberemoveeffet['item_ef_vit'].",
		`p_smart` = p_smart ".$effecttype." ".$toberemoveeffet['item_ef_smart'].",
		`p_agl` = p_agl ".$effecttype." ".$toberemoveeffet['item_ef_agl'].",
		`p_bone` = p_bone ".$effecttype." ".$toberemoveeffet['item_ef_bone'].",
		`p_exp` = p_exp ".$effecttype." ".$toberemoveeffet['item_ef_exp']."
		WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ;
		";			
		if($DB_site->query($sql))
		{
			// add to ef at, df, hp nand mn to player's temp field
				$sql="
							UPDATE `a3k`.`a3k_player` SET 
					`p_itemef_at` = `p_itemef_at` ".$effecttype." ".$toberemoveeffet['item_ef_at'].",
					`p_itemef_df` = `p_itemef_df` ".$effecttype." ".$toberemoveeffet['item_ef_df'].",
					`p_itemef_hpmax` = `p_itemef_hpmax` ".$effecttype." ".$toberemoveeffet['item_ef_hp'].",
					`p_itemef_mnmax` = `p_itemef_mnmax` ".$effecttype." ".$toberemoveeffet['item_ef_mn']."
					WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ;
					";
			$DB_site->query($sql);							
			
			$daplayer = $this->calceffects($me); // calculated at, df, hp, mn base on basic attributes

			// re add all itemeffects of at, df, hp, mn from temp field back to player
				$sql="
							UPDATE `a3k`.`a3k_player` SET 
					`p_at` = ".$daplayer[p_at]." + `p_itemef_at` ,
					`p_df` = ".$daplayer[p_df]." + `p_itemef_df` ,
					`p_hpmax` = ".$daplayer[p_hpmax]." + `p_itemef_hpmax` ,
					`p_mnmax` =".$daplayer[p_mnmax]." + `p_itemef_mnmax` 
					WHERE `a3k_player`.`p_id` = '".$me."' LIMIT 1 ;
					";
			return $DB_site->query($sql);	
		}else
			return	false;
	}
	
	function calceffects($me)
	/*
update 玩家升級所需經驗值TABLE
玩家每次升級時，會依照目前職業的提昇屬性表隨機提昇各項屬性
體力最大值：玩家等級*5 +根骨*1.5 + 30 (@升級)
精神力最大值：玩家等級*3 + 智力*2 + 7 (@升級)
攻擊力：玩家力量*1.5 + 玩家等級*1 + 4 (@升級)
 攻擊力公式：力量*1.2 + Lv*0.8 + 4  (@升級)   [edited 20090720]
 
防禦力：體魄*1.2 + 玩家等級* 1+ 7 (@升級)
·  防禦力公式：體魄*1.1 + Lv*1 + 2  (@升級) [edited 20090720] 
防禦力公式：體魄*1.15 + Lv*1.05 + 2 (@升級) [edited 20090721] 
		*/		
	{
			global $DB_site;
			$sql="select * from a3k_player where p_id = '".$me."' ";
			$daplayer = $DB_site->query_first($sql);
			$daplayer[p_hpmax] = round(($daplayer[p_lv] * 5 ) + ($daplayer[p_vit] *1.5) +30); // 體力(HP)公式
			$daplayer[p_mnmax] = round(($daplayer[p_lv] * 3 ) + ($daplayer[p_smart] * 2 ) +7); // 精神力公式
			$daplayer[p_at] = round(($daplayer[p_str] *1.2) + ($daplayer[p_lv] * 0.8)  +4); //攻擊力公式
			$daplayer[p_df] = round(($daplayer[p_vit] *1.15) + ($daplayer[p_lv] * 1.05)  +2); //防禦力公式		
			return 	$daplayer;
	}
		
	
	function init($theid,$itemid, $me)
	{
					global $DB_site;
					$sql = "SELECT * FROM `a3k_items` WHERE item_id ='".$itemid."' ";
					$myshit = $DB_site->query_first($sql);
					if($myshit)	
					{
						// --  pass to switch see which function to go
						$dowhat = $this->bigswitchforpackaction($myshit['item_type1'], $myshit['item_type2']);
						$wewe = $this->$dowhat($theid,$myshit, $me);
						return $wewe;

					}else{
									 return false;
					}
	}
	
	function bigswitchforpackaction( $type1, $type2)
	{
			switch ($type1)
			{
				case 1:
					return "toEquip";
				break;
				case 2:
					return "toAddOn";
				break;				
				default:
					return "";
				break;
			}	
	}
	
	function addToPack($itemid, $me)
	// "" ; // -- 超過背包限制
	// "itemname"; // -- 成功加入背包
	// null // -- 錯誤
	{ // -- to many query round trips
		$thereturn =null;
try{
				global $DB_site;
				$sql = "SELECT  `id`, `item_type1`,`item_type2`, `item_id`, `item_name`, `item_stackable` FROM `a3k_items` WHERE item_id ='".$itemid."' ";
				$theitem = $DB_site->query_first($sql);		
				
				if(!$theitem)
					return $thereturn; // no such item
				
				$packsizefieldname = "p_packsize_".$theitem[item_type1] ;
				$sql = "SELECT ".$packsizefieldname."
				FROM `a3k_player` WHERE p_id ='".$me."' ";
				
				$myshit = $DB_site->query_first($sql);	
				$sql = "SELECT count(*) 
	FROM a3k.a3k_player_item AS pi, a3k.a3k_items AS i
	WHERE pi.p_id = '".$me."'
	AND pi.item_id = i.item_id
	AND i.item_type1 = '".$theitem[item_type1]."' ";
				$thecount = $DB_site->query_first($sql);	
	
				if($myshit[0] <= $thecount[0])
					$thereturn = ""; // -- 超過背包限制
				else
				{
					// x switch case for different types :: for item_stacknum
					if($theitem[item_stackable] ==1)
					{
						$sql ="
						SELECT *
						FROM `a3k_player_item`
						WHERE item_id = '".$itemid."'
						AND p_id = '".$me."'";
						$thestackitem = $DB_site->query_first($sql);	
						if($thestackitem)
						{ // player already have the item, stack here
							if($thestackitem[item_stacknum]<= 24) // -- stack control 25 here
							{	// -- todo change 24 to config file
							 	$DB_site->query_first("
								UPDATE `a3k_player_item` SET `item_stacknum` = `item_stacknum` + 1 WHERE `a3k_player_item`.`id` ='".$thestackitem[id]."'");	
							}
						}
						else //no item yet
							$this->thepackinsert($me, $itemid);
					}
					else{	// none stackable
						$this->thepackinsert($me, $itemid);
					}
						
					$thereturn =  $theitem[item_name]; // -- 成功加入背包
				}	
}catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}				
			return $thereturn;
	}
	
	function thepackinsert($me, $itemid)
	{
		global $DB_site;
		$sql ="
						INSERT INTO `a3k`.`a3k_player_item` 
						(`id`, `p_id`, `item_id`, `item_eq`, `item_stacknum`) VALUES 
						(NULL, '".$me."', '".$itemid."', '0', 1);
						";
		return $DB_site->query($sql);
	}
	
	function lossitem($theid)
	{ 
			global $DB_site;
			$sql="SELECT p_id, item_id, item_eq FROM `a3k_player_item` WHERE `id` = '".$theid."' LIMIT 1";
			$lossinfo=$DB_site->query_first($sql);
			$sql = "SELECT  `id`, `item_id`, `item_name`, `item_type1`, `item_type2`, `item_img`, `item_ef_at`, `item_ef_df`, `item_ef_str`, `item_ef_bone`, `item_ef_vit`, `item_ef_agl`, `item_ef_smart`, `item_ef_hp`, `item_ef_mn`, `item_stackable` FROM `a3k_items` WHERE item_id ='".$lossinfo[item_id]."' ";
			$tobeinstalltheitem = $DB_site->query_first($sql);
			$sql = "
		SELECT pi.id, i.item_id, `item_type1` , `item_type2` , 
		`item_ef_at` ,
		 `item_ef_df` ,
		  `item_ef_str` ,
		   `item_ef_bone` , 
		   `item_ef_vit` ,
		    `item_ef_agl` ,
		     `item_ef_smart` , 
		     `item_ef_hp` , 
		     `item_ef_mn` , `item_ef_exp`, `item_stackable` , `item_tradable` , `item_price` 
FROM `a3k_items` AS i, a3k_player_item AS pi
WHERE pi.p_id = '".$lossinfo[p_id]."'
AND pi.item_id = i.item_id
AND i.item_type1 = '".$tobeinstalltheitem['item_type1']."'
AND i.item_type2 = '".$tobeinstalltheitem['item_type2']."'
AND pi.item_eq = '1'
";	// 1: select the same type
		$toberemoveditemsarray = $DB_site->query($sql);
		while($rows =$DB_site->fetch_array($toberemoveditemsarray))
		{
			if ($lossinfo[item_eq]==1){
					$test=$this->effectOnPlayer($rows, $lossinfo[p_id], "-");
				}
			}
			

			
// -- to do remove item and item effect on the player if it's equipment
			$sql = "DELETE FROM `a3k_player_item` WHERE `a3k_player_item`.`id` = '".$theid."' LIMIT 1";
			return $DB_site->query($sql);
	}	


	
	function checkitem($pid,$itemid,$count)
	{		
		// -- check item stackable count
		global $DB_site;
		$sql="SELECT item_stackable FROM a3k_items WHERE  item_id='".$itemid."'";
		$stackcheck=$DB_site->query_first($sql);
		if(  	$stackcheck['item_stackable'] == 1)
			$sql="SELECT item_stacknum as num FROM a3k_player_item WHERE p_id='".$pid."' AND item_id='".$itemid."'";
		else
		{
			$sql="SELECT count(id) as num FROM a3k_player_item WHERE p_id='".$pid."' AND item_id='".$itemid."'";
		}
		$check=$DB_site->query_first($sql);
		if ($check && $check['num']>=$count)
				return true;
		else
				return false;	
	}
	
	function removeitem($pid, $itemid, $num)
	{
				global $DB_site;
				//$getid = $DB_site->query_first("SELECT id FROM a3k_player_item where p_id ='".$pid."'  and item_id = '".$itemid."' LIMIT 1" );
				$stack="SELECT id, item_stacknum FROM `a3k_player_item` WHERE p_id='".$pid."' AND item_id='".$itemid."' LIMIT 1";
				$stackn=$DB_site->query_first($stack);	
				if ($stackn[item_stacknum]==1)
				{
					for ($i=0; $i< $num ;$i++)
					{
						$stack="SELECT id, item_stacknum FROM `a3k_player_item` WHERE p_id='".$pid."' AND item_id='".$itemid."' LIMIT 1";
						$stackn=$DB_site->query_first($stack);						
						if ($stackn[id])
						{
									$this->lossitem($stackn[id]);
						}	
					}						
				}else
				{
					$miuns="UPDATE `a3k_player_item` SET  item_stacknum = item_stacknum -".$num."  WHERE p_id='".$pid."' AND item_id='".$itemid."' LIMIT 1";
					$lessone=$DB_site->query($miuns);					
				}		
		}
	
}
?>