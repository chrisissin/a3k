
$(document).ready(function(){loadingOff();loadbalance(getplayer());loadmoney(getplayer());$('#savebtn').click(function(){if(IsNumeric($('#samount').val()))
onsaveclick(getplayer(),$('#samount').val());else
notifyactionresult('請填入存款數量');});$('#withdrawbtn').click(function(){if(IsNumeric($('#wamount').val()))
onwithdrawclick(getplayer(),$('#wamount').val());else
notifyactionresult('請填入提款數量');});$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});});function loadbalance(me)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"loadbalance"},function(data){balance_res(data);},'json');}
function loadmoney(me)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"getMoneyInMe"},function(data){money_res(data);},'json');}
function balance_res(data)
{$('#curbalance').text(data);}
function money_res(data)
{$('#curmoney').text(data);}
function onsaveclick(me,howmuch)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"save2bank",howmuch:""+howmuch+""},function(data){bankdisp_res(data);},'json');}
function onwithdrawclick(me,howmuch)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"withdrawfrombank",howmuch:""+howmuch+""},function(data){bankdisp_res(data);},'json');}
function bankdisp_res(data)
{notifyactionresult(data);loadbalance(getplayer());loadmoney(getplayer());}