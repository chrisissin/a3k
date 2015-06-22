
$(document).ready(function(){
	
		$("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
    });
    $("#confirmtrade").unbind('click');
    $('#confirmtrade').bind("click", function() {
        onconfirmtrade();
    });
    $("#felsel").unbind('click');
    $('#felsel').bind("click", function() {
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
        $('#popup').load('./fellow.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();        
    });
    
    getfellow_tradelist();
 
	});
	


	function getfellow_tradelist(){
					 $.post("./dispatchers/dispatcher.php", {  what: "getfellow_tradelist" },
	  	  	 function(data){ showfellow_tradelist(data); 
	  	  	 	 },'json'
	  	  				); 	
		}

function showfellow_tradelist(data)
{
	if(data != null && data.length > 0)
	{
		var thehtml ="";		
		var thetpl = "      <table width='150' border='0' cellpadding='0' cellspacing='0' class='fellow_bg'> \
        <tr>\
         \
          <td width='35'><div class='fellow_icon'>\
            <img src='"+hinet+"/images_char/icon/left/{2}.gif'/>\
          </div></td>\
          <td align='left' valign='middle' class='fellow_text'><a onclick=\"onselecttradefe('{0}');\">{1}</a></td>\
        </tr> \
      </table>";
		$('#thetraderlist').html('');
		for(var i = 0; i < data.length ; ++i)
		{
			thehtml+= String.format(thetpl, data[i]["fl_id"], data[i]["p_name"], data[i]["p_img"]);
		}
		$('#thetraderlist').html(thehtml);
	}
}
var tobetradflid =0;
function onselecttradefe(fid)
{
					 $.post("./dispatchers/dispatcher.php", { fid : ""+fid+"",  what: "getfellow_tradeinfo" },
	  	  	 function(data){ 
	  	  	 		showfellow_tradeinfo(data); 
	  	  	 		tobetradflid=fid;
	  	  	 	 }, 'json'
	  	  				); 	
					 $.post("./dispatchers/dispatcher.php", { who : ""+fid+"",  what: "getfellow_info" },
	  	  	 function(data){ 
	  	  	 		showfellow_info(data); 
	  	  	 	 }, 'json'
	  	  				); 		  	  				
}
function showfellow_info(data)
{
	$('#role_name').text(data.role_name );
	$('#p_at').text(data.p_at );
	$('#p_vit').text(data.p_vit );
	$('#p_agl').text(data.p_agl );
	$('#p_hpmax').text(data.p_hpmax );
	$('#p_mnmax').text(data.p_mnmax );
	$('#p_bone').text(data.p_bone );
	$('#p_str').text(data.p_str );
	$('#p_smart').text(data.p_smart );
	$('#p_df').text(data.p_df );
}

function showfellow_tradeinfo(data)
{
	if(data != null)
	{
		$('#needGs').text(data.needGs);
	}
	var theneedhtml="";
	for(var i = 0; i < data.needs.length ; ++i)
	{
		theneedhtml +=  data.needs[i].p_name + " Lv." + data.needs[i].p_lv + "<br/>" ;
	}
	$('#theneedlist').html(theneedhtml);
}
function onconfirmtrade()
{
	if(tobetradflid != 0)
	{
					 $.post("./dispatchers/dispatcher.php", { me : ""+getplayer()+"",  tobetradflid : ""+tobetradflid+"", what: "res_onconfirmtrade" },
	  	  	 function(data){ 
	  	  	 	res_onconfirmtrade(data); 
	  	  	 	 },"text"
	  	  				); 	
	}else
	{
		notifyactionresult('請選擇武將');
	}
}

function res_onconfirmtrade(data)
{
	notifyactionresult(data);
	unselectedfl();
}
function unselectedfl()
{
	tobetradflid = 0;	
	$('#needGs').text("");
	$('#theneedlist').html("");
	$('#role_name').text("");
	$('#p_at').text("");
	$('#p_vit').text("");
	$('#p_agl').text("");
	$('#p_hpmax').text("");
	$('#p_mnmax').text("");
	$('#p_bone').text("");
	$('#p_str').text("");
	$('#p_smart').text("");
	$('#p_df').text("");
}
