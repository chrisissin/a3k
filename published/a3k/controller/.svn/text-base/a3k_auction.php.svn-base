<?php
class a3k_auction
{
	/*	拍賣交易	*/	
	function auctionsell($me,$thing)
	{
		global $DB_site;
		/*	拍賣情況	*/
		$selloff=$DB_site->query_first("SELECT * FROM a3k_auction WHERE id=".$thing);
		/*	拍賣物資料	*/
		$sellitem=$DB_site->query_first("SELECT * FROM a3k_player_item WHERE auction_id=".$thing);
		$checkitem=$DB_site->query_first("SELECT * FROM a3k_items WHERE auction_id=".$sellitem["item_id"]);
		/*	賣方資料	*/
		$seller=$DB_site->query_first("SELECT * FROM a3k_player WHERE p_id=".$sellitem["p_id"]);
		/*	買方資料	*/
		$buyer=$DB_site->query_first("SELECT * FROM a3k_player WHERE p_id=".$me);
		/*	金錢是否夠	*/
		if($selloff["price"]>$buyer["p_money"])
		{
			echo"You don't have money";
			return;
		}
		/*	物品是否已賣出	*/
		if($selloff["buyer_id"]== "")
		{
			/*	由買方身上增加	*/
			for($x=1;$x<=$selloff["much"];$x++)
			{
				include_once('../controller/a3k_pack.php');
				$x_pack = new a3k_pack();			
				$checkpack=$x_pack->addToPack($me,$sellitem["item_id"]);
				if ($checkpack==$checkitem["item_name"])
				{
					/*	由賣家身上減少	*/
					include_once('../controller/a3k_pack.php');
					$lossitem = new a3k_pack();
					$lossitem->lossitem($sellitem["id"]);
						//$sql="UPDATE `a3k_player` SET  p_money =   ".$Pprice[0]." WHERE `p_id` = ".$theid." LIMIT 1 ";
						//$sql="UPDATE `a3k`.`a3k_player` SET `p_money` = ".$Pprice[0]." WHERE `a3k_player`.`p_id` =".$theid." LIMIT 1 ";
						//$DB_site->query($sql);
						//echo "<script>notifyactionresult('購買成功');</script>";	
						//return;
				}
				//echo "<script>notifyactionresult('sell successfuly');</script>";	
				if ($chechpack=="")
				{
					echo "包包已滿";
					return;	/*	return 是否不再回到迴圈內	*/
				}
				else
				{
					echo "錯誤";	
					break;
				}
			}
			/*	設定物品賣出	*/
			$DB_site->query("UPDATE a3k_auction SET buyer_id=".$me." ,buy_time=NOW() WHERE id=".$thing);
			/*	減少買方的錢	*/
			$new_money=$buyer["p_money"]-$price;
			$DB_site->query("UPDATE a3k_player SET p_money=".$new_money." WHERE p_id=".$buyer["p_id"]);
			/*	增加賣方的錢	*/
			$new_money=$seller["P_money"]+$price;
			$DB_site->query("UPDATE a3k_player SET p_money=".$new_money." WHERE p_id=".$seller["p_id"]);
			
			echo "OK";
			return;
		}
		else
		{
			/*	已經賣掉了	*/
			echo "selloff";
			return;
		}
	}
	
	/*	取得拍賣資料	*/
	function getauctionlist()
	{
		global $DB_site;
		/*	三天內的拍賣資料 *差分頁寫法	*/
		$auctionlist=$DB_site->query("SELECT a.id, i.item_name, p.p_name, a.price, a.much
			FROM a3k_auction AS a, a3k_player_item AS pi, a3k_items AS i, a3k_player AS p
			WHERE DATE_ADD( a.set_time, INTERVAL 3 DAY ) > NOW( )
			AND pi.auction_id = a.id
			AND pi.item_id = i.item_id
			AND pi.p_id = p.p_id
			AND a.buyer_id IS NULL");
		echo (json_encode($auctionlist));
		return;
	}
	
	/*	拍賣設定	*/
	function set_auction($pack_id,$price,$much)
	{
		global $DB_site;
		$old_item=$DB_site->query_first("SELECT * FROM a3k_player_item WHERE id=".$pack_id);
		$item_info=$DB_site->query_first("SELECT * FROM a3k_items WHERE item_id='".$old_item[item_id]."';");

		/*	物品為綁定	0:為綁定	1:可交易	*/
		if($item_info[item_tradable]!=1)
		{
			echo "you can't sell it!";
			return;
		}
		
		/*	裝備中	1:裝備中	0:非裝備狀態	*/
		if($old_item["item_eq"]!=0)
		{
			echo "you can't sell it!";
			return;
		}
		
		/*	數量不夠	*/
		if($old_item[item_stacknum]<$much)
		{
			echo "You don't have so much";
			return;
		}
		else
		{
			/*	價格設定是否正確	*/
			if( $price >0)
			{
					/*	設定拍賣	*/
					$DB_site->query_first("INSERT INTO a3k_auction (pack_id,price,much,set_time) VALUES (".$pack_id.",".$price.",".$much.",NOW());");
					$auction=$DB_site->query_first("SELECT MAX(id) FROM a3k_auction WHERE pack_id=".$pack_id);
					/*	設定物品拍買中	*/
					$DB_site->query_first("UPDATE a3k_player_item SET auction_id=".$auction["MAX(id)"]." WHERE id=".$pack_id);
					echo "OK";
					return ;
					
					/* 可分割物品的寫法
				if($old_item["item_stacknum"]==1)
				{
				$DB_site->query("INSERT INTO a3k_auction (pack_id,price,much) VALUES (".$pack_id.",".$price.",".$much.");");
					$auction=$DB_site->query_first("SELECT MAX(id) FROM a3k_auction WHERE pack_id=".$pack_id);
					$DB_site->query("UPDATE a3k_player_item SET auction_id=".$auction["MAX(id)"]." WHERE id=".$pack_id);
					echo ("OK");
					return ;
				}
				else
				{
					$DB_site->query("INSERT INTO a3k_player_item (p_id,item_id,item_stacknum) VALUES (".$old_item["p_id"].",'".$old_item["item_id"]."',".$much.");");
					$old_much=$old_item["item_stacknum"]-$much;
					$DB_site->query("UPDATE a3k_player_item SET item_stacknum=".$old_much." WHERE id=".$pack_id);
					$new_item=$DB_site->query_first("SELECT MAX(id) FROM a3k_player_item WHERE p_id='".$old_item["p_id"]."' AND item_id='".$old_item["item_id"]."'");
					$DB_site->query("INSERT INTO a3k_auction (pack_id,price,much) VALUES (".$new_item["MAX(id)"].",".$price.",".$much.");");
					$auction=$DB_site->query_first("SELECT MAX(id),set_time FROM a3k_auction WHERE pack_id=".$new_item["MAX(id)"]);
					$DB_site->query("UPDATE a3k_player_item SET auction_id=".$auction["MAX(id)"]."auction_time=".$auction["set_time"]." WHERE id=".$new_item["MAX(id)"]);
					echo ("OK");
					return ;
				}*/
			}
			else
			{
				echo "You don't set price!";
				return;
			}
		}
	}
}
?>