<?php
include_once('quest_base.class.php');
class q00014 extends quest_base{
	function q00014() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '0',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00001' => 1,
  ),
  'fight' => '0',
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