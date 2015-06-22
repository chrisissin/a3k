<?php
include_once('quest_base.class.php');
class q00030 extends quest_base{
	function q00030() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '13',
  'job' => 
  array (
    0 => 'b01',
  ),
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => array('a03'=>16),
  'item' => NULL,
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