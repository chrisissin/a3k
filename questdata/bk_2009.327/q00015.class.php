<?php
include_once('quest_base.class.php');
class q00015 extends quest_base{
	function q00015() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '8',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00022' => 15,
  ),
  'fight' => '0',
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '120',
  'money' => '30',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>