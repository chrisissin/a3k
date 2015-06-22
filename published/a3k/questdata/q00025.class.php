<?php
include_once('quest_base.class.php');
class q00025 extends quest_base{
	function q00025() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '14',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00024',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => NULL,
  'item' => 
  array (
    'i0011' => 1,
    'i0012' => 1,
  ),
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