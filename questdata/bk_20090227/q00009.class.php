<?php
include_once('quest_base.class.php');
class q00009 extends quest_base{
	function q00009() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '1',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => 'test1文字描述',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '1',
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '10',
  'money' => '10',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>