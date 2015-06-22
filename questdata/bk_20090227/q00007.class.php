<?php
include_once('quest_base.class.php');
class q00007 extends quest_base{
	function q00007() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '1',
  'job' => 
  NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => 'test',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    1 => 0,
  ),
  'fight' => '1',
  'item' => NULL,
  'description' => 'test',
));
		
		$this->setAward(array (
  'exp' => '1',
  'money' => '1',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>