<?PHP
class fellow_trade_control
{
	function getfellow_info($who)
	{
			global $DB_site; 
			$fellowtrader = $DB_site->query_first("SELECT r.role_name, f.p_at, f.p_vit, f.p_agl, f.p_hpmax, f.p_mnmax, f.p_bone, f.p_str, f.p_smart, f.p_df
FROM `a3k_fellowshop` AS f, a3k_role AS r  where f.fl_id = '".$who."' AND r.role_id = f.role_id");
			echo (json_encode($fellowtrader));
	}

	function getfellow_tradelist()
	{
				global $DB_site; 
				$fellowtrader = $DB_site->query("SELECT fl_id , p_name , p_img from a3k_fellowshop where f_tradedata != 'NULL'");
				while($rows =$DB_site->fetch_array($fellowtrader))
				{
					$newarray[]=$rows ;
				}
		    
		  	echo (json_encode($newarray));
	}

	function getfellow_tradeinfo($fid)
	{
		/*
			$fellowtrader = array ( 
			"needGs" => 100 ,
				"needs" => array (
			  array (
			    "fl_id" => 1 , 
			    "p_name" => "", 
			    "p_lv" => 2 ,
			  			),
			    array (
			    "fl_id" => 4 , 
			    "p_name" => "", 
			    "p_lv" => 3 ,
			  			),
			    array (
			    "fl_id" => 3 , 
			    "p_name" => "", 
			    "p_lv" => 4 ,
			  			)		  					  			
			    	)
			    ); 
			    */
			  global $DB_site; 
				//$fellowtrader = $DB_site->query_first("SELECT fl_id  from a3k_fellowshop where fl_id = '".$fid."'");
			  $fellowtraderneeds = $DB_site->query_first("SELECT   f_tradedata  from a3k_fellowshop where fl_id = '".$fid."'"); 
			  echo ($fellowtraderneeds['f_tradedata']);	
	}

	function res_onconfirmtrade($me , $tobetradflid)
	{

				  global $DB_site; 
				  $fellowtraderneeds = $DB_site->query_first("SELECT p_name,  f_tradedata  from a3k_fellowshop where fl_id = '".$tobetradflid."'"); 	
				  $theneeds = json_decode($fellowtraderneeds['f_tradedata'],  true);
				  
				  $mymoney = $DB_site->query_first("SELECT   p_money  from a3k_player where p_id = '".$me."'"); 	
				  $monyis = $mymoney['p_money'];
				  
				  $fellowihave = $DB_site->query("SELECT p_id,  fl_id , p_lv   from a3k_fellow where p_owner = '".$me."'"); 	
				  while($rows =$DB_site->fetch_array($fellowihave))
					{
						$thehaves[]=$rows ;
					}	  
					
					if($theneeds['needGs'] > $monyis)
					{
						echo "金錢不夠";
						return;
					}
					
					//$thetobededuct = array;
					for($i = 0 ; $i < count($thehaves) ; ++$i)
					{
						if(count($theneeds['needs']) == 0)
							break;
						foreach ($theneeds['needs'] as $key => $value){
							if ($theneeds['needs'][$key]['fl_id'] == $thehaves[$i]['fl_id'] 
							&&  $theneeds['needs'][$key]['p_lv']<= $thehaves[$i]['p_lv'] )
							{
								$thetobededuct[] = $thehaves[$i]['p_id'];
								unset($theneeds['needs'][$key]);
								break;
							}	
						}
					}
					
					if(count($theneeds['needs']) > 0)
					{
						echo "所需條件不夠";
						return;
					}else
					{// all ok, now proceed with trade ops
						
						// get fellow
					  include_once('../controller/a3k_fellow_control.php');
						$fellowClass = new fellow_class;
						// check player equip fellow
						foreach ($thetobededuct as $key => $value){
							// delect traded fellow
							$fellowClass->removefellow( $me, $thetobededuct[$key]);
						}
												
						if($fellowClass->getfellow($tobetradflid, $me) === false) {
											echo '失敗,擁有武將數目超過';
											return;
										}										


						// deduct money
						$DB_site->query("update a3k_player set p_money = p_money - ".$theneeds['needGs']."  where p_id = '".$me."'  ");
						echo "成功招募".$fellowtraderneeds['p_name'];
						return;
					}  
	}
	

}
?>