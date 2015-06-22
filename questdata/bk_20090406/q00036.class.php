<?php
include_once('quest_base.class.php');
class q00036 extends quest_base{
	function q00036() {
		$this->setQuestType(QUEST_NORMAL);
		
		$this->setLimit(array (
  'lv' => '19',
  'job' => NULL,
  'item' => NULL,
  'quest' => 
  array (
    0 => 'q00035',
  ),
  'description' => '',
));
		
		$this->setNeed(array (
  'monster' => NULL,
  'fight' => NULL,
  'item' => 
  array (
    'i0018' => 1,
    'i0019' => 1,
  ),
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