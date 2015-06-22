
var pack_id=0;
var price=0;
var much=0;
$(document).ready(function() {
	//close input box
	$("#auctionoffbtn").unbind('click');
	$('#auctionoffbtn').bind("click", function() {
		LoadPlayerInfo(getplayer());
		$('#salepopup').hidePopup();
	});
	//
	$("#auction_yes").unbind('click');
	$('#auction_yes').bind("click", function() {auction_set();});

});
function get_packid(fpack_id)
{
	pack_id=fpack_id;
}
function auction_set()
{
	price=$('#auction_price').val();
	much=$('#auction_much').val();
	
	//alert(pack_id+"\nprice:"+price+"\nmuch:"+much);
	if(IsNumeric(price.trim()) && IsNumeric(much.trim()))
	{
			$.ajax({
				dataType: "text",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
pack_id:""+pack_id+"",price:""+price+"",much:""+much+"",what:"set_auction"
				},
			success: function(data) {
				auction_ok(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});				
	}
	else
	{
		notifyactionresult("Error");
	}
}
function auction_ok(data)
{
	pack_id=0;
	price=0;
	much=0;
	notifyactionresult(data);
	$('#salepopup').hidePopup();
	$('#auction_price').val()="";
	$('#auction_much').val()="";
	
}
