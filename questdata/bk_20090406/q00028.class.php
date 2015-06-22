<?php
include_once('quest_base.class.php');
class q00028 extends quest_base{
	function q00028() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '16',
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
    'i0014' => 1,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '250',
  'money' => '80',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>