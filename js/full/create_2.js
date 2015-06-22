// (c)2009 worxup

$(document).ready(function(){$("#create_btn2").unbind('click');$('#create_btn2').bind("click",function(){createcharacter();});var promoc=getCookie('promo');if(promoc!="")
{var thebox=document.getElementById('promo_code');if(thebox!=undefined)
{thebox.value=promoc;}}});var imgname="p0050";var gender="1";var roleid="a01";function createcharacter()
{var pname=$('#ptextfield').val();gender=getCheckedValue(document.forms['genderradiogroup'].elements['gendergroup']);roleid=getCheckedValue(document.forms['roleradiogroup'].elements['rolegroup']);onclickrole(roleid);if(pname&&pname.length>=9)
{alert("請不要超過8個字");return;}
var promocode="";var thebox=document.getElementById('promo_code');if(thebox!=undefined)
{promocode=thebox.value;}
if(roleid!=""&&gender!==""&&pname!=="")
{$("#create_btn2").unbind('click');$.ajax({dataType:"json",type:"POST",url:"./dispatchers/dispatcher.php",data:{roleid:""+roleid+"",gender:""+gender+"",pname:""+pname+"",img:""+imgname+"",promocode:""+promocode+"",what:"createcharacter"},success:function(data){$('#create_btn2').bind("click",function(){createcharacter();});create_p_res(data);},error:function(){refershonerror();},timeout:20000});}}
function onclickgender(gen)
{gender=gen;swapimg(roleid,gender);}
function onclickrole(roled)
{roleid=roled;swapimg(roleid,gender);}
function swapimg(rol,gen)
{$('#create_player').hide();if(gen=="0")
{switch(rol){case"a01":imgname="p0060";break;case"b01":imgname="p0040";break;case"c01":imgname="p0050";break;default:break;}}else{switch(rol){case"a01":imgname="p0030";break;case"b01":imgname="p0010";break;case"c01":imgname="p0020";break;default:break;}}
$("#create_player").css("background-image","url(/a3k/images_char/still/left/"+imgname+"_2.gif)");$('#create_player').fadeIn("slow");}
function create_p_res(data)
{if(data.msg=='1'){setplayer(data.code);window.location='newb.html';}else
{notifyactionresult(data.msg);}}