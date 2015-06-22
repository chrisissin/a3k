
$(document).ready(function() {
	getMixList();
		$("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
    });
    $("#confirmtrade").unbind('click');
    $('#confirmtrade').bind("click", function() {
        onconfirmmix();
    });	
});

function getMixList()
{
	  	$.post("./dispatchers/dispatcher.php", { what : "getMixList" },
	  	  	 function(data){ showMixList(data);	}, 'json');
}

function showMixList(data)
{
	if(data != null){
		var thehtml ="";
		var template = "<span><a class='mix_text3' onclick=\"mixselected('{0}');\"  >{1}</a></span><br />";
		for(var i =0; i < data.length ; ++i)
		{
			thehtml += String.format(template , data[i].item_id, data[i].item_name);
		}
		$('#mix_div2').html(thehtml);
	}
}
var tobetraditid =0;
function mixselected(itid)
{
	  	$.post("./dispatchers/dispatcher.php", { itid : ""+itid+"", what : "getMixItemInfo" },
	  	  	 function(data){ showMixInfo(data);	}, 'json');
					 $.post("./dispatchers/dispatcher.php", { itid : ""+itid+"",  what: "getMixItemInfo" },
	  	  	 function(data){ 
	  	  	 		showMixInfo(data); 
	  	  	 		tobetraditid=itid;
	  	  	 	 }, 'json'
	  	  				); 	
					 $.post("./dispatchers/dispatcher.php", { itid : ""+itid+"",  what: "getMixfullInfo" },
	  	  	 function(data){ 
	  	  	 		showMixfullInfo(data); 
	  	  	 	 }, 'json'
	  	  				); 		  	  	 
}
function showMixfullInfo(data)
{
	$('#item_desc').text(data.item_desc );
	$('#item_ef_mn').text(data.item_ef_mn );
	$('#item_ef_hp').text(data.item_ef_hp );
	$('#item_ef_at').text(data.item_ef_at );
	$('#item_ef_df').text(data.item_ef_df );
	$('#item_ef_agl').text(data.item_ef_agl );
	$('#item_ef_smart').text(data.item_ef_smart );
	$('#item_ef_str').text(data.item_ef_str );
	$('#item_ef_bone').text(data.item_ef_bone );
	$('#item_ef_vit').text(data.item_ef_vit );	
}

function showMixInfo(data)
{
	if(data != null)
	{
		$('#needGs').text(data.needGs);
	}
	var theneedhtml="";
	for(var i = 0; i < data.needs.length ; ++i)
	{
		theneedhtml +=  data.needs[i].item_name + " * " + data.needs[i].num + "<br/>" ;
	}
	$('#theneedlist').html(theneedhtml);	
}

function unselectedit()
{
	tobetraditid = 0;	
	$('#needGs').text("");
	$('#theneedlist').html("");
	$('#item_desc').text("");
	$('#item_ef_mn').text("");
	$('#item_ef_hp').text("");
	$('#item_ef_agl').text("");
	$('#item_ef_at').text("");
	$('#item_ef_df').text("");
	$('#item_ef_smart').text("");
	$('#item_ef_str').text("");
	$('#item_ef_bone').text("");
	$('#p_smart').text("");
	$('#item_ef_vit').text("");
}

function onconfirmmix()
{
	if(tobetraditid != 0)
	{
			$.ajax({
				dataType: "text",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
me : ""+getplayer()+"",  tobetraditid : ""+tobetraditid+"", what: "onconfirmmix" 
				},
			success: function(data) {
	  	  	 	res_onconfirmmix(data); 
	  	  	 	unselectedit();
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});				

	}else
	{
		notifyactionresult('請選擇');
	}
}
function	res_onconfirmmix(data)
{
	notifyactionresult(data);
}