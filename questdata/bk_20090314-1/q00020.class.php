<?php
include_once('quest_base.class.php');
class q00020 extends quest_base{
	function q00020() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '10',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00018',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00025' => 3,
  ),
  'fight' => '0',
  'item' => array('i0006'=>1),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '180',
  'money' => '50',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>