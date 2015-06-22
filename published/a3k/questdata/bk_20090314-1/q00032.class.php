<?php
include_once('quest_base.class.php');
class q00032 extends quest_base{
	function q00032() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '14',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '0',
  'item' => 
  array (
    'i0010' => 12,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '200',
  'money' => '0',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>