<?php
include_once('quest_base.class.php');
class q00012 extends quest_base{
	function q00012() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '0',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00005',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '1',
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