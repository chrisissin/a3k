<?php
include_once('quest_base.class.php');
class q00034 extends quest_base{
	function q00034() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '18',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00031',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => 
  array (
    'a00055' => 10,
  ),
  'fight' => NULL,
  'item' => NULL,
  'description' => '',
));
		
		$this->setAward(array (
  'exp' => '450',
  'money' => '100',
  'item' => NULL,
  'point' => '0',
  'fellow' => NULL,
  'description' => '',
));
	}
}
?>