var plpgfrom =  0;
var plpgto =  5;

$(document).ready(function() {
		getInbox(getplayer(), plpgfrom , plpgto);
		$("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
				 	plpgfrom =  0;
					plpgto =  5;        
    });    
    
    $("#pllastpg").unbind('click');
    $('#pllastpg').bind("click", function() {
    	
    	if(plpgfrom-5 > 0)
    	{
    	  plpgfrom = plpgfrom -5;
    	  plpgto = plpgto-5;    		
        getInbox(getplayer(), plpgfrom , plpgto);
      }
    });
    
    $("#plnextpg").unbind('click');
    $('#plnextpg').bind("click", function() {

    	  plpgfrom = plpgfrom +5;
    	  plpgto = plpgto+5;
        getInbox(getplayer(), plpgfrom , plpgto);

    });    


});

function getInbox(me, from , to, sname) 
{
						$.ajax({
					  type: "POST",
					  dataType: "json",
					  cache: false,
				    url: "./dispatchers/dispatcher.php",
						data: {
					 what :'getInbox', me:getplayer(),  from: ""+from+"" , to : ""+to+"" 
							},
						success: function(data) {
					  	  	 	getInbox_res(data);
						}, 
						error:
						function() {
							refershonerror();
						}, 
						timeout
						:20000
						});	  	  	 	
}

function getInbox_res(data)
{
					for (var i = 0; i < 5 ; ++i)
				  {
				  	$("#mck-"+i).html("");
						$("#msender-"+i).text("");
						$("#mtitle-"+i).html("");
						$("#mdate-"+i).text("");
				  }		
				if(data != null) 
				{
				  for (var i = 0; i < data.length ; ++i)
				  {
				  	var lanew = "";
				  	if(data[i].readdate == null)
				  	{
				  		lanew = "new";
				  	}
				  	thehtml = "<a onclick='getmailcontent("+data[i]["id"]+");' >"+data[i]["title"] + "</a> "+lanew;
						//thehtml = data[i]["p_name"] ;
						$("#mtitle-"+i).html(thehtml);
						$("#msender-"+i).text(data[i]["p_name"]);
						$("#mdate-"+i).text(data[i]["createdate"]);
						thehtml = "<a onclick='deletemail("+data[i]["id"]+");'>刪除</a>";
						$("#mck-"+i).html(thehtml);
				  }
				}		
}	

function deletemail(daid)
{
						$.ajax({
					  type: "POST",
					  dataType: "json",
					  cache: false,
				    url: "./dispatchers/dispatcher.php",
						data: {
					 what :'deletemail', me:getplayer(),  daid: ""+daid+"" 
							},
						success: function(data) {
					  	  	 	deletemail_res(data);
						}, 
						error:
						function() {
							refershonerror();
						}, 
						timeout
						:20000
						});	  	
}

function deletemail_res(data)
{
	if(data == true)
	{
		notifyactionresult('成功');
		getInbox(getplayer(), plpgfrom , plpgto);
	}else
		notifyactionresult('失敗');
}

function getmailcontent(daid) 
{
	clearopen();
						$.ajax({
					  type: "POST",
					  dataType: "json",
					  cache: false,
				    url: "./dispatchers/dispatcher.php",
						data: {
					 what :'getmailcontent', daid : ""+daid+"" 
							},
						success: function(data) {
					  	  	 	getmailcontent_res(data);
						}, 
						error:
						function() {
							refershonerror();
						}, 
						timeout
						:20000
						});	  	  	 	
}

function clearopen()
{
							$("#msender").text("");
						$("#mtitle").text("");
						$("#mcontent").html("");	
}

function getmailcontent_res(data)
{
							$("#msender").text(data.p_name);
						$("#mtitle").text(data.title);
						$("#mcontent").html(data.content	);		
}