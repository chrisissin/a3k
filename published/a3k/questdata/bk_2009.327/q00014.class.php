<?php
include_once('quest_base.class.php');
class q00014 extends quest_base{
	function q00014() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '8',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00012',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => array('a02'=>20),
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '100',
  'money' => '30',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>