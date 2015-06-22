
$(document).ready(function() {
    //@
    
    loadingOff();
    loadbalance(getplayer());
 		loadmoney(getplayer());
     $('#savebtn').click(function() {
      	if(IsNumeric($('#samount').val()))
        	onsaveclick(getplayer(), $('#samount').val());
        else 
 					notifyactionresult('請填入存款數量');
    });
      $('#withdrawbtn').click(function() {
      	if(IsNumeric($('#wamount').val()))
        	onwithdrawclick(getplayer(), $('#wamount').val());
        else 
 					notifyactionresult('請填入提款數量');
    });
    $("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
    });    
});

 function loadbalance(me)
 {
 				$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
me: ""+me+"" ,  what: "loadbalance" 
				},
			success: function(data) {
				balance_res(data); 
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		
 } 	 
 
 function loadmoney(me)
 {
 				$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
 me: ""+me+"" ,  what: "getMoneyInMe" 
				},
			success: function(data) {
				money_res(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		 	

 } 	
 function balance_res(data)
 {
 		$('#curbalance').text(data);	
}
 
  function money_res(data)
 {
 		$('#curmoney').text(data);	
}
 function onsaveclick(me, howmuch)
 {
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
 me: ""+me+"" ,  what: "save2bank" , howmuch : ""+howmuch+""
				},
			success: function(data) {
				bankdisp_res(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		 	 
 } 	
 	
 function onwithdrawclick(me,  howmuch)
 {
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
 me: ""+me+"" ,  what: "withdrawfrombank", howmuch : ""+howmuch+""
				},
			success: function(data) {
				bankdisp_res(data); 
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		 	

 } 	 	
 
 function bankdisp_res(data)
 {
 	 notifyactionresult(data);
    loadbalance(getplayer());
 		loadmoney(getplayer());
}
 
