
var check=0;var selectedItemid;var selectedSingleid;var nameofitem;var priceofitem;var moneyforcheck;$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$('#scash').click(function(){$('#scash').attr('href',Cashaddress);});$("#buyinstore").unbind('click');$('#buyinstore').bind("click",function()
{if(selectedSingleid==getplayer())
{check=1;showtable();}
else
notifyactionresult("請選擇物品");});$("#Sunstore").unbind('click');$('#Sunstore').bind("click",function()
{check=0;nameofitem="";priceofitem="";storeinit();});$("#cancelbuy").unbind('click');$('#cancelbuy').bind("click",function()
{check=0;nameofitem="";priceofitem="";storeinit();});$("#finalbuy").unbind('click');$('#finalbuy').bind("click",function()
{buystoreitem(getplayer(),selectedItemid);});storeinit();});function storeinit(){showtable();disp_initialitem();selectedSingleid="";getstoreInfo();}
function getstoreInfo(){$.post("./dispatchers/dispatcher.php",{what:"getstoreInfo"},function(data){display_store(data);getmoneyinfo(getplayer());},'json');}
function getmoneyinfo(me){$.post("./dispatchers/dispatcher.php",{me:""+me+"",what:"getMoneyInfo"},function(data){disp_money(data);},'json');}
function disp_money(data){$('#storegold').text(data.p_money);$('#storermoney').text(data.p_r_money);moneyforcheck=data.p_r_money;}
function disp_initialitem(){$('#item_name').text("");$('#item_ef_type1').text("");$('#item_ef_type2').text("");$('#item_ef_price').text("");$('#item_ef_at').text("");$('#item_ef_df').text("");$('#item_ef_str').text("");$('#item_ef_bone').text("");$('#item_ef_vit').text("");$('#item_ef_agl').text("");$('#item_ef_smart').text("");$('#item_ef_hp').text("");$('#item_ef_mn').text("");$('#item_desc').text("");$('#item_r_price').text("");}
function display_store(data)
{$('#storelisttbl').html("");var celpline=3;var celcount=1;var aline="<tr>";if(data!=null)
{for(var i=0;i<data.length;++i)
{var img=data[i].item_img;var daid=data[i].item_id;var idstr="'"+daid+"'";var thecell=" \
                        <td width='56' height='56'><a class='store_icon'  onclick=\"gettheiteminfo("+idstr+")\"> \
                                  <img src='"+hinet+"images_ico/"+img+".gif' width='54' height='54' />\
                                  </a> \
                           </td> \
                 ";aline+=thecell;if(celcount==celpline||i==data.length-1)
{celcount=0;$('#storelisttbl').html($('#storelisttbl').html()+aline+"</tr>");aline="<tr>";}
++celcount;}}}
function gettheiteminfo(itemid)
{$('#itemsdetail').show();$('#checkbuy').hide();$.post("./dispatchers/dispatcher.php",{itemid:""+itemid+"",what:"gettheiteminfo"},function(data){disp_singleitem(data);selectedSingleid=getplayer();selectedItemid=itemid;},'json');}
function disp_singleitem(data){$('#item_name').text("");$('#item_ef_type1').text("");$('#item_ef_type2').text("");$('#item_ef_price').text("");$('#item_ef_at').text("");$('#item_ef_df').text("");$('#item_ef_str').text("");$('#item_ef_bone').text("");$('#item_ef_vit').text("");$('#item_ef_agl').text("");$('#item_ef_smart').text("");$('#item_ef_hp').text("");$('#item_ef_mn').text("");$('#item_desc').text("");$('#bag_showtext').show();$('#item_name').text(data.item_name);$('#item_ef_type1').text(data.item_type1);$('#item_ef_type2').text(data.item_type2);$('#item_ef_price').text(data.item_price);$('#item_r_price').text(data.item_r_price);$('#item_ef_at').text(data.item_ef_at);$('#item_ef_df').text(data.item_ef_df);$('#item_ef_str').text(data.item_ef_str);$('#item_ef_bone').text(data.item_ef_bone);$('#item_ef_vit').text(data.item_ef_vit);$('#item_ef_agl').text(data.item_ef_agl);$('#item_ef_smart').text(data.item_ef_smart);$('#item_ef_hp').text(data.item_ef_hp);$('#item_ef_mn').text(data.item_ef_mn);$('#item_desc').text(data.item_desc);nameofitem=data.item_name;priceofitem=data.item_r_price;}
function buystoreitem(theid,itemid)
{if(theid!=undefined){$.post("./dispatchers/dispatcher.php",{theid:""+theid+"",itemid:""+itemid+"",what:"buystoreitem"},function(data){notifyactionresult(data);exeJSstring(data);getmoneyinfo(getplayer());LoadPlayerInfo(getplayer());});}}
function showtable()
{if(check==0)
{$('#itemsdetail').show();$('#checkbuy').hide();}
else if(check==1)
{$('#itemsdetail').hide();$('#checkbuy').show();$('#sname').text(nameofitem);$('#item_rc_price').text(priceofitem);$('#checkmoney').text(moneyforcheck);var restmoneycount;restmoneycount=moneyforcheck-priceofitem;$('#restmoney').text(restmoneycount);}}