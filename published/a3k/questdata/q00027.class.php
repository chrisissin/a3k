<?php
include_once('quest_base.class.php');
class q00027 extends quest_base{
	function q00027() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '15',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00025',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00048' => 5,
  ),
  'fight' => NULL,
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '300',
  'money' => '80',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>