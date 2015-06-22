var auction_id;

/**/
$(document).ready(function() {
	
	/* 關視窗 */
	$("#closebtn").unbind('click');
	$('#closebtn').bind("click", function() {
		$('#popup').hidePopup();
	});
	
	/* 購買鍵 */
	$("#sellbtn").unbind('click');
	$('#sellbtn').bind("click", function() {auctionsell(auction_id);});
	

	$("#equip_btn").unbind('click');
	$('#equip_btn').bind("click", function() {
		loadingOn();
		if ($('#popup').length == 0) {
			$('<div></div>')
			.attr('id', 'popup')
			.css('position', 'absolute')
			.hide()
			.popup(
			{
				linkSensor:false,
				outSensor:false
			})
			.appendTo('body');
		}
		$('#popup').load('./sell.html', {}, function() {
		$(this).showPopup();
		var tool = $('#maindiv');
		var toolPosition = tool.offset();
		moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
		loadingOff();
});
$("#popup").draggable();        
	});
	
	/*	取得拍賣資料	*/
	getauction_item();
});

/*	取得拍賣資料	*/
function getauction_item()
{
	//notifyactionresult("getauctionlist");
	$.post("./dispatchers/dispatcher.php",{what:"getauction_item"},
		function(data) {showauctionlist(data);},'json');
}

/*	列出拍買資料	*/
function showauctionlist(data)
{
	if (data != null)
	{
		//notifyactionresult("auctionlist");
		var text0="";
		var text1="<tr><td width='180' height='20' align='left' class='sell_bg'><input id='auction_ro' name='auction_ro' type='radio' value='";	/*	+auction_id	*/
		var text3="' /><span class='sell_text'>";	/*	+item_name	*/
		var text4="</span></td><td width='90' align='left' class='sell_bg'><span class='sell_text2'>";	/*	+p_name	*/
		var text5="</span></td><td width='80' align='right' class='sell_bg'><span class='sell_text3'>";	/*	+price	*/
		var text6="</span><br /></td><td width='60' align='center' class='sell_bg'><span class='sell_text2'>";	/*	+much	*/
		var text7="</span></td></tr>";
		
		for (var i=0;i<data.length;i++)
		{
			text0+=text1+data[i].id+text3+data[i].item_name+text4+data[i].p_name+text5+data[i].price+text6+data[i].much+text7;
		}
		//alert(text0);
		//notifyactionresult(text0);
		$("#auctionlist").html(text0);
		
	}
	else
	{
		notifyactionresult("目前無拍賣");
	}
}

/*	購買	*/
function auctionsell(auction_id)
{
	auction_id=$("input:checked").val();//$('#auction_ro').val();
	//notifyactionresult(auction.value);
	$.post("./dispatchers/dispatcher.php",{me:""+getplayer()+"",thing:""+auction_id+"",what:"auctionsell"},
		function(data) {resauctionsell(data);});
}

/**/
function resauctionsell(data)
{
	notifyactionresult(data);
}