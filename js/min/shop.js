
var selectedItemid;var selectedSingleid;$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$("#eqptbuy").unbind('click');$("#eqptbuy").bind('click',function(){eqptinit();});$("#itembuy").unbind('click');$("#itembuy").bind('click',function(){iteminit();});$("#itemsell").unbind('click');$("#itemsell").bind('click',function(){siteminit();});$("#eqptsell").unbind('click');$("#eqptsell").bind('click',function(){seqptinit();});$("#sellit").unbind('click');$('#sellit').bind("click",function(){$('#popup').hidePopup();loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup(false).appendTo('body');}
$('#popup').load('./shop_buy2.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();seqptinit();});$("#buyit").unbind('click');$('#buyit').bind("click",function(){$('#popup').hidePopup();loadingOn();if($('#popup').length==0){$('<div></div>').attr('id','popup').css('position','absolute').hide().popup(false).appendTo('body');}
$('#popup').load('./shop_buy1.html',{},function(){$(this).showPopup();var tool=$('#maindiv');var toolPosition=tool.offset();moveTo($(this),{x:toolPosition.left-20,y:toolPosition.top-20});loadingOff();});$("#popup").draggable();eqptinit();});$("#buybtn").unbind('click');$('#buybtn').bind("click",function()
{if(selectedSingleid==getplayer())
buyitem(selectedSingleid,selectedItemid);else
notifyactionresult("請選擇物品");});$("#sellbtn").unbind('click');$('#sellbtn').bind("click",function()
{if(selectedSingleid==getplayer())
sellitem(selectedSingleid,selectedItemid,getplayer());else
notifyactionresult("請選擇物品");});eqptinit();});function eqptinit()
{disp_initialitem();selectedItemid="";getshopInfo(getplayer(),'1');stagdisplay('eqptbtn');}
function iteminit()
{disp_initialitem();selectedSingleid="";getshopInfo(getplayer(),'2');stagdisplay('itembtn');}
function buyitem(theid,itemid)
{if(theid!=undefined){$.post("./dispatchers/dispatcher.php",{theid:""+theid+"",itemid:""+itemid+"",what:"buyitem"},function(data){exeJSstring(data);getmoneyinfo(getplayer());LoadPlayerInfo(getplayer());});}}
function stagdisplay(whichone)
{$('#eqptbtnbox').removeClass('mission_btn_selected');$('#itembtnbox').removeClass('mission_btn_selected');$('#'+whichone+'box').addClass('mission_btn_selected');$('#eqptbuy').addClass('mission_btn');$('#itembuy').addClass('mission_btn');$('#'+whichone).removeClass('mission_btn');}
function selltagdisplay(whichone)
{$('#eqptbtnbox').removeClass('mission_btn_selected');$('#itembtnbox').removeClass('mission_btn_selected');$('#'+whichone+'box').addClass('mission_btn_selected');$('#eqptsell').addClass('mission_btn');$('#itemsell').addClass('mission_btn');$('#'+whichone).removeClass('mission_btn');}
function closeThis()
{$("#closebtn").click();}
function getshopInfo(me,type1){$.post("./dispatchers/dispatcher.php",{type1:""+type1+"",me:""+me+"",what:"getshopInfo"},function(data){display_shop(data);getmoneyinfo(me,type1);},'json');}
function getmoneyinfo(me){$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"getMoneyInfo"},function(data){disp_money(data);},'json');}
function display_shop(data)
{$('#shoplisttbl').html("");var celpline=5;var celcount=1;var aline="<tr>";if(data!=null)
{for(var i=0;i<data.length;++i)
{var img=data[i].item_img;var daid=data[i].item_id;var idstr="'"+daid+"'";var thecell=" \
                        <td width='32' height='32'><a class='bag_icon' id='packcell_"+daid+"' name='"+daid+"' onclick=\"gettheiteminfo("+idstr+")\"> \
                                  <table width='32' height='32' border='0' cellpadding='0' cellspacing='0' background='"+hinet+"images_ico/"+img+".gif'> \
                                    <tr> \
                                      <td class='bag_icontext'></td> \
                                    </tr> \
                                  </table></a> \
                           </td> \
                 ";aline+=thecell;if(celcount==celpline||i==data.length-1)
{celcount=0;$('#shoplisttbl').html($('#shoplisttbl').html()+aline+"</tr>");aline="<tr>";}
++celcount;}}}
function disp_money(data){$('#gold').text(data.p_money);$('#rmoney').text(data.p_r_money);}
function gettheiteminfo(itemid)
{$.post("./dispatchers/dispatcher.php",{itemid:""+itemid+"",what:"gettheiteminfo"},function(data){disp_singleitem(data);selectedSingleid=getplayer();selectedItemid=itemid;},'json');}
function disp_singleitem(data){var sellprice=data.item_price/10;var checkmod=sellprice%1;if(checkmod!=0)
sellprice+=(1-checkmod);$('#item_name').text("");$('#item_ef_type1').text("");$('#item_ef_type2').text("");$('#item_ef_price').text("");$('#item_ef_at').text("");$('#item_ef_df').text("");$('#item_ef_str').text("");$('#item_ef_bone').text("");$('#item_ef_vit').text("");$('#item_ef_agl').text("");$('#item_ef_smart').text("");$('#item_ef_hp').text("");$('#item_ef_mn').text("");$('#item_desc').text("");$('#bag_showtext').show();$('#item_name').text(data.item_name);$('#item_ef_type1').text(data.item_type1);$('#item_ef_type2').text(data.item_type2);$('#item_ef_price').text(data.item_price);$('#item_sell_price').text(sellprice);$('#item_ef_at').text(data.item_ef_at);$('#item_ef_df').text(data.item_ef_df);$('#item_ef_str').text(data.item_ef_str);$('#item_ef_bone').text(data.item_ef_bone);$('#item_ef_vit').text(data.item_ef_vit);$('#item_ef_agl').text(data.item_ef_agl);$('#item_ef_smart').text(data.item_ef_smart);$('#item_ef_hp').text(data.item_ef_hp);$('#item_ef_mn').text(data.item_ef_mn);$('#item_desc').text(data.item_desc);}
function seqptinit()
{disp_initialitem();selectedSingleid="";getPackInfo(getplayer(),'1');selltagdisplay('eqptbtn');}
function siteminit()
{disp_initialitem();selectedSingleid="";getPackInfo(getplayer(),'2');selltagdisplay('itembtn');}
function getPackInfo(me,type1)
{$.post("./dispatchers/dispatcher.php",{type1:""+type1+"",me:""+me+"",what:"getPackInfo"},function(data){display_pack(data);getmoneyinfo(me,type1);},'json');}
function display_pack(data)
{$('#packlisttbl').html("");var celpline=5;var celcount=1;var aline="<tr>";if(data!=null)
{for(var i=0;i<data.length;++i)
{var img=data[i].item_img;var daid=data[i].item_id;var dapiid=data[i].id;var dispeq="";if(data[i].item_eq!=0)
dispeq="E";var dispstacknum="";if(data[i].item_stacknum)
{if(data[i].item_stacknum!=0)
dispstacknum=data[i].item_stacknum;}
var idstr="'"+daid+"'";var piidstr="'"+dapiid+"'";var thecell=" \
                        <td width='32' height='32'><a class='bag_icon' id='packcell_"+daid+"' name='"+daid+"' onclick=\"gettheiteminfo("+idstr+", "+piidstr+")\"> \
                                  <table width='32' height='32' border='0' cellpadding='0' cellspacing='0' background='"+hinet+"images_ico/"+img+".gif'> \
                                    <tr> \
                                      <td class='bag_icontext'>"+dispeq+dispstacknum+"</td> \
                                    </tr> \
                                  </table></a> \
                           </td> \
                 ";aline+=thecell;if(celcount==celpline||i==data.length-1)
{celcount=0;$('#packlisttbl').html($('#packlisttbl').html()+aline+"</tr>");aline="<tr>";}
++celcount;}}}
function disp_initialitem(){$('#item_name').text("");$('#item_ef_type1').text("");$('#item_ef_type2').text("");$('#item_ef_price').text("");$('#item_ef_at').text("");$('#item_ef_df').text("");$('#item_ef_str').text("");$('#item_ef_bone').text("");$('#item_ef_vit').text("");$('#item_ef_agl').text("");$('#item_ef_smart').text("");$('#item_ef_hp').text("");$('#item_ef_mn').text("");$('#item_desc').text("");}
function sellitem(theid,itemid,me)
{if(theid!=undefined){$.post("./dispatchers/dispatcher.php",{theid:""+theid+"",itemid:""+itemid+"",what:"sellitem"},function(data){exeJSstring(data);getmoneyinfo(getplayer());LoadPlayerInfo(getplayer());seqptinit();});}}