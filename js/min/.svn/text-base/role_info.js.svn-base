
﻿
$(document).ready(function(){getAllRoleTree(getplayer());$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$("#brobtn").unbind('click');$('#brobtn').bind("click",function(){$('#popup').load('./brother_info.html',{},function(){$(this).showPopup();});});$("#skillbtn").unbind('click');$('#skillbtn').bind("click",function(){$('#popup').load('./skill_info.html',{},function(){$(this).showPopup();});});$("#roleinfobtn").unbind('click');$('#roleinfobtn').bind("click",function(){$('#popup').load('./role_info.html',{},function(){$(this).showPopup();});});$("#playerbtn").unbind('click');$('#playerbtn').bind("click",function(){$('#popup').load('./player_info.html',{},function(){$(this).showPopup();});});$("#fellowbtn").unbind('click');$('#fellowbtn').bind("click",function(){$('#popup').load('./fellow_info.html',{},function(){$(this).showPopup();});});});function getAllRoleTree(me)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"getAllRoleTree"},function(data){loadingOn();getRoldInfo_back(data);loadingOff();},'json');}
function getRoldInfo_back(data)
{if(data.myrole.role_theegg!=undefined)
{$('#role_'+data.myrole.role_theegg).show();if(data)
{for(var i=0;i<data.mytree.length;++i)
{$('#'+data.mytree[i].role_id).css("background-image","url("+net+"/a3k/images_ico/"+data.mytree[i].role_img+".gif)");if(data.mytree[i].abc!=undefined)
{$('#'+data.mytree[i].role_id+"_alpha").hide();var changerolename=data.role_name;$('#'+data.mytree[i].role_id+"_lnkchangerole").show();$('#'+data.mytree[i].role_id+"_lnkchangerole").click(function()
{changerole(this.name,getplayer());});}
else
{$('#'+data.mytree[i].role_id+"_alpha").show();$('#'+data.mytree[i].role_id+"_lnkchangerole").hide();}
$('#'+data.mytree[i].role_id).click(function()
{getARoleInfo(this.id);});}}}
display_arole_desc(data.myrole);}
function getARoleInfo(roleid)
{$.post("./dispatchers/dispatcher.php",{roleid:""+roleid+"",what:"getARoleInfo"},function(data){display_arole_desc(data);},'json');}
function display_arole_desc(data)
{if(data){$('#spanparent').text(data.role_parentname);$('#spanstrlmt').text(data.role_lmt_str);$('#spanbonelmt').text(data.role_lmt_bone);$('#spanagllmt').text(data.role_lmt_agl);$('#spansmartlmt').text(data.role_lmt_smart);$('#spanvitlmt').text(data.role_lmt_vit);$('#divroledesc').text(data.role_descri);$('#imgroleskill').attr({src:""+net+"/a3k/images_ico/"+data.role_skillimg+".gif",title:data.role_skillname,alt:data.role_skillname});}}
function changerole(roleid,me)
{if(roleid!=undefined)
{$.post("./dispatchers/dispatcher.php",{roleid:""+roleid+"",me:""+me+"",what:"changerole"},function(data){exeJSstring(data);LoadPlayerInfo(getplayer());});}}