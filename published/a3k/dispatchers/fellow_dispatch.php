<?php
try
{
include_once("../utilities/function.php");
include_once("../utilities/global.php");		

	switch ($_POST["what"])
	{
		case "loadfellowlist":
			include_once('../controller/a3k_fellow_control.php');
			$me = $_POST['me'];
			if($me)
			{
				$fellowobj = new fellow_class();			
				$fellowobj->loadfellowlist($me);	
			}
		break;
    case "getfellowinfo":
			include_once('../controller/a3k_fellow_control.php');
			$fellowid = $_POST['fellowid'];
			if($fellowid)
			{
				$fellowobj = new fellow_class();			
				$fellowobj->getfellowinfo($fellowid);	
       // $fellowobj->display_fellow_body($fellowid);
			}
		break;	
		case "equipfellow":
			include_once('../controller/a3k_fellow_control.php');
			$flid = $_POST['flid'];
			$me = $_POST['me'];
      if ($flid){
				$fellowobj = new fellow_class();			
				$fellowobj->equipfellow($flid,$me);
        }
		break;	
		default:
			break;
	}
}catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
?>