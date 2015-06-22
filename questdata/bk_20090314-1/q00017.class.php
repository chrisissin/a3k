<?php
include_once('quest_base.class.php');
class q00017 extends quest_base{
	function q00017() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '9',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00010',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '0',
  'item' => 
  array (
    'i0005' => 20,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '150',
  'money' => '30',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>