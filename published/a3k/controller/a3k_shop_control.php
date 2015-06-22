<?PHP





class x_shop_control
{
			function getshopInfo($me, $type1)
			{
						global $DB_site;
						$myshit = $DB_site->query("
						SELECT item_img, item_name, item_id FROM a3k_items  WHERE item_type1 
						= '".$type1."' and item_storeid = (SELECT p_map FROM a3k_player WHERE p_id='".$me."')");
					  
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
			
			function buyitem($theid, $itemid) 
			{
					global $DB_site;
					$Iprice = $DB_site->query_first("SELECT item_price,item_name FROM a3k_items where item_id ='".$itemid."' " );
					$Pprice = $DB_site->query_first("SELECT p_money FROM a3k_player where p_id ='".$theid."' " );
					$Pprice[0]-=$Iprice[0];

					if ($Pprice[0]<0)
						{
							echo "<script>notifyactionresult('你沒有足夠的金錢');</script>";	
							return;
						}
					else{
							include_once('../controller/a3k_pack.php');
							$x_pack = new a3k_pack();			
							$checkpack=$x_pack->addToPack($itemid,$theid);			
							
							
							if ($checkpack===$Iprice[item_name])
							{
										$sql="UPDATE `a3k_player` SET  p_money =   ".$Pprice[0]." WHERE `p_id` = ".$theid." LIMIT 1 ";
									//$sql="UPDATE `a3k`.`a3k_player` SET `p_money` = ".$Pprice[0]." WHERE `a3k_player`.`p_id` =".$theid." LIMIT 1 ";
									$DB_site->query($sql);
									echo "<script>notifyactionresult('購買成功');</script>";	
									return;
								}
									//echo "<script>notifyactionresult('sell successfuly');</script>";	
							else if ($chechpack===""){
									echo "<script>notifyactionresult('包包已滿');</script>";		
							}else{
									echo "<script>notifyactionresult('錯誤');</script>";	}
						}		
			}	
			
			function sellitem($theid, $itemid) 
			{
				
					global $DB_site;
					$stack="SELECT item_stacknum FROM `a3k_player_item` WHERE p_id='".$theid."' AND item_id='".$itemid."' LIMIT 1";
					$stackn=$DB_site->query_first($stack);
					$sql="SELECT item_tradable FROM a3k_items WHERE item_id='".$itemid."' LIMIT 1";
					$tradable=$DB_site->query_first($sql);
					
					//$item="SELECT id FROM a3k_player_item WHERE p_id='".$theid."' AND item_id='".$itemid."' ";
					if ($tradable[item_tradable]==0)
					{
							echo "<script>notifyactionresult('此物品不能販賣');</script>";
							return;
					}
					else
					{
									if ($stackn[item_stacknum]==1)
									{
															$sql = "DELETE FROM `a3k_player_item` WHERE p_id='".$theid."' AND item_id='".$itemid."' LIMIT 1";
															$toss=$DB_site->query($sql);
															
															if ($toss){
														$Iprice = $DB_site->query_first("SELECT item_price,item_name FROM a3k_items where item_id ='".$itemid."' " );
														$Pprice = $DB_site->query_first("SELECT p_money FROM a3k_player where p_id ='".$theid."' " );
														$modnum=$Iprice[0]%10;
														
														$Add=$Iprice[0]/10;
														if ($modnum!=0)
															$Add++;
														
														
															$Pprice[0]+=$Add;
												
															$sql="UPDATE `a3k_player` SET  p_money =   ".$Pprice[0]." WHERE `p_id` = ".$theid." LIMIT 1 ";
															$DB_site->query($sql);
														echo "<script>notifyactionresult('物品已賣出');</script>";
															return;
													}
													else
														echo "<script>notifyactionresult('錯誤');</script>";
									}
									else
									{
											//echo "<script>notifyactionresult('扣一件!');</script>";
											
											$miuns="UPDATE `a3k_player_item` SET  item_stacknum = item_stacknum -1  WHERE p_id='".$theid."' AND item_id='".$itemid."' LIMIT 1";
											$lessone=$DB_site->query($miuns);
										
											if ($lessone){
														$Iprice = $DB_site->query_first("SELECT item_price,item_name FROM a3k_items where item_id ='".$itemid."' " );
														$Pprice = $DB_site->query_first("SELECT p_money FROM a3k_player where p_id ='".$theid."' " );
														$modnum=$Iprice[0]%10;
														
														$Add=$Iprice[0]/10;
														if ($modnum!=0)
															$Add++;
														
														
															$Pprice[0]+=$Add;
												
															$sql="UPDATE `a3k_player` SET  p_money =   ".$Pprice[0]." WHERE `p_id` = ".$theid." LIMIT 1 ";
															$DB_site->query($sql);
														echo "<script>notifyactionresult('物品已賣出');</script>";
															return;
													}
													else
														echo "<script>notifyactionresult('錯誤');</script>";
											
										}
					
							}
			}	
	
	
	
	
	}
?>