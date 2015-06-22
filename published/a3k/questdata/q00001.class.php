<?php
include_once('quest_base.class.php');
class q00001 extends quest_base{
	function q00001() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '2',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => NULL,
  'item' => 
  array (
    'i0001' => 1,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '30',
  'money' => '0',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>