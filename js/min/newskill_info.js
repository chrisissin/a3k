
$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$("#skillbtn").unbind('click');$('#skillbtn').bind("click",function(){newbieinstruct17(msg17);$('#popup').load('./newskill_info.html',{},function(){$(this).showPopup();});});$("#toshortcut").unbind('click');$('#toshortcut').bind("click",function(){$('#toshortcut').removeClass('guide_bag_btn');$('#toshortcut').addClass('bag_btn');shortcutskill();});loadskilllist(getplayer());});function loadskilllist(me)
{$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"loadskilllist"},function(data){loadingOn();displayskills(data);loadingOff();},'json');}
function displayskills(data)
{$('#skilllist').html("");var celpline=5;var celcount=1;var aline="<tr>";if(data!=null)
{for(var i=0;i<data.length;++i)
{var img=data[i].skill_img;var daid=data[i].skill_id;var dispeq="主";if(data[i].skill_active!=0)
dispeq="被";var idstr="'"+daid+"'";var thecell=" \
                        <td width='32' height='32'><a class='bag_icon' id='skillcell_"+daid+"' name='"+daid+"' onclick=\"gettheskillinfo("+idstr+")\"> \
                                  <table width='32' height='32' border='0' cellpadding='0' cellspacing='0' background='"+hinet+"images_ico/"+img+".gif'> \
                                    <tr> \
                                      <td id='chooseskill' class='guide_bag_icon'>"+dispeq+"</td> \
                                    </tr> \
                                  </table></a> \
                           </td> \
                 ";aline+=thecell;if(celcount==celpline||i==data.length-1)
{celcount=0;$('#skilllist').html($('#skilllist').html()+aline+"</tr>");aline="<tr>";}
++celcount;}}}
function gettheskillinfo(theid)
{$('#chooseskill').removeClass('guide_bag_icon');$('#chooseskill').addClass('bag_icontext');$.post("./dispatchers/dispatcher.php",{theid:""+theid+"",what:"gettheskillinfo"},function(data){displayaskillinfo(data);newbieinstruct20(msg20);},'json');}
function displayaskillinfo(data)
{$('#skillname').text(data.skill_name);$('#skilldescbox').text(data.skill_descr);document.getElementById('dascskillid').value=data.skill_id;}
function shortcutskill()
{var skid=document.getElementById('dascskillid').value;var me=getplayer();var scp=document.getElementById('whichsc').value;if(scp==""||!IsNumeric(scp)){scp="1";}
$.post("./dispatchers/dispatcher.php",{me:""+me+"",skid:""+skid+"",scp:""+scp+"",what:"shortcutskill"},function(data){shortcutresult(data);});}
function shortcutresult(data)
{data=parseInt(data);if(data==1)
{notifyactionresult('完成');$('#popup').hidePopup();listshortcut(getplayer());newbieinstruct21(msg21);}else if(data==-1)
{notifyactionresult('被動技能不用快捷');}else if(data==-2)
{notifyactionresult('職業熟練度100%之後才能使用');}
else
notifyactionresult('失敗');}