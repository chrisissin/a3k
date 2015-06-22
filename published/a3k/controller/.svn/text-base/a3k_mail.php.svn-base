<?PHP

include_once("../utilities/function.php");
include_once("../utilities/global.php");	


class mail_class
{
	
	      function getmailcontent($daid)
	      {
      		global $DB_site;
	       	$broinfo = $DB_site->query_first("SELECT p.p_name, m.id, m.sender, m.recv , m.createdate , m.readdate, m.expireddate, m.title, m.content
FROM mail as m , a3k_player as p
WHERE m.id = 
 ".$daid." and p.p_id = m.sender and m.expireddate is  null
 LIMIT 1");
				$DB_site->query("update mail set readdate = now() where id= '".$daid."'");
				
					echo (json_encode($broinfo));
      }
		
      function getInbox($me, $from, $to)
      {
      		global $DB_site;
	       	$broinfo = $DB_site->query("SELECT p.p_name, m.id, m.sender, m.recv , m.createdate , m.readdate, m.expireddate, m.title
FROM mail as m , a3k_player as p
WHERE m.recv = 
 ".$me." and p.p_id = m.sender and m.expireddate is  null
 LIMIT ".$from.",".$to);

 				while($rows =$DB_site->fetch_array($broinfo))
				{
					$brolist[] = $rows;	
				} 	
					echo (json_encode($brolist));
      }
      
		
      function sendmail($from, $to,$title, $content)
      {
      		global $DB_site;
	       	$broinfo = $DB_site->query("INSERT INTO `a3k`.`mail` (
`id` ,
`guid` ,
`sender` ,
`recv` ,
`createdate` ,
`readdate` ,
`expireddate` ,
`title` ,
`content` ,
`timestamp`
)
VALUES (
NULL , UUID();, '".$from."', '".$to."', NOW( ) , NULL , NULL , '".$title."', '".$title."',
CURRENT_TIMESTAMP
);");

	
					return $broinfo;
      }      

     function deletemail($daid)
      {
      		global $DB_site;
	       	$broinfo = $DB_site->query("DELETE FROM `mail` WHERE `mail`.`id` = '".$daid."' ");
					echo json_encode($broinfo);
					return $broinfo;
      }   		
}

?>