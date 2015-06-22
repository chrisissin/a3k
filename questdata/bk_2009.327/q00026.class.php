<?php
include_once('quest_base.class.php');
class q00026 extends quest_base{
	function q00026() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '11',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00023',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => '0',
  'item' => 
  array (
    'i0008' => 5,
  ),
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '100',
  'money' => '0',
  'item' => 
  array (
    'i0008' => 1,
  ),
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>