// (c)2009 worxup

(function($){$(document).ready(function(){$("#p_menu").popup(function(){switch($(this).attr('hash').substr(1)){case'status':break;case'whisper':whisperTo($("#p_menu").data('target'));break;case'team':break;case'blacklist':addBlacklist($("#p_menu").data('target'));break;default:return;break;}});$("#facial").popup(function(){var img=this.childdNodes?this.childNodes[0].src:this.src;if(!img){return false;}
var match=img.match(/^http:\/\/(.+\/)+([^\/]+)\.png$/i);if(!match[2]){return false;}
$('#textfield4').append($('<img src="'+match[0]+'"/>'));});$('#textfield4').attr('contentEditable',true).unbind('click').click(function(){$(this).blur().focus();});$('#func_menu').popup(function(){switch($(this).attr('hash').substr(1)){case'facial':{$('#facial').showPopup();var toolPosition=$('#tool').offset();$('#facial').moveTo({x:toolPosition.left-92,y:toolPosition.top-72});}
break;case'blacklist':{function _handle(){var toolPosition=$('#tool').offset();var table=$('#blacklist table tbody');var list=$('#blacklist').data('list');if(list.length==0){alert('沒有任何玩家在黑名單中');return;}
table.empty();$.each(list,function(k,v){var s2=v.split(',');$('<tr><td><a href="#">'+s2[1]+'</a></td></tr>').appendTo(table);});table.find('a').click(function(){var target=$(this);if(confirm('確定將[ '+target.html()+' ]從黑名單刪除？')==true){$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{f:'blacklist',act:'removeName',name:target.html(),me:getplayer()},success:function(data){if(data.error){notifyactionresult(data.error);}else{target.parent().parent().remove();$('#blacklist').data('list',$.grep(list,function(v,k){var s=v.split(',');return s[1]!=target.html();}));}},error:function(){refershonerror();},timeout:20000});}});$('#blacklist').showPopup().moveTo({x:toolPosition.left,y:toolPosition.top-100});}
var list=$('#blacklist').data('list');if((typeof list).toLowerCase()=='undefined'){$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{f:'blacklist',act:'getList',me:getplayer()},success:function(data){$('#blacklist').data('list',data.list?data.list.split(';'):[]);_handle();},error:function(){refershonerror();},timeout:20000});}else{_handle();}}
break;default:return;break;}});$('#blacklist').popup(function(){});$('#tool').click(function(e){var target=$('#func_menu');var tool=$('#tool');var toolPosition=tool.position();$('#func_menu').showPopup();target.data('target',$(e.target).html());target.moveTo({x:toolPosition.left,y:toolPosition.top+tool.outerHeight()});});$('input#textfield3').keypress(function(e){if(e.which==13){$('#textfield4').focus().click();return false;}}).one("click",function(){$('input#textfield3').val("");});$('#textfield4').data("isClick",false).keypress(function(e){if(e.which!=13){return;}
if(checkChangeCnannel()==false){$('a#submit').click();}
return false;}).one("click",function(){$('#textfield4').data("isClick",true);});var ct=new Date();ct.setTime(0);$('a#submit').data("usertime",0).data("clienttime",ct).data("log",{text:"",count:0}).click(function(){var obj=$('a#submit');var log=obj.data("log");$('#textfield4 > img').each(function(i,v){var match=this.src.match(/^http:\/\/(.+\/)+([^\/]+)\.png$/i);var imgText='%'+match[2]+'%';$(this).replaceWith(imgText);});var input=$('#textfield4').text();if(input.length>=50){notifyactionresult("太長了");$('#textfield4').html('');return false;}
if(input==""){return false;}
if((new Date()).getTime()-obj.data("clienttime").getTime()<3000&&obj.data("usertime")!=0){notifyactionresult("禁止連續發話！");return false;}
if(input==log.text){log.count+=1;if(log.count>2){notifyactionresult("請勿重複發言！");return;}}else{log.text=input;log.count=1;}
clearTimeout($('a#submit').data('timer'));$('#textfield4').html("");$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{f:'chat',act:"post",me:getplayer(),text:input,channel:$('#select2').val(),target:$('#textfield3').val(),usertime:$('a#submit').data("usertime"),index:$('a#submit').data('chatlogIndex')},success:function(data){if(data.error){showMsg(['5,'+data.error]);}else{$('a#submit').data("usertime",data.usertime).data("clienttime",new Date()).data('chatlogIndex',data.index).data('refreshTime',data.refreshTime);showMsg(data.msg,true);}
$('a#submit').data('timer',setTimeout(requestRefresh,$('#submit').data('refreshTime')));},error:function(){refershonerror();},timeout:20000});});$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{f:'chat',me:getplayer(),act:"init"},success:function(data){$('a#submit').data("usertime",data.usertime).data('refreshTime',data.refreshTime).data('chatlogIndex',data.index).data('timer',setTimeout(requestRefresh,$('#submit').data('refreshTime')));if(data.isLogined==false){$('#talkbox').html('尚未登入');}else{showMsg(data.msg,true);if(data.annouce!=null)
{showanouce(data.annouce);}}},error:function(){refershonerror();},timeout:20000});});function requestRefresh(){clearTimeout(mtv);$.ajax({type:"POST",dataType:"json",url:"./dispatchers/dispatcher.php",data:{f:'chat',act:'refresh',im:getplayer(),usertime:$('a#submit').data('usertime'),index:$('a#submit').data('chatlogIndex')},success:function(data){refresh_res(data);},error:function(data){ktv();},timeout:function(data){ktv();}});}
var mtv
function ktv()
{clearTimeout($('a#submit').data('timer'));mtv=setTimeout(requestRefresh,$('#submit').data('refreshTime'));}
function refresh_res(data)
{if(gcon(data))
{$('a#submit').data("usertime",data.usertime).data('refreshTime',data.refreshTime).data('chatlogIndex',data.index).data('timer',setTimeout(requestRefresh,$('#submit').data('refreshTime')));showMsg(data.msg);}}
function gcon(data)
{if(data.serverout!=null)
{alert(data.sysmsg);window.location=loginaddress;return false;}
if(data.lock===1||data.sesout===1)
{alert(data.sysmsg);setplayer(null);seta3klogin();checkplayer();return false;}
if(data.capt===1)
{invocapt();return false;}
if(data.annouce!=null)
{showanouce(data.annouce);return true;}
return true;}
function checkChangeCnannel(){var input=$('#textfield4').val();var changeChannel=false;switch(true){case(input.indexOf('/t')==0):$('select#select2').val(1);changeChannel=true;break;case(input.indexOf('/s')==0):$('select#select2').val(0);changeChannel=true;break;case(input.indexOf('/g')==0):$('select#select2').val(3);changeChannel=true;break;case(input.indexOf('/p')==0):$('select#select2').val(4);changeChannel=true;break;case(input.indexOf('/m')==0):$('select#select2').val(2);changeChannel=true;break;}
if(changeChannel==true){$('#textfield4').val(input.substr(2));}
return changeChannel;}
function showMenu(name){notifyactionresult(name);}
function showMsg(msg,clearText){if(!(msg instanceof Object)){notifyactionresult("錯誤的訊息");return;}
var talkbox=$('#talkbox');$.each(msg,function(key,value){var s=value.split(",",2);s[1]=s[1].replace(/%([^%]+)%/ig,"<img src=\""+$.facialPath+"$1.png\"/>");msg[key]='<span class="msg'+s[0]+'">'+s[1]+'</span><br/>';});msg=msg.join("");if(msg){$(msg).click(function(e){var target=$('#p_menu');if(target.data("isShow")==false){target.slideDown("fast",function(){target.data("isShow",true);delete target;});$('#p_menu').showPopup();}
target.data('target',$(e.target).html());target.moveTo({x:e.clientX,y:e.clientY});}).appendTo(talkbox);}
if(clearText==true){$('#textfield4').html("");}
var bias=talkbox[0].scrollHeight-talkbox[0].clientHeight;if(bias>0){talkbox.scrollTop(bias);}}
function whisperTo(name){$('#textfield3').click().val(name);$('#select2').val(2);}
function addBlacklist(name){$.post('./dispatchers/dispatcher.php',{f:'blacklist',act:'add',me:getplayer(),name:name},function(data){if(!data.error){var list=$('#blacklist').data('list');if((typeof list).toLowerCase()=='undefined'){$.post('./dispatchers/dispatcher.php',{f:'blacklist',act:'getList',me:getplayer()},function(data2){$('#blacklist').data('list',data2.list?data2.list.split(';'):[]);},'json');}else{list.push(data.id+','+data.name);$('#blacklist').data('list',list);}}
notifyactionresult(data.error||'成功地將'+data.name+'加入至黑名單中');},'json');}})(jQuery);