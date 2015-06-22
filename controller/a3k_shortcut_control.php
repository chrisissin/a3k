<?PHP




class shortcut_class
{
	function shortcutitem($me, $itemid, $shortcutplace)
	{
		try
		{
			if( $shortcutplace =="" || $shortcutplace < 0 || $shortcutplace > 9)
				{// -- short cut integraty control
					echo (-1);
					exit;
				}
				global $DB_site;
				
				$sql = " 
				select sc_id, p_id, sc_pos, sc_type, sc_status, sc_type_id
				 from a3k_shortcut 
				where p_id = '".$me."' and sc_type = '2' and  sc_type_id = '".$itemid."' 
				";
				
				$res = $DB_site->query_first($sql);
				$sql = " 
						select sc_id, p_id, sc_pos, sc_type, sc_status, sc_type_id
						 from a3k_shortcut 
						where p_id = '".$me."' and sc_pos = '".$shortcutplace."'
						";	
				$thespot = $DB_site->query_first($sql);				

				if(!$res) // -- check if the skill is already in shortcut
				{
					if($thespot) // -- check if the shortcut block if already in use
					// -- update if filled
					{
						$this->removefromShortcutby_scid($thespot[sc_id]);
					}
						// -- insert if not there
						$sql = $this->insertscitemsql($me,$shortcutplace, $itemid);
						if($DB_site->query($sql))
							echo(1);
				}else
				// -- skill already in short cut 
				// -- change pos
				{
						if($thespot) 
						// -- check if the shortcut block if already in use
						// -- remove the existing
						{
							$this->removefromShortcutby_scid($thespot[sc_id]);
						}
						// -- insert if there
							$sql = "
UPDATE a3k_shortcut SET sc_pos = '".$shortcutplace."'
WHERE sc_id = '".$res[sc_id]."'							
							";
						if($DB_site->query($sql))
							echo(1);
				}		
			}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	function shortcutskill($me, $skid, $shortcutplace )
	{														
		try
		{		
			if( $shortcutplace =="" || $shortcutplace < 0 || $shortcutplace > 9)
				{// -- short cut integraty control
					echo (-1);
					exit;
				}
				global $DB_site;
				
				$sql = " 
				select skill_active, skill_point, role_skillpointmax
				from a3k_skill
				where skill_id = '".$skid."' 
				";
				$sk2 = $DB_site->query_first($sql);	
				if($sk2[skill_point] < $sk2[role_skillpointmax] )
				{// -- not meet role requirement yet 	//職業熟練度100%之後才會得到出生職業的技能			
					echo "-2"; 
					return;
				}		
				if($sk2[skill_active] == 1 )
				{// -- not active skill can't set to shortcut
					echo "-1"; 
					return;
				}
						
				
				$sql = " 
				select sc_id, p_id, sc_pos, sc_type, sc_status, sc_type_id
				 from a3k_shortcut 
				where p_id = '".$me."' and sc_type = '1' and  sc_type_id = '".$skid."' 
				";
				$res = $DB_site->query_first($sql);
				$sql = " 
						select sc_id, p_id, sc_pos, sc_type, sc_status, sc_type_id
						 from a3k_shortcut 
						where p_id = '".$me."' and sc_pos = '".$shortcutplace."'
						";	
				$thespot = $DB_site->query_first($sql);				
				
				if(!$res) // -- check if the skill is already in shortcut
				{
					if($thespot) // -- check if the shortcut block if already in use
					// -- update if filled
					{
						$this->removefromShortcutby_scid($thespot[sc_id]);
					}

						// -- insert if not there
						$sql = $this->insertscskillsql($shortcutplace, $skid);
						if($DB_site->query($sql))
						{
							echo json_encode(1);
						}
				}else
				// -- skill already in short cut 
				// -- change pos
				{
						if($thespot) 
						// -- check if the shortcut block if already in use
						// -- remove the existing
						{
							$this->removefromShortcutby_scid($thespot[sc_id]);
						}
						// -- insert if there
							$sql = "
UPDATE a3k_shortcut SET sc_pos = '".$shortcutplace."'
WHERE sc_id = '".$res[sc_id]."'							
							";
						if($DB_site->query($sql))
						{
							echo json_encode(1);
						}
				}					
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}	
	
	function removefromShortcutby_scid($scid)
	{
		try
		{		
						global $DB_site;
							$sql = "
DELETE FROM `a3k_shortcut` WHERE `a3k_shortcut`.`sc_id` = '".$scid."' LIMIT 1							
							";
							return $DB_site->query($sql);	
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}								
	}
	
	function insertscskillsql($shortcutplace, $skid)
	{
		return "
						INSERT INTO `a3k_shortcut` (
						`sc_id` ,
						`p_id` ,
						`sc_pos` ,
						`sc_type` ,
						`sc_status` ,
						`sc_type_id` ,
						`sc_img` ,
						`sc_usename` 
						)
						SELECT NULL as sc_id, user_id as p_id, '".$shortcutplace."' as sc_pos ,
						 '1' as sc_type, '0' as sc_status , skill_id as sc_type_id , skill_img as sc_img ,
						 skill_name as sc_usename
						FROM a3k_skill
						WHERE skill_id = '".$skid."'			
						";	
	}
	
		function insertscitemsql($me,$shortcutplace, $itemid)
	{
		return "
						INSERT INTO `a3k_shortcut` (
						`sc_id` ,
						`p_id` ,
						`sc_pos` ,
						`sc_type` ,
						`sc_status` ,
						`sc_type_id` ,
						`sc_img` ,
						`sc_usename` 
						)
						SELECT NULL as sc_id, '".$me."' as p_id, '".$shortcutplace."' as sc_pos ,
						 '2' as sc_type, '0' as sc_status , item_id as sc_type_id , item_img as sc_img ,
						 item_name as sc_usename
						FROM a3k_items
						WHERE item_id = '".$itemid."'			
						";	
	}
	
	function finishuseofshortcut($scid)
	{
		try
		{		
				global $DB_site;
				$sql = "
				UPDATE a3k_shortcut SET sc_status = '0' WHERE a3k_shortcut.sc_id = '".$res[sc_type_id]."'  ;
				";
				$res = $DB_site->query($sql);
				return $res;
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}				
	}
	
	function listshortcut($me)
	{
		try
		{		
				global $DB_site;
				$sql = "
				select sc_id, sc_pos, sc_type, sc_status,  sc_type_id, sc_img, sc_usename
				from a3k_shortcut
				where p_id = '".$me."'
				";
				$res = $DB_site->query($sql);
				while($rows =$DB_site->fetch_array($res))
				{
					$newarray[]=$rows ;
				}				
				echo(json_encode($newarray));
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}				
	}


	function useshortcut($blk, $me)
	{
		try
		{		
				global $DB_site;
				$sql = " 
				select sc_id, p_id, sc_pos, sc_type, sc_status, sc_type_id
				 from a3k_shortcut 
				where p_id = '".$me."' and sc_pos = '".$blk."'
				";
				$res = $DB_site->query_first($sql);
				if($res) // -- check if the short cut use is valid
				{
					if($res[sc_status] == 0) // -- check if short cut is in use
					{
							switch ($res[sc_type]) // -- switch for using skill or item or....
							{
						    case "1": // -- skill used
						    			include_once('../controller/a3k_skill_control.php');
											$skillobj = new skill_class();			
											if($skillobj->useshortcutskill($res[sc_type_id]))
											{ // -- update the status of shortcut
												$sql = "
												UPDATE a3k_shortcut SET sc_status = '1' WHERE a3k_shortcut.sc_id = '".$res[sc_id]."'  ;
												";
												if($DB_site->query($sql))
													echo 1;
												else 
													echo -3; // -- system error
											}else 
												echo -3; // -- system error
						    break;
						    case "2": // -- item used
						    	global $DB_site;
						    	$sql="SELECT id FROM `a3k_player_item` WHERE p_id='".$me."' AND item_id='".$res[sc_type_id]."'";
						    	$scinfo=$DB_site->query_first($sql);
						    	include_once('../controller/a3k_pack.php');
						    	$a3k_pack = new a3k_pack();	
						    	if ($scinfo[id]!=null)
						    	{
						    	if($a3k_pack->init($scinfo[id],$res[sc_type_id],$me))
											{ // -- update the status of shortcut
			
													echo 1;

											}
										}else 
												echo -4; // no items
						    break;
						    default:
						    echo -1; // invalid use of short cut
						    break;
						  }
					}else 
						echo -2; // -- short cut already in use
				}else	// -- short cut is not there
					echo -3;
				
		}catch (Exception $e) {
		    echo 'Caught exception: ',  $e->getMessage(), "\n";
		}		
	}
	
	function clearActiveShotCuts($pid)
	{
		global $DB_site;
		$DB_site->query(" UPDATE `a3k_shortcut` SET `sc_status` = 0 where p_id = '".$pid."'  ");						
	}
}
?>