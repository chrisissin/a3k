// (c)2009 worxup

var plpgfrom=0;var plpgto=10;$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();plpgfrom=0;plpgto=10;});$("#pllastpg").unbind('click');$('#pllastpg').bind("click",function(){if(plpgfrom-10>0)
{plpgfrom=plpgfrom-10;plpgto=plpgto-10;getplist(getplayer(),plpgfrom,plpgto,$('#lookfor').val().trim());}});$("#plnextpg").unbind('click');$('#plnextpg').bind("click",function(){plpgfrom=plpgfrom+10;plpgto=plpgto+10;getplist(getplayer(),plpgfrom,plpgto,$('#lookfor').val().trim());});$("#lookforbtn").unbind('click');$('#lookforbtn').bind("click",function(){plpgfrom=0;plpgto=10;if($('#lookfor').val().trim()!="")
getplist(getplayer(),plpgfrom,plpgto,$('#lookfor').val().trim());else
notifyactionresult('請輸入名子');});getplist(getplayer(),plpgfrom,plpgto,"");clearinfo()});function getplist(me,from,to,sname)
{$.ajax({type:"POST",dataType:"json",cache:false,url:"./dispatchers/dispatcher.php",data:{what:'getplist',me:getplayer(),from:""+from+"",to:""+to+"",sname:""+sname+""},success:function(data){getplist_res(data);},error:function(){refershonerror();},timeout:20000});}
function getplist_res(data)
{for(var i=0;i<10;++i)
{$("#brother-"+i+"-name").html("");$("#brother-"+i+"-role").text("");$("#brother-"+i+"-lv").text("");}
if(data!=null){for(var i=0;i<data.length;++i)
{thehtml="<a onclick='getinfo("+data[i]["p_id"]+");' >"+data[i]["p_name"]+"</a><br/>";$("#brother-"+i+"-name").html(thehtml);$("#brother-"+i+"-role").text(data[i]["role_name"]);$("#brother-"+i+"-lv").text(data[i]["p_lv"]);}}
else
{}}
function getinfo(daid)
{$.ajax({type:"POST",dataType:"json",cache:false,url:"./dispatchers/dispatcher.php",data:{what:'getpinfo',daid:""+daid+""},success:function(data){getinfo_res(data);},error:function(){refershonerror();},timeout:function(){refershonerror();}});}
function getinfo_res(data)
{$('#theshow').show();clearinfo();$('#player-name').text(data.p_name);$('#player-rank').text(data.p_rankname);$('#player-lv').text(data.p_lv);$('#player-exp').text(data.p_exp);$('#player-expnext').text(data.p_nextexp);$('#player-atstate').text(data.map_state_name);$('#player-atcity').text(data.map_city_name);$('#player-win').text(data.p_win);$('#player-loss').text(data.p_lost);$('#player-guild').text(data.p_guild);$('#player-hp').text(data.p_hp);$('#player-mn').text(data.p_mn);$('#player-maxhp').text(data.p_hpmax);$('#player-maxmn').text(data.p_mnmax);$('#player-str').text(data.p_str);$('#player-wis').text(data.p_smart);$('#player-agl').text(data.p_agl);$('#player-btype').text(data.p_vit);$('#player-bone').text(data.p_bone);$('#player-at').text(data.p_at);$('#player-df').text(data.p_df);$('#player-guild').text(data.g_name);$('#player-job').text(data.role_name);$("#player-img").css("background-image","url("+net+"/images_char/icon/left/"+data.p_img+".gif)");$("#player-img").show();}
function clearinfo()
{$('#player-name').text("");$('#player-rank').text("");$('#player-lv').text("");$('#player-exp').text("");$('#player-expnext').text("");$('#player-atstate').text("");$('#player-atcity').text("");$('#player-win').text("");$('#player-loss').text("");$('#player-guild').text("");$('#player-hp').text("");$('#player-mn').text("");$('#player-maxhp').text("");$('#player-maxmn').text("");$('#player-str').text("");$('#player-wis').text("");$('#player-agl').text("");$('#player-btype').text("");$('#player-bone').text("");$('#player-at').text("");$('#player-df').text("");$('#player-job').text("");$("#player-img").hide();}