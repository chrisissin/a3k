<?php
include_once('quest_base.class.php');
class q00041 extends quest_base{
	function q00041() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '0',
  'job' => NULL,
  'item' => 
  array (
    'i0004' => 1,
  ),
  'quest' => 
  array (
    0 => 'q00001',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => 
  array (
    1 => 0,
  ),
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