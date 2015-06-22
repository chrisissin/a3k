	
	
$(document).ready(function()
 {
   $('#map_btn_city').click(function()
  {
		toDownTown(getplayer());
  });     
  	
  $('#map_btn_fight').click(function()
  {
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
        $('#popup').load('./npclist.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left + 100, y: toolPosition.top + 100});
            
        });
        $("#popup").draggable();
  }); 
      
  $('#map_btn_find').click(function()
  {
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
        $('#popup').load('./look.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left-20 , y: toolPosition.top -20});
            
        });
        $("#popup").draggable();
  });  
  $('#map_btn_rest').click(function()
  {
  	heal(getplayer());
  }); 
   $('#map_btn_move').click(function()
  {
  	move2daCiti(getplayer());
  }); 
// ************ all about image map ***********//  
   $('#mapbtn2').click(function()
  {
  	movet2state('幽州');
  }); 
   $('#mapbtn3').click(function()
  {
  	movet2state('青州');
  });   
   $('#mapbtn4').click(function()
  {
  	movet2state('冀州');
  }); 
   $('#mapbtn5').click(function()
  {
  	movet2state('并州');
  }); 
   $('#mapbtn6').click(function()
  {
  	movet2state('徐州');
  }); 
   $('#mapbtn7').click(function()
  {
  	movet2state('兗州');
  }); 
   $('#mapbtn8').click(function()
  {
  	movet2state('豫州');
  }); 
   $('#mapbtn9').click(function()
  {
  	movet2state('司州');
  }); 
   $('#mapbtn10').click(function()
  {
  	movet2state('雍州');
  }); 
   $('#mapbtn11').click(function()
  {
  	movet2state('涼州');
  }); 
   $('#mapbtn12').click(function()
  {
  	movet2state('揚州');
  }); 
   $('#mapbtn13').click(function()
  {
  	movet2state('荊州');
  }); 
   $('#mapbtn14').click(function()
  {
  	movet2state('益州');
  }); 
   $('#mapbtn15').click(function()
  {
  	movet2state('交州');
  }); 
  //*******************toggle*********************//
   $('#maparea2').mouseover(function()
  {
  	togglemap('mapbtn2');
  }); 
   $('#maparea3').mouseover(function()
  {
  	togglemap('mapbtn3');
  });   
  $('#maparea4').mouseover(function()
  {
  	togglemap('mapbtn4');
  }); 
  $('#maparea5').mouseover(function()
  {
  	togglemap('mapbtn5');
  }); 
  $('#maparea6').mouseover(function()
  {
  	togglemap('mapbtn6');
  }); 
  $('#maparea7').mouseover(function()
  {
  	togglemap('mapbtn7');
  }); 
  $('#maparea8').mouseover(function()
  {
  	togglemap('mapbtn8');
  }); 
  $('#maparea9').mouseover(function()
  {
  	togglemap('mapbtn9');
  }); 
  $('#maparea10').mouseover(function()
  {
  	togglemap('mapbtn10');
  }); 
  $('#maparea11').mouseover(function()
  {
  	togglemap('mapbtn11');
  }); 
  $('#maparea12').mouseover(function()
  {
  	togglemap('mapbtn12');
  }); 
  $('#maparea13').mouseover(function()
  {
  	togglemap('mapbtn13');
  }); 
  $('#maparea14').mouseover(function()
  {
  	togglemap('mapbtn14');
  }); 
  $('#maparea15').mouseover(function()
  {
  	togglemap('mapbtn15');
  }); 
    $('#clearmap').mouseover(function()
  {
  	cleartogglemap();
  }); 
// ************ all about image map ***********//      

 	if(getplayer())
 	{
    loadimat(getplayer());
  } 
});




function knockknock()
{
	var dadisplay = "<a   class='place_list'></a><br />"	;
	$('#whosthere').html = dadisplay;	
}

// ************ all about map ***********//
function togglemap(divid)
{//debugger;
	cleartogglemap();
	$('#'+divid).show();
}
function cleartogglemap()
{//debugger;
	var idna = "#mapbtn";
	for(var i =2; i <= 15; ++i)
	{
		$('#mapbtn'+i).hide();
	}
}
 	 	  


function move2daCiti(me)
{
	//var citi =getCheckedValue(document.forms['citigroup'].elements['radiociti']);
	var citi =$("input:checked").val(); // jquery 1.3
//	var citi = $("input[@name='radiociti'][@checked]").val(); // jquery 1.2.6
	//debugger;


					if(citi != "" && citi != 1)
					{
		  	  	/*$.post("./dispatchers/dispatcher.php", {},
	  	  	 function(data){ 
	  	  	 	
	  	  	 	//$("#nowatstate").html(data);  
	  	  	 	}
	  	  				);*/
						$.ajax({
					  type: "POST",
					  dataType: "html",
					  cache: false,
				    url: "./dispatchers/dispatcher.php",
						data: {
							me: ""+me+"" ,citi: ""+citi+"" ,  what: "moveme2citi" 
							},
						success: function(data) {
					  	  	 	eval(data);
						}, 
						error:
						function() {
							refershonerror();
						}, 
						timeout
						:20000
						});	  	  	  				
	  	  	}
}

function loadimat(player)
{
		$.ajax({
	  type: "POST",
	  dataType: "json",
    url: "./dispatchers/dispatcher.php",
		data: {
			what: "loadimat", 
			me: ""+player+""
			},
		success: function(data) {
			 showimat(data);
		}, 
		error:
		function() {
			refershonerror();
		}, 
		timeout
		:20000
		});
}
function showimat(data)
{
	$("#nowatciti").html(data.map_city_name);
	$("#nowatstate").html(data.map_state_name);
	document.getElementById('plshit').value = data.map_img;
	movet2state(data.map_state_name);
	
	//debugger;
}

function movet2state(state)
{
	if(state != undefined){
		document.getElementById('movetostate').innerHTML = state;
		loadcities(state);
	}
}
function loadcities(state)
{
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
state: ""+state+"" ,  what: "loadciti" 
				},
			success: function(data) {
	  	  	 	loadingOff();
	  	  	 	loadcities_back(data)
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		 
}
function loadcities_back(data)
{//debugger;
	
	 	  if(data!=null) 
			{
		 					var daRadiohtm="<form name='citigroup'>";
		 					for(var i=0; i < data.length; ++i)
		 					{
									daRadiohtm += "<input type=\"radio\" name=\"radiociti\" id=\""+data[i].map_id+"\" value=\""+data[i].map_id+"\" />"+data[i].map_city_name+"<br/>";
							}
							daRadiohtm += "</from>";
							$("#place_listbox").html(daRadiohtm);
							$("#place_listbox").show();
   	  }else
   	  {
   	  	// log error
   	  	$("#place_listbox").html("未開放");
				$("#place_listbox").show();
   	 	}
   	 	
}


	 


// ************ all about map ***********//










