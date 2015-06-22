<?php
include_once('quest_base.class.php');
class q00004 extends quest_base{
	function q00004() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '4',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00003',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => array('a01' => '5'),
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '50',
  'money' => '20',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>