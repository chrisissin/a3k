<?php
include_once('quest_base.class.php');
class q00014 extends quest_base{
	function q00014() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '9',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00013',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => NULL,
  'item' => 
  array (
    'i0006' => 1,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '200',
  'money' => '50',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>