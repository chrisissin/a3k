// (c)2009 worxup

(function($){$.ajaxSetup({url:"./dispatchers/dispatcher.php",type:"POST",global:false,dataType:"json"});$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$('#btnIndex').unbind('click').click(showGroupIndex);$('#btnMember').unbind('click').click(showGroupMember);$('#btnFunction').unbind('click').click(showGroupFunction);$('body').data('grouppage','message');showGroupIndex();});function bindGroupFunctionEvent(){$('#btnInvite').unbind('click').click(showGroupInvite);$('#btnJoin').unbind('click').click(showGroupJoin);$('#btnWriteMessage').unbind('click').click(showGroupWriteMessage);$('#btnWriteText').unbind('click').click(showGroupWriteText);$('#btnLeave').unbind('click').click(showGroupLeave);}
function bindGroupIndexEvent(){$('#btnShowGroupMessage').unbind('click').click(showGroupMessage);$('#btnShowGroupText').unbind('click').click(showGroupText);$('#btnCreateGroup').unbind('click').click(showGroupCreate);}
function checkPage(pageName,pageURL,callback){if(!$.isFunction(callback)){callback=function(){};}
if($('body').data('grouppage')!=pageName){$('.group_boxbg_05').load(pageURL+' .group_boxbg_05',callback);}else{callback();}
$('body').data('grouppage',pageName);}
function setCurrentButton(current){$('#btnIndex, #btnMember, #btnFunction').each(function(){var $btn=$(this);if($btn.attr('id')==current){$btn.addClass('mission_btn_selected').find('a').removeClass();}else{$btn.removeClass().find('a').addClass('mission_btn');}});}
function showGroupCreate(){$.ajax({data:{f:'group',act:'checkGroup',me:getplayer()},success:function(data){if(data.in_group!=true){checkPage('create','./group9.html',_handler);}else{alert('已有所屬工會');}}});function _handler(){bindGroupIndexEvent();$('#textfield').unbind('keypress').keypress(function(e){var key=e.which;if(key==13){$('#button').click();return false;}});$('#button').unbind('click').click(function(){var name=$('#textfield').val();$.ajax({data:{f:'group',act:'create',me:getplayer(),name:name},success:function(data){if(data.error){alert(data.error);return;}
alert('成功建立 '+data.name);showGroupIndex();}});});}}
function showGroupFunction(){setCurrentButton('btnFunction');showGroupInvite();}
function showGroupIndex(){setCurrentButton('btnIndex');showGroupMessage();}
function showGroupInvite(){checkPage('invite','./group3.html',function(){bindGroupFunctionEvent();$('#textfield').unbind('keypress').keypress(function(e){var key=e.which;if(key==13){$('#button').click();}});$('#button').unbind('click').click(function(){var name=$('#textfield').val();$.ajax({data:{f:'group',act:'invite',me:getplayer(),name:name},success:function(data){if(data.error){alert(data.error);$('#textfieldd').focus();return;}
alert('成功對'+$('#textfield').val()+'提出了邀請');$('#textfield').val("");}});});});return false;}
function showGroupJoin(){checkPage('join','./group4.html',_getData);function _getData(){bindGroupFunctionEvent();$.ajax({data:{f:'group',act:'getInvitation',me:getplayer()},success:function(data){var $list=$('#list').empty();if(data.list.length==0){$list.append('沒有任何邀請');return false;}
var count=data.list.name.length;for(var i=0;i<count;i++){$list.append('<input type="radio" name="invitation" value="'+data.list.id[i]+'" /> '+data.list.name[i]+'對你提出了邀請<br />');}
$('#button2').unbind('click').click(_sendGroupJoin);$('#button').unbind('click').click(_sendGroupReject);}});return false;}
function _sendGroupJoin(){var id=$('input[name="invitation"]:checked').val();if(!id){alert('沒有選擇任何邀請');return;}
$.ajax({data:{f:'group',act:'join',me:getplayer(),id:id},success:function(data){if(data.error){alert(data.error);return;}
alert('成功加入 '+data.name);showGroupIndex();}});}
function _sendGroupReject(){var id=$('input[name="invitation"]:checked').val();if(!id){alert('沒有選擇任何邀請');return;}
$.ajax({data:{f:'group',act:'reject',me:getplayer(),id:id},success:function(data){if(data.error){alert(data.error);return;}
alert('你拒絕了 '+data.name+' 的邀請');showGroupJoin();}});}}
function showGroupLeave(){$.ajax({data:{f:'group',act:'checkGroup',me:getplayer()},success:function(data){if(data.error){alert(data.error);return;}
if(data.in_group==true){checkPage('leave','group7.html',_handler);}else{checkPage('leave(no group)','group8.html');}}});function _handler(){bindGroupFunctionEvent();$('#button2').unbind('click').click(_sendLeave);}
function _sendLeave(){$.ajax({data:{f:'group',act:'leave',me:getplayer()},success:function(data){if(data.error){alert(data.error);return;}
alert('你離開了 '+data.name);showGroupIndex();}});}}
function showGroupMember(page,name){checkPage('member','./group2.html',_getData);function _getData(){$.ajax({data:{f:'group',act:'getMember',me:getplayer(),page:isNaN(page)?1:page,name:name?name:""},success:function(data){setCurrentButton('btnMember');if(data.in_group==true){showGroupMemberPager(data.count,data.page);$('#textfield').unbind('keypress').keypress(function(e){var key=e.which;if(key==13){$('#button').click();return false;}});$('#button').unbind('click').click(function(){var name=$('#textfield').val();showGroupMember(1,name);});var list=data.list;var $list=$('#member_list').empty();var i=0,count=0;if(list.name){count=list.name.length;}
for(;i<count;i++){$('<tr><td  width="93" align="center" valign="top">'+list.name[i]+'</td><td  width="63" align="center" valign="top"></td><td  width="80" align="center" valign="top">'+list.role[i]+'</td><td  width="107" align="center" valign="top">'+list.lv[i]+'</td><td  width="129"  align="center" valign="top"></td></tr>').appendTo($list);}
var cc=10-count;for(var j=1;j<cc;j++){$('<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td></tr>').appendTo($list);}
if(data.is_leader==true&&count>0){$list.find('tr').each(function(i){if(!list.id[i]){return false;}
$(this).find('td:eq(4)').append($('<input type="button" class="group_btn" value="踢除" />').click(function(){$.ajax({data:{f:'group',act:'fire',me:getplayer(),id:list.id[i]},success:function(data){if(data.error){alert(data.error);return;}
alert('踢除成功');showGroupMember(1);}});}));});}}else{for(var i=0;i<10;i++){$('<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td></tr>').appendTo($list);}}}});}}
function showGroupMemberPager(count,page){var $pager=$('#pager').empty();var max=Math.ceil(count/10);page=parseInt(page,10);if(page!=1){$('<a href="#">&lt;&nbsp;&nbsp;</a>').click(function(){showGroupMember(page-1);}).appendTo($pager);}else{$('<span>&lt;&nbsp;&nbsp;</span>').appendTo($pager);}
for(var i=1;i<=max;i++){if(i!=page){$('<a href="#">&nbsp;'+i+'&nbsp;</a>').click(function(){showGroupMember(i);}).appendTo($pager);}else{$('<span>'+i+'&nbsp;&nbsp;</span>').appendTo($pager);}}
if(page!=max){$('<a href="#">&gt;</a>').click(function(){showGroupMember(page+1);}).appendTo($pager);}else{$('<span>&gt;</span>').appendTo($pager);}}
function showGroupMessage(){checkPage('message','./group.html',_getData);function _getData(){$.ajax({data:{f:"group",act:"getMessage",me:getplayer()},success:function(data){if(data.in_group==true){var $message=$('#g_message');$('#g_name').text(data.group.name);$('#g_leader').text(data.group.leader);$('#g_count').text(data.group.count+" 人");$message.html("");var count=0;if(data.message.msg){count=data.message.msg.length;}
if(count<1){$message.html("沒有內容");}else{for(var i=0;i<count;i++){$message.append('['+data.message.time[i]+']<br/ > '+data.message.msg[i]+'<br /><hr />');}}}else{$('#g_name').text("沒有工會");$('#g_leader').text("無");$('#g_count').text("0 人");$('#g_message').text("沒有內容");}
bindGroupIndexEvent();}});}}
function showGroupText(){checkPage('message','./group.html',_getData);function _getData(){$.ajax({data:{f:"group",act:"getText",me:getplayer()},success:function(data){if(data.in_group==true){var $message=$('#g_message');$('#g_name').text(data.group.name);$('#g_leader').text(data.group.leader);$('#g_count').text(data.group.count+" 人");$message.html(data.group.text);}else{$('#g_name').text("沒有工會");$('#g_leader').text("無");$('#g_count').text("0 人");$('#g_message').text("沒有內容");}
bindGroupIndexEvent();}});}}
function showGroupWriteMessage(){$.ajax({data:{f:'group',act:'checkPower',me:getplayer()},success:function(data){if(data.error){alert(data.error);return;}
checkPage('writeMessage','group5.html',_handle);}});function _handle(){bindGroupFunctionEvent();$('#textarea').fck({path:'./fckeditor/',toolbar:'Basic',height:200});$('#button2').unbind('click').click(_sendWriteMessage);return false;}
function _sendWriteMessage(){var text=$.fck.content('textarea');$.ajax({data:{f:'group',act:'writeMessage',me:getplayer(),text:text},success:function(data){if(data.error){alert(data.error);return;}
alert('公告送出成功');$.fck.content("textarea"," ");}});}
return false;}
function showGroupWriteText(){$.ajax({data:{f:'group',act:'getText',me:getplayer()},success:function(data){if(data.error){alert(data.error);return;}
checkPage('writeText','group6.html',function(){_handler(data.group.text);});}});function _handler(text){bindGroupFunctionEvent();$('#textarea').fck({path:'./fckeditor/',toolbar:'Basic',height:200});setTimeout(function(){$.fck.content('textarea',text);},2000);$('#button2').unbind('click').click(_sendWriteText);return false;}
function _sendWriteText(){var text=$.fck.content('textarea');$.ajax({data:{f:'group',act:'writeText',me:getplayer(),text:text},success:function(data){if(data.error){alert(data.error);return;}
alert('簡介更新完成');}});}
return false;}})(jQuery);