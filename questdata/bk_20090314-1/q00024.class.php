<?php
include_once('quest_base.class.php');
class q00024 extends quest_base{
	function q00024() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '11',
  'job' => NULL,
  'item' => NULL,
  'quest' => NULL,
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => array('a03'=>1),
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '300',
  'money' => '100',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>