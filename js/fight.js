﻿	
	
	
	$(document).ready(function()
 {
 		loadingOff();
    lookupplayer();
    
    $('#fight_message_close').click(function()
  {
  	$('#ftmsgfield').hide();
  }); 
    $('#fight_message_open').click(function()
  {
  	$('#ftmsgfield').show();
  }); 
  $('#gameover_btn').click(function()
  {
		$("#maindiv").load("./map.html");
  });       
  $('#gameover_fightmore').click(function()
  {
  
  	//intoFight();
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
            var tool = $('#gameover_fightmore');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left - 50, y: toolPosition.top - 200});
            
        });
  }); 
  $('#gameover_heal').click(function()
  {
  	heal(getplayer());
  });  
  
  g_infight =1;
});




	$(document).unload(function()
{
 	  g_infight =0;
});
// ************ all about fight ***********//
function loadfightend(me)
{
			$.ajax({
				dataType: "script",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
				me: ""+me+"" ,  
				what: "loadfightend" 
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

 		var fightdisp = new Array();
		var fightto;
		var tripleis=0;

function fightdivcontrolOn()
{
	  	  	$('#loading2').show();
	  	  	$('#loading3').show();	
	  	  	$('gameover_btn').hide();
}

function fightdivcontrolOff()
{
	  	  	$('#loading2').hide();
	  	  	$('#loading3').hide();	
	  	  	$('gameover_btn').show();
}

  	function lookupplayer() 
  	{ 
  				


			$.ajax({
		  type: "POST",
		  dataType: "script",
	    url: "./dispatchers/dispatcher.php",
			data: {
				what: "fight_init", 
				defencer: danpc ,
				fkind : fkind,
				me: ""+getplayer()+""
				},
			success: function(data) {
		  	  	 	bigdick(data); 
		  	  	 	fightdivcontrolOn();
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});	  	  
			document.getElementById('thWholething').style.backgroundImage = 'url('+net+'/images_scen/'+document.getElementById('plshit').value+'.jpg)';				
	  	  				
  	}

	
	 	function fight_nexttrun(data)
 	  {//debugger;
 	  //	alert($.toJSON(data));//JSON.stringify(data));
 	  	$("#fighter_img").fadeOut(); 
 	  	

			$.ajax({
				dataType: "script",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
 	  		fkind: data.fkind,
 	  		p_id: data.p_id,
 	  		pf_id: data.pf_id,
 	  		m_id: data.m_id,
 	  		mf_id: data.mf_id,
 	  		p_hp: data.p_hp,
 	  		pf_hp: data.pf_hp,
 	  		m_hp: data.m_hp,
 	  		mf_hp: data.mf_hp,
 	  		p_mn: data.p_mn,
 	  		pf_mn: data.pf_mn,
 	  		m_mn: data.m_mn,
 	  		mf_mn: data.mf_mn,
 	  		what: "fight" 
				},
			success: function(data) {
		  	  	 	bigdick(data); 
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});	  	  					  	  				
 	  }
		var lool ="";
    function bigdick(data)
  	{//debugger;
  		//eval(data);
  		
				if(data.toString().trim().length > 2) 
 				{
							var shwstr =  data+ $('#executionfightjq').html() ; 
    	  			$('#executionfightjq').html( shwstr); 
    	  			/*lool += data;
    	  			eval(lool);*/
    	  }
    	  
		}
		
	
		
  	function fight_init(data)
  	{
  		//$('#messagetext').html("");  
  		fight_allshw(100);
  		if(data!=null)
  		{
				//debugger;

				 		        
		    if(data.pf != null)
		    {
		    	if(data.pf.p_hp > 0){
			  		$("#pf_idle_img").css("background-image","url("+net+"/images_char/still/left/"+data.pf.p_img+".gif)");
			  		$("#pf_idle_ico").css("background-image","url("+net+"/images_char/icon/left/"+data.pf.p_img+".gif)");
			  	}
			  	$('#pf_idle_name').show();
			  	$('#pf_idle_name_left').show();
			  	$('#pf_idle_name_right').show();
		  		$('#pf_idle_name').html(data.pf.p_name);
	        $('#pf_hp_now').html(data.pf.p_hp);
      		$('#pf_hp_full').html(data.pf.p_hpmax);
			    $('#pf_mn_now').html(data.pf.p_mn);
			    $('#pf_mn_full').html(data.pf.p_mnmax);      			
				}
				       

	      
	      if(data.mf != null)
	      {
	      	if(data.mf.p_hp > 0){
				  		$("#mf_idle_img").css("background-image","url("+net+"/images_char/still/right/"+data.mf.p_img+".gif)");
				  		$("#mf_idle_ico").css("background-image","url("+net+"/images_char/icon/right/"+data.mf.p_img+".gif)"); 
				  	}
				  	$('#mf_idle_name').show();
				  	$('#mf_idle_name_left').show();
				  	$('#mf_idle_name_right').show();
			  		$('#mf_idle_name').html(data.mf.p_name);
			  		$('#mf_hp_now').html(data.mf.p_hp);
			      $('#mf_hp_full').html(data.mf.p_hpmax);
			      $('#mf_mn_now').html(data.mf.p_mn);
			      $('#mf_mn_full').html(data.mf.p_mnmax);
	      }
	    }
      
   
   		$("#fighter_img").css("background-image","");
   					
      $("#p_idle_img").css("background-image","url("+net+"/images_char/still/left/"+data.p.p_img+".gif)");
			$("#p_idle_ico").css("background-image","url("+net+"/images_char/icon/left/"+data.p.p_img+".gif)");	    
      $('#p_idle_name').html(data.p.p_name);
      $('#p_hp_now').html(data.p.p_hp);
      $('#p_hp_full').html(data.p.p_hpmax);
      $('#p_mn_now').html(data.p.p_mn);
      $('#p_mn_full').html(data.p.p_mnmax);

      $("#m_idle_img").css("background-image","url("+net+"/images_char/still/right/"+data.m.p_img+".gif)");
	    $("#m_idle_ico").css("background-image","url("+net+"/images_char/icon/right/"+data.m.p_img+".gif)"); 
 			$('#m_idle_name').html(data.m.p_name);
      $('#m_hp_now').html(data.m.p_hp);
      $('#m_hp_full').html(data.m.p_hpmax);
      $('#m_mn_now').html(data.m.p_mn);
      $('#m_mn_full').html(data.m.p_mnmax);
      
      $("#p_idle_img").fadeIn("slow");       
      $("#pf_idle_img").fadeIn("slow"); 
      $("#m_idle_img").fadeIn("slow");                       
      $("#mf_idle_img").fadeIn("slow");
      
      $("#p_idle_ico").show("slow");       
      $("#pf_idle_ico").show("slow"); 
      $("#m_idle_ico").show("slow");                       
      $("#mf_idle_ico").show("slow");
     
  	}  
  	 	  
function fightendmsg(msg)
{
	        if ($('#fmpopup').length === 0) {
            $('<div></div>')
		  .attr('id', 'fmpopup')
	      .css('position', 'absolute')
	      .css('z-index', '99999')
		  .hide()
		  .popup({inkSensor:true,
	  	outSensor:true})
	      .appendTo('body');
        }
        $('#fmpopup').load('./message_fight.html', {}, function() {
            $(this).showPopup();
            var tool = $('#maindiv');
            var toolPosition = tool.offset();
            moveTo($(this), { x: toolPosition.left + 150, y: toolPosition.top + 150 });
            $('#msg_boxf').html(msg);
});	$("#fmpopup").draggable();
}
  	 	  
  	function fight_end(data)
  	{//debugger;
	  	 		
  		if(data.msg2user != null)
  		{
			 					var shwstr =  data.msg2user+"<hr/>"+ $('#messagetext').html() ; 
    	  				/*$('#messagetext').html(shwstr);  
    	  				$('#messagetext').show(1000); */
    	  				fightendmsg(data.msg2user);
			}	
  		$("#fighter_img").fadeOut("slow"); 	
      $("#gameover_div").fadeIn();
      $('#fight_effect').fadeOut();
  
      fightdivcontrolOff(); 
      g_infight = 0;
      LoadPlayerInfo(getplayer());
      loadqestionlist(getplayer());//@liao 20090330
      fightdisp = new Array();
      
      fkind = "";
      danpc = 0;
  	} 
  	
  	function fight_allshw(pickle)
  	{//debugger;
  		//$("#fighter_img").show(); 	
  	  $("#p_idle_img").show(pickle ); 	
      $("#pf_idle_img").show(pickle ); 	
      $("#m_idle_img").show(pickle ); 	                      
      $("#mf_idle_img").show(pickle ); 	
  	} 
  	
  	  	
  	function fight_animat(data)
  	{
			if(data.pickle != undefined)
	  	{	
		  	if(data.p_hp == null  )
	  		{	  
					data.p_hp ='?';
	    	}
	      if(data.m_hp == null  )
	  		{	  	      
					data.m_hp ='?';
	    	}
	    	if(data.pf_hp == null  )
	  		{	  
					data.pf_hp ='?';
	    	}
	    	if(data.mf_hp == null )
	  		{	  
					data.mf_hp ='?';
	    	}
	    		if(data.p_hp!=null)
		      	$('#p_hp_now').html(data.p_hp);
		      if(data.p_mn!=null)	
		      	$('#p_mn_now').html(data.p_mn);
		      if(data.p_hpmax!=null)
		      	$('#p_hp_full').html(data.p_hpmax);	
		      if(data.p_mnmax!=null)			      
		      	$('#p_mn_full').html(data.p_mnmax);	   
		      
		      $('#m_hp_now').html(data.m_hp);	
		      $('#m_mn_now').html(data.m_mn); 
		      $('#pf_hp_now').html(data.pf_hp);
		      if(data.pf_hpmax!=null)
		      	$('#pf_hp_full').html(data.pf_hpmax);	
		      $('#pf_mn_now').html(data.pf_mn);	
		     	if(data.pf_mnmax!=null)				  
		      	$('#pf_mn_full').html(data.pf_mnmax);			          		      
		      $('#mf_hp_now').html(data.mf_hp);
		      $('#mf_mn_now').html(data.mf_mn);		       	
		  	
		  	//fight_allshw(data.pickle);
		  	$("#fighter_img").hide();
		  	
		  	if(data.defendside != null)
	  		{	
					// defend side animation		  		
		  	}	
		  	
		  	var mgobj;
		  	var lrr;
		  	if(data.side != null)
	  		{	
		  		lrr = "left/"
		  		if(data.side.toString().trim() =="m" || data.side.toString().trim() =="mf" )
		  			lrr = "right/";		  		
		  		mgobj = "#"+ data.side.toString().trim()+"_idle_img" ;	
		  		$(mgobj).fadeOut(data.pickle); 
		  	}	
		    var theg = "$('"+mgobj+"').fadeIn()";
	    	setTimeout(theg,data.pickle); //the fighter back		  	
	
	  		if(data.p_name != null && data.p_img != null )
	  		{	  		
		      $('#fighter_img').css("background-image","url("+net+"/images_char/act/"+lrr+data.p_img+".gif)");
		      $('#figher_name').html(data.p_name);
		      //$('#figher_name').fadeIn(data.pickle);
		      $("#fighter_img").fadeIn(data.pickle);
		      var daf =  "$('#fighter_img').fadeOut();"
		      setTimeout(daf,data.pickle);
		    }
		      
    
		    if(data.dead !=null)
		    {//alert(data.dead.toString().trim());
		      	var mgobjdead = "#"+ data.dead.toString().trim()+"_idle_img" ;	
		  			var gg = "$('"+mgobjdead+"').hide("+data.pickle+"); ";
		  			setTimeout(gg, data.pickle); //the dead man walks
		  	}		
		  	
		    if(data.msg2user != null)
	  		{	  
		      //start msg part
				 	var shwstr =  data.msg2user + $('#messagetext').html() ; 
	    	  $('#messagetext').html(shwstr);  
	    	  $('#messagetext').show(data.pickle); //	
		      //end msg part
		    }		  		    
	   	}
  	}
  	
  	function fight_now(data)
  	{
  		  	fightdisp.push(data);  	
  	}
  	
		function fight_llp(pickle)
		{//debugger;
			
				if(tripleis < fightdisp.length)
				{
					fight_animat(fightdisp[tripleis]);
					fightto = setTimeout ("fight_llp("+pickle+")", pickle);
					++tripleis;
				}else
				{
					clearTimeout(fightto);	
				}	
		}

function skill_effect(effectimg)
{
		$('#fight_effect').css("background-image","url("+net+"/images_skill/effect/left/"+effectimg+".gif)"); 
		$('#fight_effect').fadeIn("slow");
		setTimeout("$('#fight_effect').hide();", 2000);
}



// ************ all about fight ***********//

