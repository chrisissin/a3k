// (c)2009 worxup

$.ajaxSetup({url:"./dispatchers/dispatcher.php",type:"POST",global:false,dataType:"json",timeout:60000});var g_infight=0;var dd;function loadingOn()
{$('#loading').show();$('#loadingpix').show();$('#lightbox').show();$('#overlay').show();$('#loadingpixdiv').show();}
function loadingOff()
{$('#loading2').hide();$('#loading3').hide();$('#loading').hide();$('#loadingpix').hide();$('#lightbox').hide();$('#overlay').hide();$('#loadingpixdiv').hide();}
function notifyactionresult(msg)
{if($('#mpopup').length===0){$('<div></div>').attr('id','mpopup').css('position','absolute').css('z-index','99999').hide().popup({inkSensor:true,outSensor:true}).appendTo('body');}
$('#mpopup').load('./message.html',{},function(){$(this).showPopup();var tool=$('#questionlist');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left+1,y:toolPosition.top+1});$('#msg_box').html(msg);});$("#mpopup").draggable();}
function mapmovemsg(msg)
{if($('#mmppopup').length===0){$('<div></div>').attr('id','mmppopup').css('position','absolute').css('z-index','99999').hide().popup({inkSensor:true,outSensor:true}).appendTo('body');}
$('#mmppopup').load('./message_map.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left+150,y:toolPosition.top+150});$('#msg_boxm').html(msg);});$("#mmppopup").draggable();}
function seta3klogin()
{setCookie("a3kplayer",null,null,"/",rootdo);}
function getplayer()
{return pid;}
var pid=null;function setplayer(val)
{pid=val;}
function toDownTown(me)
{$.ajax({dataType:"script",type:"POST",url:"./dispatchers/dispatcher.php",data:{me:""+me+"",what:"toDownTown"},success:function(data){eval(data);},error:function(){refershonerror();},timeout:20000});}
function exeJSstring(data)
{if($('#executionjq').length===0)
{$('<div></div>').attr('id','executionjq').css('display','none').appendTo('body');}
$('#executionjq').html('');$('#executionjq').html(data);}
function loadmaindiv(page)
{$("#maindiv").load("/a3k/"+page);}
function heal(me)
{dd=me;notifyactionresult("住宿中");setTimeout("sleep(dd);",2000);}
function sleep(me)
{$.ajax({type:"POST",url:"./dispatchers/dispatcher.php",dataType:"text",data:{me:""+me+"",what:"heal"},success:function(data){notifyactionresult(data);LoadPlayerInfo(getplayer());},error:function(XMLHttpRequest,textStatus,errorThrown){refershonerror();},timeout:20000});}
function moveTo(target,position){if(!target||!position){return;}
target.css({'z-index':99,left:position.x,top:position.y});}
function LoadPlayerInfo(me){if(me){$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{me:""+me+"",what:"getprimeInfo"},success:function(data){showprimeInfo(data);Pexpcount();},error:function(){},timeout:20000});}}
function showprimeInfo(data){$('#player_name').text(data.p_name);$('#p_rankname').text(data.p_rankname);$('#p_lv').text(data.p_lv);$('#p_money').text(data.p_money);$('#p_job').text(data.role_name);$('#p_r_money').text(data.p_r_money);$('#p_exp').text(data.p_exp);$('#p_groupname').text(data.g_name);$("#idimg").css("background-image","url(/a3k/images_char/icon/left/"+data.p_img+"_1.gif)")
$("#idimg").show();}
function loadqestionlist(me){if(me){$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{me:""+me+"",what:"loadquestionlist"},success:function(data){display_question_list(data);},error:function(){},timeout:20000});}}
function display_question_list(data){$('#questionlist').html("");if(data!=null){var Qlist="";if(data){for(var i=0;i<data.length;i++){var questionname=data[i].q_title;var questid=data[i].q_id;var queststatus=data[i].q_status;if(queststatus==2)
{var table="\
             <a onclick=\"getquest('"+questid+"')\">"+questionname+"</a> OK!<br/>\
         ";}
else{var table="\
             <a onclick=\"getquest('"+questid+"')\">"+questionname+"</a><br/>\
         ";}
Qlist+=table;}
$('#questionlist').html(Qlist);}}}
function getquest(questid)
{loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup({linkSensor:true,outSensor:true}).appendTo('body');}
$('#popup').load('./mission.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left,y:toolPosition.top+72});loadingOff();showQuestDescription(questid);});$("#popup").draggable();}
function showanouce(shows)
{if(shows!=null)
{$('#anouce').html(shows);}}
function enteringgame_res(data)
{if(data.code=="-666")
{alert(data.msg);window.location=loginaddress;return;}
if(data.code=="-777")
{setplayer(data.msg);invocapt();return;}
if(data.code=="-1")
{alert(data.msg);window.location=loginaddress;return;}
if(data.code=="-2")
{initwin();notifyactionresult(data.msg);return;}
if(data.msg!="")
{initwin();notifyactionresult(data.msg);return;}
setplayer(data.code);$('#apopup').hidePopup();$("#apopup").html("");$("#apopup").hide();loadint();}
function msgonfightboard(msg)
{var shwstr=msg+"<br/>"+$('#messagetext').html();$('#messagetext').html(shwstr);}
function msgonchatboard(msg)
{var talkbox=$('#talkbox');var shwstr=talkbox.html()+msg+"<br/>";talkbox.html(shwstr);var objDiv=document.getElementById("talkbox");objDiv.scrollTop=objDiv.scrollHeight;}
function loadint()
{loadingOff();$("#chatdiv").load("/a3k/chat.html");$("#maindiv").load("/a3k/map.html");loadqestionlist(getplayer());LoadPlayerInfo(getplayer());listshortcut(getplayer());}
function checkplayer()
{if(getplayer()==null)
{$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{what:"checkplayer"},success:function(data){enteringgame_res(data);},error:function(){refershonerror();},timeout:20000});return false;}else
{return true;}}
function Pexpcount(me){$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{me:getplayer(),what:"expcount"},timeout:20000});}
var fkind;var danpc;function intoFight()
{loadingOn();loadmaindiv("fight.html");}
function invocapt()
{loadingOn();if($('#capopup').length==0){$('<div></div>').attr('id','capopup').css('position','absolute').hide().popup({inkSensor:false,outSensor:false}).appendTo('body');}
$('#capopup').load('./capt.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left+92,y:toolPosition.top+72});});}
function refershonerror()
{alert('對不起 , 突然斷線, 請按F5重新取得連線.');}