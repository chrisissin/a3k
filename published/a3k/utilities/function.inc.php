<?php
function alert($msg) {
	$result = array('error' => $msg);
	echo json_encode($result);
	exit;
}

function toBinary($dec, $length) {
		$str = '';
		$dec = intval($dec);
		for($mod = 0; $dec > 0; $dec = $dec >> 1) {
			$str = ($dec % 2) . $str;
		}
		if($length && strlen($str) < $length) {
			for($tmp = '', $bias = $length - strlen($str); $bias > 0; $bias--) {
				$tmp .= '0';
			}
			$str = $tmp . $str;
		}
		return $str;
	}
function array_reform(&$arr) {
	//ex: from array('0'=>array('name'=>'asd'), '1'=>array('name'=>'sdf'))  json: {{name:"asd"}, {name:"sdf"}}
	//    to   array('name'=>array('asd', 'sdf')) json: {name:['asd','sdf']}
	if(array_key_exists(0, $arr)) {
		$tmp = array();
		$keys = array_keys($arr[0]);
		$count = count($arr);
		foreach($keys as $v) {
			$tmp[$v] = array();
			for($i = 0; $i < $count; $i++) {
				$tmp[$v][$i] = $arr[$i][$v];
			}
		}
		$arr = $tmp;
	}
}
?>