<?php
include_once('quest_base.class.php');
class q00029 extends quest_base{
	function q00029() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '13',
  'job' => 
  array (
    0 => 'a01',
  ),
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => array('a03'=>15),
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