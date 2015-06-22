
$(document).ready(function() {
	
		$("#fellowsell").unbind('click');
    $('#fellowsell').bind("click", function() {
		fellowsell();
    });
			$("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
    });
    $("#feltrade").unbind('click');
    $('#feltrade').bind("click", function() {
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
        $('#popup').load('./fellow_trade.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();        
    });	

		getfellowlist();
});

function getfellowlist()
{
					 $.post("./dispatchers/dispatcher.php", {  what: "getfellowlist" },
	  	  	 function(data){ showfellowerlist(data); 
	  	  	 	 },'json'
	  	  				); 				
}

function showfellowerlist(data)
{
	if(data != undefined){
	if(data!= null || data.length > 0){
		//alert(data[0].p_name);
		var text0="";
		var text01="<table width='150' border='0' cellpadding='0' cellspacing='0' class='fellow_bg' ><tr><td width='35'  ><div class='fellow_icon'><img src='"+hinet+"/images_char/icon/left/";
		var test02="'></img></div></td><td align='left' valign='middle' class='fellow_text'><a onclick=\"fellowtable('";
		var test03="');\">";
		var test04="</a></td></tr></table>";
		for (var i=0;i< data.length;i++)
		{
			text0+=text01+data[i].p_img+".gif"+test02+data[i].fl_id+test03+data[i].p_name+test04;
		}
		$("#fellowlist").html(text0);
	}}
}
var gfl_id ="";

function fellowtable(fl_id)
{     
	//alert(fl_id);
	$.post("./dispatchers/dispatcher.php",{who:""+fl_id+"",what:"getfellowsinfo"},
		function(data) {
			showfellowinfo(data);
			gfl_id = fl_id;
			},'json');
}
//顯示武將個人資料
function showfellowinfo(data)
{
	if(data!=null){
	$("#role_name").text(data.role_name);
	$("#p_hpmax").text(data.p_hpmax);
	$("#p_mnmax").text(data.p_mnmax);
	$("#p_str").text(data.p_str);
	$("#p_smart").text(data.p_smart);
	$("#p_vit").text(data.p_vit);
	$("#p_agl").text(data.p_agl);
	$("#p_bone").text(data.p_bone);
	$("#p_at").text(data.p_at);
	$("#p_df").text(data.p_df);
	$("#fl_cash").text(data.fl_cash);
}
}

function fellowsell()
{
			$.ajax({
				dataType: "text",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
me:""+getplayer()+"",who:""+gfl_id+"",what:"fellowsell"
				},
			success: function(data) {
				resfellowsell(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});			

}

function resfellowsell(data)
{
	gfl_id ="";
	$("#role_name").text("");
	$("#p_hpmax").text("");
	$("#p_mnmax").text("");
	$("#p_str").text("");
	$("#p_smart").text("");
	$("#p_vit").text("");
	$("#p_agl").text("");
	$("#p_bone").text("");
	$("#p_at").text("");
	$("#p_df").text("");
	$("#fl_cash").text("");
	notifyactionresult(data);
}
