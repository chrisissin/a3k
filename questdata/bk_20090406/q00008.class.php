<?php
include_once('quest_base.class.php');
class q00008 extends quest_base{
	function q00008() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '5',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00005',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00013' => 10,
  ),
  'fight' => '0',
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '100',
  'money' => '0',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>