// (c)2009 worxup

﻿var bropgfrom=0;var bropgto=5;$(document).ready(function(){getNPClist(getplayer());$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});});function getNPClist(me)
{$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{me:""+me+"",what:"getNPClist"},success:function(data){showNPClist(data);},error:function(){refershonerror();},timeout:20000});}
function showNPClist(data)
{var thehtml="";if(data!=null){for(var i=0;i<data.length;++i)
{thehtml+="<a  class='monster_text' onclick='tofck("+data[i]["p_id"]+");' >"+data[i]["p_name"]+"</a><br/>";}}else
{thehtml="這裡沒有怪";}
$('#npclistdiv').html(thehtml);}
function tofck(did)
{fkind="npc";danpc=did;$('#popup').hidePopup();intoFight();}