<?php

class mix_control
{

	function getMixList()
	{
				global $DB_site; 
				$mixlist = $DB_site->query("SELECT item_id, item_name
FROM `a3k_items`
WHERE item_mixable != 'null'");
				while($rows =$DB_site->fetch_array($mixlist))
				{
					$newarray[]=$rows;
				}
		  	echo (json_encode($newarray));		
	}
	function getMixItemInfo($itid)
	{
			  global $DB_site; 
			  $fellowtraderneeds = $DB_site->query_first("SELECT   item_mixable  from a3k_items where item_id = '".$itid."'"); 
			  echo ($fellowtraderneeds['item_mixable']);			
	}
	function getMixfullInfo($itid)
	{
			  global $DB_site; 
			  $fellowtraderneeds = $DB_site->query_first("SELECT item_ef_at, item_ef_df, item_ef_str, item_ef_bone, item_ef_vit, item_ef_agl, item_ef_smart, item_ef_hp, item_ef_mn, item_desc
FROM `a3k_items`
WHERE item_id = '".$itid."'"); 
			  echo (json_encode($fellowtraderneeds));			
	}	
	function onconfirmmix(  $itid , $me)
	{
				  global $DB_site; 
				  $fellowtraderneeds = $DB_site->query_first("SELECT item_name,  item_mixable  from a3k_items where item_id = '".$itid."'"); 	
				  $theneeds = json_decode($fellowtraderneeds['item_mixable'],  true);
				  
				  $mymoney = $DB_site->query_first("SELECT   p_money  from a3k_player where p_id = '".$me."'"); 	
				  $monyis = $mymoney['p_money'];
				  					
					if($theneeds['needGs'] > $monyis)
					{
						echo "金錢不夠";
						return;
					}
					

					include_once('../controller/a3k_pack.php');
					$fellowClass = new a3k_pack;							
					foreach ($theneeds['needs'] as $key => $value)
					{
						if ($fellowClass->checkitem($me, $value['item_id'] ,$value['num']))
						{
							$thetobededuct[] = $value;
							unset($theneeds['needs'][$key]);
						}	else 
						{
							break;
						}
					}
					
					if(count($theneeds['needs']) > 0)
					{
						echo "所需條件不夠";
						return;
					}else
					{// all ok, now proceed with trade ops
						
						$adres = $fellowClass->addToPack($itid, $me);
						if($adres === null || $adres === "") {
											echo '失敗,超過背包限制';
											return;
										}	
																
						// get fellow
						foreach ($thetobededuct as $key => $value){
							// delect traded fellow
							for ($i=0; $i< $thetobededuct[$key]['num'];$i++)
								$fellowClass->removeitem($me, $thetobededuct[$key]['item_id'] ,   1);
							//$fellowClass->removeitem($me, $thetobededuct[$key]['item_id'] ,  $thetobededuct[$key]['num']);
						}
									


						// deduct money
						$DB_site->query("update a3k_player set p_money = p_money - ".$theneeds['needGs']."  where p_id = '".$me."'  ");
						echo "成功合成".$fellowtraderneeds['item_name'];
						return;
					}  		
	}
}

?>