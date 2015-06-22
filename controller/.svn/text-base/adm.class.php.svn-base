<?php
class adm {
	function checkLogin(&$p_id) {
		$_SESSION['adm_id'] = 2;
		$p_id = $_SESSION['adm_id'];
		return $p_id ? true : false ;
	}
	function init($p_id) {
		$result = array(
			'isLogined' => $this->checkLogin($p_id),
			'channelID' => array(
				'public' => CHANNEL_PUBLIC,
				'local' => CHANNEL_LOCAL,
				'whisper' => CHANNEL_WHISPER,
				'guild' => CHANNEL_GUILD,
				'team' => CHANNEL_TEAM,
				'system' => CHANNEL_SYSTEM
			)
		);
		echo json_encode($result);
	}
}
?>