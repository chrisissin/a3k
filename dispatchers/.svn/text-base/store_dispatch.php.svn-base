<?php
try
{
	include_once("../utilities/function.php");
	include_once("../utilities/global.php");

	switch ($_POST["what"])
	{
		case "getstoreInfo":
			include_once('../controller/a3k_store_control.php');
			$x_store = new x_store_control();			
			$x_store->getstoreInfo();
		break;
	
		case "buystoreitem":
			include_once('../controller/a3k_store_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_store = new x_store_control();			
			$x_store->buystoreitem($theid,$itemid);	
		break;	
		case "getSepcialPackInfo":
			include_once('../controller/a3k_store_control.php');
			$me = $_POST['me'];
			$x_store = new x_store_control();				
			$x_store->getSpecialPackInfo($me);
		break;
		case "usespecialitem":
			include_once('../controller/a3k_store_control.php');
			$me = $_POST['me'];
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_store = new x_store_control();				
			$x_store->usespecialitem($me,$theid,$itemid);	
		break;
/*		case "counteffect":
			include_once('../controller/a3k_store_control.php');
			$me = $_POST['me'];
			$type2 = $_POST['type2'];
			$x_store = new x_store_control();				
			$x_store->counteffect($me,$type2);	
		break;*/
	}
}catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
?>