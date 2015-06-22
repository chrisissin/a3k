<?php
include_once('quest_base.class.php');
class q00003 extends quest_base{
	function q00003() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '0',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '10',
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '20',
  'money' => '20',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>