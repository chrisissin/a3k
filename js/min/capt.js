
$(document).ready(function(){$('#robotcall').click(function(){callrobot(getplayer(),document.getElementById('code').value);});});function callrobot(me,code)
{$.post("./capt/capt_dispatcher.php",{me:""+me+"",code:""+code+""},function(data){res_callrobot(data);});}
function reloadcapt()
{$('#capopup').load('./capt.php');}
function res_callrobot(data)
{$('#exe').html(data);}