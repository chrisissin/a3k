<?php
include_once('quest_base.class.php');
class q00009 extends quest_base{
	function q00009() {
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
  'fight' => '3',
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '0',
  'money' => '0',
  'item' => 
  array (
    'g0001' => 3,
  ),
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>