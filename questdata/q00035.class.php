<?php
include_once('quest_base.class.php');
class q00035 extends quest_base{
	function q00035() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '19',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00034',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00057' => 8,
  ),
  'fight' => NULL,
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '400',
  'money' => '100',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>