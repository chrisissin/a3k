<?php
include_once('quest_base.class.php');
class q00011 extends quest_base{
	function q00011() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '6',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00009',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => array(
  		'a00016'=>10
	),
  'fight' => NULL,
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '80',
  'money' => '30',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>