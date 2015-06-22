
$.extend({toBinary:function(dec,length){var str='';dec=parseInt(dec,10)||0;for(var mod=0;dec>0;dec=dec>>1){str=(dec%2)+str;}
if(length&&str.length<length){for(var tmp='',bias=length-str.length;bias>0;bias--){tmp+='0';}
str=tmp+str;}
return str;},getWeekName:function(day){switch(parseInt(day,10)){case 0:return'週日';break;case 1:return'週一';break;case 2:return'週二';break;case 3:return'週三';break;case 4:return'週四';break;case 5:return'週五';break;case 6:return'週六';break;default:return'未知';break;}}});$(document).ready(function(){if(window.location.search&&window.location.search.indexOf('q_id')!=-1){var search=window.location.search;showQuestDescription(search.substr(search.indexOf('q_id')+5));}else{getRequester();}
$('#con_btn_off').click(function(){$('#popup').hidePopup();});});function clearQuestButton(){$('#questList1').removeClass().unbind().find('a').removeClass();$('#questList2').removeClass().unbind().find('a').removeClass();$('#questList3').removeClass().unbind().find('a').removeClass();}
function clearQuestDetail(){$('.mission_show_text, .mission_show_text2, .mission_show_text3').html('沒有描述').end().find('#accept, #canncel, #report').data('quest',null);}
function getQuestAcceptedList(show_q_id){$('.con_boxbg_05').load('mission_3.html .con_boxbg_05 > div',{},function(e){initQuestPage();$('#cancel').unbind().click(function(){if(!$('#cancel').data('q_id')){notifyactionresult('沒有選取任務');return false;}
var q_id=$('#cancel').data('q_id');var q_title=getQuestTitleFromList(q_id);if(confirm("確定取消 ["+q_title+"] 任務?")===false){return;}
$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'cancelQuest',q_id:q_id},function(data){if(data.error){notifyactionresult(data.error);return;}
notifyactionresult('你放棄了 ['+q_title+'] 任務');removeQuestFromList(q_id);clearQuestDetail();loadqestionlist(getplayer());},'json');});$('#report').unbind().click(function(){if(!$('#report').data('q_id')){notifyactionresult('沒有選取任務');return false;}
var q_id=$('#report').data('q_id');var q_title=getQuestTitleFromList(q_id);$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'reportQuest',q_id:q_id},function(data){if(data.error){notifyactionresult(data.error);return;}
var q_title=getQuestTitleFromList(q_id);notifyactionresult('['+q_title+'] 完成 ! ');removeQuestFromList(q_id);clearQuestDetail();Pexpcount(getplayer());loadqestionlist(getplayer());LoadPlayerInfo(getplayer());},'json');});clearQuestButton();$('#questList1').click(getRequester).find('a').addClass('mission_btn');$('#questList2').addClass('mission_btn_selected');$('#questList3').click(getQuestFinishedList).find('a').addClass('mission_btn');$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'getAcceptedList'},function(data){handleQuestList(data);if(show_q_id){$('.mission_listtext > div > a[id="'+show_q_id+'"]').click();}},'json');});}
function getQuestDetail(e){var source=e.target;$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'getQuestDetail',q_id:$(source).attr('id')},function(data){if(data.error){notifyactionresult(data.error);return;}
$('#accept, #cancel, #report').data('q_id',data.q_id);$('.mission_show_text').html(data.description+'<hr/>'+parseQuestAward(data.award)).end().find('.mission_show_text2').html(parseQuestLimit(data.limit)).end().find('.mission_show_text3').html(parseQuestNeed(data.need));},'json');}
function getQuestFinishedList(){$('.con_boxbg_05').load('mission_4.html .con_boxbg_05 > div',{},function(e){initQuestPage();clearQuestButton();$('#questList1').click(getRequester).find('a').addClass('mission_btn');$('#questList2').click(getQuestAcceptedList).find('a').addClass('mission_btn');$('#questList3').addClass('mission_btn_selected');$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'getFinishedList'},handleQuestList,'json');});}
function getQuestList(e){var name=$(e.target).html();$('#questList1').click(getRequester);$('.con_boxbg_05').load('mission_2.html .con_boxbg_05 > div',{},function(){initQuestPage();$('#accept a').unbind().click(function(e){if(!$('#accept').data('q_id')){notifyactionresult('沒有選取任務');return false;}
var q_id=$('#accept').data('q_id');$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'acceptQuest',q_id:q_id},function(data){if(data.error){notifyactionresult(data.error);return;}
var q_title=getQuestTitleFromList(q_id);if(data.finish){notifyactionresult('你完成了 ['+q_title+'] 任務');}else{notifyactionresult('你接受了 ['+q_title+'] 任務');}
removeQuestFromList(q_id);clearQuestDetail();loadqestionlist(getplayer());},'json');});});$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'getQuestList',requester:name},handleQuestList,'json');}
function getRequester(){$('.con_boxbg_05').load('mission_1.html .con_boxbg_05 > div',{},function(){clearQuestButton();$('#questList1').addClass('mission_btn_selected');$('#questList2').click(getQuestAcceptedList).find('a').addClass('mission_btn');$('#questList3').click(getQuestFinishedList).find('a').addClass('mission_btn');var templateBox=$('.template_box').clone();var requestBox=$('#request_box').empty();var face=templateBox.find('.mission_client_box img');var requestText=templateBox.find('.mission_client_text');var debug="<a width='50' onclick=\"townmission()\">這裡沒有委託人! </a>";templateBox.remove();$.post('./dispatchers/dispatcher.php',{f:'quest',me:getplayer(),act:'getRequester'},function(data){if(data.requester.length>0)
{requestBox.empty();$(data.requester).each(function(i){var s=this.split(',');requestText.html(s[0]);face.attr('src','./images_char/icon/left/'+s[1]+'.gif');templateBox.clone().appendTo($('#request_box'));});$('.template_box .mission_client_text').click(getQuestList);}
else
{requestBox.empty();requestText.html(debug);face.attr('src','./images_char/icon/left/h0060.gif');templateBox.clone().appendTo($('#request_box'));}},'json');});}
function townmission()
{$('.template_box .mission_client_text').click(toDownTown(getplayer()));getRequester();}
function handleQuestList(data){var $list=$('.mission_listtext').empty();if(data.list.length==0){$list.append('<p>沒有任務</p>');return;}
for(var i in data.list){var s=data.list[i].split(',');$list.append('<div><a id="'+s[0]+'" href="#">'+s[1]+'</a></div>');if(s[2]&&parseInt(s[2],10)==2){$('#'+s[0]).before('<span>[可完成]</span>');}}
$('.mission_listtext a').click(getQuestDetail);}
function initQuestPage(){$('.mission_listtitle').html(name+'任務列表').end().find('.mission_listtext').html('');clearQuestDetail();}
function parseQuestAward(award){var str='【任務獎勵】<br/>';var arr=[];if(award.exp){arr.push('經驗值：<span class="mission_pointtext">'+(award.exp<0?'-':'+')+award.exp+'</span>');}
if(award.money){arr.push('金錢：<span class="mission_pointtext">'+(award.money<0?'-':'+')+award.money+'</span>');}
if(award.point&&parseInt(award.point)!=0){arr.push('學點：<span class="mission_pointtext">'+(award.point<0?'-':'+')+award.point+'</span>');}
if(award.item){for(var k in award.item){arr.push('<span class="mission_pointtext">'+k+(award.item[k]>1?' x'+award.item[k]:'')+'</span>');}}
if(award.fellow){$.each(award.fellow,function(i,v){arr.push('武將：<span class="mission_pointtext">'+v+'</span>');});}
if(award.description){arr.push(award.description);}
return str+(arr.length==0?'沒有獎勵':arr.join('<br/>'));}
function parseQuestLimit(limit){var arr=[];if(limit.job){arr.push('職業：'+limit.job);}
if(limit.lv){arr.push('等級需求： <span class="mission_pointtext">Lv'+limit.lv+'</span>');}
if(limit.item){for(var k in limit.item){arr.push('持有 <span class="mission_pointtext">'+k+(limit.item[k]>1?' x'+limit.item[k]:'')+'</span>');}}
if(limit.week){var hour=$.toBinary(limit.hour,24).split('');var str='';if(!(limit.week^127)){arr.push('每日');}else{var week=$.toBinary(limit.week,7).split('');str='每';for(var i in week){if(parseInt(week[i],2)){str+=$.getWeekName(i)+' ';}}
arr.push(str);str="";}
for(var i=0,span=false,begin=0,cur=0;i<24||span==true;i++){cur=parseInt(hour[i],2);switch(span){case true:if(isNaN(cur)||cur==0){arr.push(begin+' ~ '+(i<10?'0':'')+i+':00');span=false;}
break;case false:if(cur==1){begin=(i<10?'0':'')+i+':00';span=true;}
break;}}}
if(limit.quest){for(var i in limit.quest){arr.push('完成 <span class="mission_pointtext">'+limit.quest[i]+'</span>');}}
if(limit.description){arr.push(limit.description);}
return arr.length==0?'沒有限制':arr.join('<br/>');}
function parseQuestNeed(need){var arr=[];if(need.monster){for(var k in need.monster){arr.push('擊倒 '+k+' x'+need.monster[k]);}}
if(need.fight){$.each(need.fight,function(i,v){arr.push('在'+i+'戰鬥勝利 <span class="mission_pointtext">'+v+'</span> 場');});}
if(need.item){for(var k in need.item){arr.push('取得 <span class="mission_pointtext">'+k+(need.item[k]>1?' x'+need.item[k]:'')+'</span>');}}
if(need.description){arr.push(need.description);}
return arr.length==0?'沒有限制':arr.join('<br/>');}
function removeQuestFromList(item){var $list=$('.mission_listtext > div > a');$list.each(function(){if($(this).attr('id')==item){$(this).parent().remove();}});if($('.mission_listtext > div').length==0){$('.mission_listtext').append('<p>沒有任務</p>');}}
function getQuestTitleFromList(q_id){var $list=$('.mission_listtext > div > a');var q_title='';$list.each(function(){if($(this).attr('id')==q_id){q_title=$(this).text();return false;}});return q_title;}
function showQuestDescription(q_id){getQuestAcceptedList(q_id);}