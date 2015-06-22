<?PHP

class x_store_control
{
	
	function getstoreInfo()
			{
						global $DB_site;
						$myshit = $DB_site->query("
						SELECT item_img, item_name, item_id FROM a3k_items  WHERE  item_storeid ='sp' ");
					  
					  while($rows =$DB_site->fetch_array($myshit))
						{
							$newarray[]=$rows ;
						} 
						
            echo (json_encode($newarray));

							 		
				 		unset($myshit);
				 		unset($newarray);
			}

function buystoreitem($theid, $itemid) 
			{
					global $DB_site;
					$Iprice = $DB_site->query_first("SELECT item_r_price, item_name FROM a3k_items where item_id ='".$itemid."' " );
					$Pprice = $DB_site->query_first("SELECT p_r_money FROM a3k_player where p_id ='".$theid."' " );
					$Pprice[0]-=$Iprice[0];
					
					if ($Pprice[0]<0)
						{
							echo "<script>notifyactionresult('你沒有足夠的金錢');</script>";	
							return;
						}
					else{
							$checkpack=$this->addtoSpecialPack($theid, $itemid);

									if ($checkpack===$Iprice[item_name])
									{
										$sql="UPDATE `a3k_player` SET  p_r_money =   ".$Pprice[0]." WHERE `p_id` = ".$theid." LIMIT 1 ";
									//$sql="UPDATE `a3k`.`a3k_player` SET `p_money` = ".$Pprice[0]." WHERE `a3k_player`.`p_id` =".$theid." LIMIT 1 ";
									$DB_site->query($sql);
									echo "<script>notifyactionresult('購買成功');</script>";	
									//echo "購買成功";
									return;
										}
											//echo "<script>notifyactionresult('sell successfuly');</script>";	
									else if ($chechpack===""){
											echo "<script>notifyactionresult('包包已滿');</script>";		
									}else{
												echo "<script>notifyactionresult('錯誤');</script>";	
											}
							}		
			}	
	function addtoSpecialPack($me, $itemid)
	// "" ; // -- 超過背包限制
	// "itemname"; // -- 成功加入背包
	// null // -- 錯誤
	{ // -- to many query round trips
		$thereturn =null;

try{
				global $DB_site;
				$sql = "SELECT  `id`, `item_type1`,`item_type2`, `item_id`, `item_name`, `item_stackable` FROM `a3k_items` WHERE item_id ='".$itemid."' ";
				$theitem = $DB_site->query_first($sql);		
				/*
				$packsizefieldname = "p_packsize_".$theitem[item_type1] ;
				$sql = "SELECT ".$packsizefieldname."
				FROM `a3k_player` WHERE p_id ='".$me."' ";
				
				$myshit = $DB_site->query_first($sql);	
				
				$sql = "SELECT count(*) 
	FROM a3k.a3k_player_store AS pi, a3k.a3k_items AS i
	WHERE pi.p_id = '".$me."'
	AND pi.item_id = i.item_id
	AND i.item_type1 = '".$theitem[item_type1]."' ";
				$thecount = $DB_site->query_first($sql);	

				if($myshit[0] <= $thecount[0])
					$thereturn =""; // -- 超過背包限制
				else
				{*/
					// switch case for different types :: for item_stacknum
					$this->Specialpackinsert($me, $itemid);
					
					$thereturn =  $theitem[item_name]; // -- 成功加入背包
					
				//}
}catch (Exception $e) {
   // echo 'Caught exception: ',  $e->getMessage(), "\n";
}				
			return $thereturn;
	}

	function Specialpackinsert($me, $itemid)
	{
		global $DB_site;

		$sql =" INSERT INTO a3k_player_store (`id`, `p_id`, `item_id`,`usetime`) 
		VALUES (NULL, '".$me."', '".$itemid."',NULL); "; 
		return $DB_site->query($sql); 
	}

			function getSpecialPackInfo($me)
			{
						global $DB_site;
						$myshit = $DB_site->query("
						SELECT pi.id, i.item_img, i.item_name, pi.item_id 
						FROM a3k_player_store as pi , a3k_items as i 
						WHERE  pi.p_id = '".$me."' and pi.item_id = i.item_id and pi.usetime IS NULL ");
					  
					  while($rows =$DB_site->fetch_array($myshit))
						{
							$newarray[]=$rows ;
						}
            echo (json_encode($newarray));
						//echo("<script language=\"JavaScript\" >display_pack(".json_encode($newarray).");</script>");
				 		//print_r($newarray);
            
             //$this->getMoneyInfo($me);
            
				 		

				 		unset($myshit);
				 		unset($newarray);
			}

function usespecialitem($me,$theid,$itemid)
{
/*		global $DB_site;
		$check=$DB_site->query_first("
			SELECT item_type1 from a3k_items WHERE item_id= '".$itemid."'
		");*/
				global $DB_site;
				$checkitem = $DB_site->query_first("SELECT item_name FROM a3k_items where item_id ='".$itemid."' " ); 

					$check=$DB_site->query_first("
							SELECT id from a3k_player_store WHERE id='".$theid."'
						");
					include_once('../controller/a3k_pack.php');
					$x_pack = new a3k_pack();			
					$changepack=$x_pack->addToPack($itemid,$me);		
					//echo "<script>notifyactionresult('$changepack');</script>";	
				if ($changepack==$checkitem[item_name]){
								echo "<script>notifyactionresult('成功');</script>";
								$sql = "UPDATE `a3k_player_store` SET usetime=now() WHERE id = '".$check[id]."' LIMIT 1";
								return $DB_site->query($sql);
								
							}	
					if ($changepack=="")
					{
								echo "<script>notifyactionresult('包包已滿');</script>";		
								return;
					}
					else
								echo "<script>notifyactionresult('錯誤');</script>";	
	}	

function counteffect($me,$type2)
{
		global $DB_site;
		//find out the equipment of the same part the player is using
		$checkeqpt=$DB_site->query_first("SELECT `item_id`,`item_name`, `item_ef_at`, `item_ef_df`, `item_ef_str`, `item_ef_bone`, `item_ef_vit`, `item_ef_agl`, `item_ef_smart`, `item_ef_hp`, `item_ef_mn` FROM `a3k_items` WHERE `item_type1`=1 AND `item_type2` ='".$type2."' AND `item_id` IN (SELECT `item_id` FROM a3k_player_item WHERE  p_id='".$me."' AND item_eq=1) ");

		echo (json_encode($checkeqpt));
	}


	
	}
?>