var selectedfellow;


$(document).ready(function() {
    //@
    loadingOff();
        
    $('#city_box1').click(function() {
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
        $('#popup').load('./shop_buy1.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();
    });
   
     $('#city_box16').click(function() {
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
    
     $('#city_box2').click(function() {
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
        $('#popup').load('./mix.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();
    });
    
    $('#city_box3').click(function() {
        heal(getplayer());
    });
    
     $('#city_box4').click(function() {
     	//notifyactionresult('功能尚未開放');
     	
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
	            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top -20 });
	            loadingOff();
	        });
	        $("#popup").draggable();
	        
    });
        
     $('#city_box5').click(function() {
        notifyactionresult('功能尚未開放');
    });
    
     $('#city_box5').click(function() {
        notifyactionresult('功能尚未開放');
    });    
    
     $('#city_box12').click(function() {
        notifyactionresult('功能尚未開放');
    });        
    
     $('#city_box17').click(function() {
     	notifyactionresult('功能尚未開放');
    });    
    
     $('#city_box6').click(function() {
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
	        $('#popup').load('./bank.html', {}, function() {
	            $(this).showPopup();
	            var tool = $('#maindiv');
	            var toolPosition = tool.offset();
	            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top -20 });
	            loadingOff();
	        });
	        $("#popup").draggable();
    });          
    
    $('#city_box7').click(function() {
			missionbtn();
    });    
    
     $('#city_box8').click(function() {
        notifyactionresult('功能尚未開放');
    });     
   
     $('#city_box9').click(function() {
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
        $('#popup').load('./group.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left -20, y: toolPosition.top -20});
            loadingOff();
        });
        $("#popup").draggable();
    });      
    
    $('#city_box10').click(function() {
			missionbtn();
    }); 
    
     $('#city_box12').click(function() {
        notifyactionresult('功能尚未開放');
    });     
    
    $('#city_box13').click(function() {
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
        $('#popup').load('./store.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left -20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();
    });
       
    $('#city_box140').click(function() {
        loadmaindiv("map.html");
    });
});
 
 function missionbtn()
 {
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
        $('#popup').load('./mission.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 20, y: toolPosition.top - 20 });
            loadingOff();
        });
        $("#popup").draggable();
 } 	
 	
 
 function moveTo(target, position) {
	if(!target || !position) {
		return;
	}
	target.css({
		'z-index':99,
		left:position.x,
		top:position.y
	});
}

