<?php
try
{

include_once("../utilities/function.php");
include_once("../utilities/global.php");

	switch ($_POST["what"])
	{
		case "getshopInfo":
			include_once('../controller/a3k_shop_control.php');
			$me = $_POST['me'];
			$type1 = $_POST['type1'];
			$x_shop = new x_shop_control();			
			$x_shop->getshopInfo( $me, $type1);
		break;

		case "buyitem":
			include_once('../controller/a3k_shop_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_shop = new x_shop_control();			
			$x_shop->buyitem($theid,$itemid);	
		break;	
		
		case "sellitem":
			include_once('../controller/a3k_shop_control.php');
			$itemid = $_POST['itemid'];
			$theid = $_POST['theid'];
			$x_shop = new x_shop_control();			
			$x_shop->sellitem($theid,$itemid);	
		break;
		}
	
}catch (Exception $e) {
    echo 'Caught exception: ',  $e->getMessage(), "\n";
}
?>