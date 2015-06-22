// (c)2009 worxup

$(document).ready(function(){$('#teambtn').click(function(){notifyactionresult("未開放");});$('#guildbtn').click(function(){loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup({linkSensor:false,outSensor:false}).appendTo('body');}
$('#popup').load('./group.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();});$('#eventbtn').click(function(){notifyactionresult("功能尚未開放");});$('#downtownbtn').click(function(){toDownTown(getplayer());});$('#savecash').click(function(){$('#savecash').attr('href',Cashaddress);});$('#storeindex').click(function(){loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup({linkSensor:false,outSensor:false}).appendTo('body');}
$('#popup').load('./store.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();});$('#lshopbtn').click(function(){$('#storeindex').click();});$('#moveit').click(function(){$("#maindiv").load("./map.html");});$('#logoff').click(function(){setplayer(null);seta3klogin();window.location=loginaddress;});$("#maindiv").load("./map.html");loadingOn();$('#statusbtn').click(function(){loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup({linkSensor:false,outSensor:false}).appendTo('body');}
$('#popup').load('./player_info.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();});$('#packbtn').click(function(){loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup({linkSensor:false,outSensor:false}).appendTo('body');}
$('#popup').load('./bag.html',{},function(){$('#loading').hide();$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();});$("#shortcut_1").unbind('click');$('#shortcut_1').bind("click",function(){skill_appl(getplayer(),'1');});$("#shortcut_2").unbind('click');$('#shortcut_2').bind("click",function(){skill_appl(getplayer(),'2');});$("#shortcut_3").unbind('click');$('#shortcut_3').bind("click",function(){skill_appl(getplayer(),'3');});$("#shortcut_4").unbind('click');$('#shortcut_4').bind("click",function(){skill_appl(getplayer(),'4');});$("#shortcut_5").unbind('click');$('#shortcut_5').bind("click",function(){skill_appl(getplayer(),'5');});$("#shortcut_6").unbind('click');$('#shortcut_6').bind("click",function(){skill_appl(getplayer(),'6');});$("#shortcut_7").unbind('click');$('#shortcut_7').bind("click",function(){skill_appl(getplayer(),'7');});$("#shortcut_8").unbind('click');$('#shortcut_8').bind("click",function(){skill_appl(getplayer(),'8');});$("#shortcut_9").unbind('click');$('#shortcut_9').bind("click",function(){skill_appl(getplayer(),'9');});$('#refresh').click(function(){LoadPlayerInfo(getplayer());loadqestionlist(getplayer());});if(checkplayer())
loadint();else
loadingOn();});function initshortcutlist()
{for(var i=0;i<9;++i)
{$('#shortcut_img_'+(i+1).toString()).css("background-image","url("+net+"/images/icon.gif)");}}
function listshortcut(me)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"listshortcut"},function(data){initshortcutlist();listshortcut_res(data);},'json');}
function listshortcut_res(data)
{if(data){if(data.length){for(var i=0;i<data.length;++i)
{$('#shortcut_img_'+data[i].sc_pos).css("background-image","url("+net+"/images_ico/"+data[i].sc_img+".gif)");}}}}
function skill_appl(me,blk)
{if(g_infight!=0)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",blk:""+blk+"",what:"clickonshortcut"},function(data){skill_appl_res(data);},'json');}else
{msgonchatboard('快捷只能在戰鬥中使用');}}
function skill_appl_res(data)
{if(data===1)
{msgonchatboard('使用成功');}else if(data===-2)
{msgonchatboard('已經使用');}else if(data===-3)
{msgonchatboard('快捷錯誤');}else if(data===-4)
{msgonchatboard('沒有物品');}else
{msgonchatboard(' -- system error');}}
function initwin()
{setplayer(null);loadingOn();if($('#apopup').length==0){$('<div></div>').attr('id','apopup').css('position','absolute').hide().popup({inkSensor:false,outSensor:false}).appendTo('body');}
$('#apopup').load('./create_2.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left+92,y:toolPosition.top+72});});$("#apopup").draggable();}