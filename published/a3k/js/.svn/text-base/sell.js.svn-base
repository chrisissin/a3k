// (c)2009 worxup

var auction_id;$(document).ready(function(){$("#closebtn").unbind('click');$('#closebtn').bind("click",function(){$('#popup').hidePopup();});$("#sellbtn").unbind('click');$('#sellbtn').bind("click",function(){auctionsell(auction_id);});getauctionlist();});function getauctionlist()
{$.post("./dispatchers/dispatcher.php",{what:"getauctionlist"},function(data){showauctionlist(data);},'json');}
function showauctionlist(data)
{if(data!=null)
{}
else
{notifyactionresult("No auctionlist");}}
function auctionsell(auction_id)
{auction_id=16;$.post("./dispatchers/dispatcher.php",{me:""+getplayer()+"",thing:""+auction_id+"",what:"auctionsell"},function(data){resauctionsell(data);},'text');}
function resauctionsell(data)
{notifyactionresult(data);}