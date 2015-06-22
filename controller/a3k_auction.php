<?php
class a3k_auction
{
	

	
	/*	將未拍賣還原	*/
	function resetauction($me)
	{
		global $DB_site;
		$DB_site->query("
			UPDATE a3k_player_item 
			SET auction_id=NULL, auction_time=NULL
			WHERE p_id=".$me."
			AND DATE_ADD( auction_time, INTERVAL 3 DAY ) < NOW( )");
		return;
	}
	
	/*	buy auction	*/	
	function auctionsell($me,$thing)
	{
		//echo "auctionsell";return;
		
		global $DB_site;
		/*	auction info	*/
		$selloff=$DB_site->query_first("SELECT * FROM a3k_auction WHERE id=".$thing);
		//echo ($selloff["id"]); return;
		
		/*	auction item info	*/
		$sellitem=$DB_site->query_first("SELECT * FROM a3k_player_item WHERE auction_id=".$thing);
		//echo ($sellitem["id"]); return;
		$checkitem=$DB_site->query_first("SELECT * FROM a3k_items WHERE item_id='".$sellitem["item_id"]."'");
		//echo ($checkitem["item_name"]); return;
		
		/*	seller info	*/
		$seller=$DB_site->query_first("SELECT * FROM a3k_player WHERE p_id=".$sellitem["p_id"]);
		//echo ($seller["p_name"]); return;
		/*	buyer info	*/
		$buyer=$DB_site->query_first("SELECT * FROM a3k_player WHERE p_id=".$me);
		//$selloff["id"].",".$sellitem["id"].",".$checkitem["item_name"].",".$seller["p_name"].",".$buyer["p_name"]
		//echo ($buyer[p_id]); return;
		
		/*	check money	*/
		if($selloff["price"] > $buyer["p_money"])
		{
			echo"金錢不足無法購買";
			return;
		}
		/*	check selloff	*/
		if($selloff["buyer_id"]== "")
		{
			/*	+ buyer item	*/
			include_once('../controller/a3k_pack.php');
			$x_pack = new a3k_pack();
			for($x=1;$x<=$selloff["much"];$x++)
			{
							
				$checkpack=$x_pack->addToPack($sellitem["item_id"],$me);
				//echo ($chechpack);
				if ($checkpack == $checkitem["item_name"])
				{
					/*	- seller item	*/
					include_once('../controller/a3k_pack.php');
					$lossitem = new a3k_pack();
					$lossitem->removeitem($seller[p_id],$sellitem[item_id],1);
					//echo ($chechpack);
				}
				//echo "<script>notifyactionresult('sell successfuly');</script>";	
				else if ($chechpack==="")
				{
					echo "包包已滿";
					return;	
				}
				else
				{
					echo "錯誤";	
					return;
				}
			}
			
			/*	set selloff	*/
			$DB_site->query("UPDATE a3k_auction SET buyer_id=".$me." ,buy_time=NOW() WHERE id=".$thing);
			/*	- buyer money	*/
		//	$new_money=$buyer["p_money"]-$price;
			$DB_site->query("UPDATE a3k_player SET p_money= p_money - ".$selloff[price]." WHERE p_id=".$buyer["p_id"]);
			/*	+ seller money	*/
			//$new_money=$seller["P_money"]+$price;
			$DB_site->query("UPDATE a3k_player SET p_money= p_money + ".$selloff[price]." WHERE p_id=".$seller["p_id"]);
			/*	reset sell item	*/
			$endsell=$DB_site->query_first("SELECT * FROM a3k_player_item WHERE auction_id=".$thing);
			if ($endsell !=null)
			{
				$DB_site->query("UPDATE a3k_player_item SET auction_id=NULL, auction_time=NULL WHERE auction_id=".$thing);
			}
			echo "交易完成";
			return;
		}
		else
		{
			/*	selloff	*/
			echo "已賣出";
			return;
		}
	}
	
	/*	取得拍賣資料-道具	*/
	function getauction_item()
	{
		global $DB_site;
		/*	三天內的拍賣資料	*/
		$auctionlist=$DB_site->query("SELECT a.id, i.item_name, p.p_name, a.price, a.much
			FROM a3k_auction AS a, a3k_player_item AS pi, a3k_items AS i, a3k_player AS p
			WHERE DATE_ADD( a.set_time, INTERVAL 3 DAY ) > NOW( )
			AND pi.auction_id = a.id
			AND pi.item_id = i.item_id
			AND pi.p_id = p.p_id
			AND a.buyer_id IS NULL
			AND i.item_type1=2
			ORDER BY a.id ASC
			LIMIT 0,10");
			/*	列陣化	*/
				while($rows =$DB_site->fetch_array($auctionlist))
				{
					$thelist[]=$rows ;
				}			
		echo (json_encode($thelist));
		return;
	}
	
	/*	取得拍賣資料	*/
	function getauctionlist()
	{
		global $DB_site;
		/*	三天內的拍賣資料	*/
		$auctionlist=$DB_site->query("SELECT a.id, i.item_name, p.p_name, a.price, a.much
			FROM a3k_auction AS a, a3k_player_item AS pi, a3k_items AS i, a3k_player AS p
			WHERE DATE_ADD( a.set_time, INTERVAL 3 DAY ) > NOW( )
			AND pi.auction_id = a.id
			AND pi.item_id = i.item_id
			AND pi.p_id = p.p_id
			AND a.buyer_id IS NULL
			AND i.item_type1=1
			ORDER BY a.id ASC
			LIMIT 0,10");
			/*	列陣化	*/
				while($rows =$DB_site->fetch_array($auctionlist))
				{
					$thelist[]=$rows ;
				}			
		echo (json_encode($thelist));
		return;
	}
	
	/*	拍賣設定	*/
	function set_auction($pack_id,$price,$much)
	{
		global $DB_site;
		$old_item=$DB_site->query_first("SELECT * FROM a3k_player_item WHERE id=".$pack_id);
		$item_info=$DB_site->query_first("SELECT * FROM a3k_items WHERE item_id='".$old_item[item_id]."';");
		
		/*	正在拍賣中	*/
		if($old_item[auction_id] != null)
		{
			echo "拍賣中";
			return;
		}

		/*	物品為綁定	0:為綁定	1:可交易	*/
		if($item_info[item_tradable]!=1)
		{
			echo "物品綁定不可拍賣";
			return;
		}
		
		/*	裝備中	1:裝備中	0:非裝備狀態	*/
		if($old_item["item_eq"]!=0)
		{
			echo "裝備中不可拍賣";
			return;
		}
		
		/*	數量不夠	*/
		if($old_item[item_stacknum]<$much)
		{
			echo "數量不夠";
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
					$DB_site->query_first("UPDATE a3k_player_item SET auction_id=".$auction["MAX(id)"].",auction_time=NOW() WHERE id=".$pack_id);
					echo "拍買完成";
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
				echo "請設定價格";
				return;
			}
		}
	}
}
?>