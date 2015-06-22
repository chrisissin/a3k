

$(document).ready(function() {
    $('#robotcall').click(function() {
        callrobot(getplayer(), document.getElementById('code').value);
    });     
});

function callrobot(me, code)
{
			$.ajax({
				dataType: "text",
		  type: "POST",
	    url: "./capt/capt_dispatcher.php",
			data: {
me: ""+me+"" ,  code: ""+ code +""
				},
			success: function(data) {
				res_callrobot(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});			  	  	 
}

function reloadcapt()
{
	$('#capopup').load('./capt.php');	
}
function res_callrobot(data)
{
	$('#exe').html(data);
}
