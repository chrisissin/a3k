var bropgfrom =  0;
var bropgto =  5;

$(document).ready(function() {
    
    $("#buddy_lnk").attr("href", hostaddress+ "Member_referral.aspx?gis=a3k&pid="+getplayer()+"&f1001="+getCookie("a3kplayer"));
    $("#buddy_lnk").attr("target", "_blank");

    $("#brolastpg").unbind('click');
    $('#brolastpg').bind("click", function() {
    	if(bropgfrom-6 > 0)
    	{
    	  bropgfrom = bropgfrom -6;
    	  bropgto = bropgto-6;    		
        getBroInfo(getplayer(), bropgfrom , bropgto);
      }
    });
    
    $("#bronextpg").unbind('click');
    $('#bronextpg').bind("click", function() {

    	  bropgfrom = bropgfrom +6;
    	  bropgto = bropgto+6;
        getBroInfo(getplayer(), bropgfrom , bropgto);

    });

    $("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
				 	bropgfrom =  0;
					bropgto =  5;          
    });

    $("#brobtn").unbind('click');
    $('#brobtn').bind("click", function() {
        $('#popup').load('./brother_info.html', {}, function() {
            $(this).showPopup();
        });
    });
    $("#skillbtn").unbind('click');
    $('#skillbtn').bind("click", function() {
        $('#popup').load('./skill_info.html', {}, function() {
            $(this).showPopup();
        });
    });
    $("#roleinfobtn").unbind('click');
    $('#roleinfobtn').bind("click", function() {
        $('#popup').load('./role_info.html', {}, function() {
            $(this).showPopup();
        });
    });
    $("#playerbtn").unbind('click');
    $('#playerbtn').bind("click", function() {
        $('#popup').load('./player_info.html', {}, function() {
            $(this).showPopup();
        });
    });

    $("#fellowbtn").unbind('click');
    $('#fellowbtn').bind("click", function() {
        $('#popup').load('./fellow_info.html', {}, function() {
            $(this).showPopup();
        });
    });
    
    getBroInfo(getplayer(), bropgfrom , bropgto);
});


function getBroInfo(me, from , to) 
{

			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
me: ""+me+""  , what: "getBroInfo" , from: ""+from+"" , to : ""+to+"" 
				},
			success: function(data) {
				showBroInfo(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});			
	 	
}

function showBroInfo(data)
{
	var thehtml ="";
	 for (var i = 0; i < 6 ; ++i)
	  {
			$("#brother-"+i+"-name").html("");
			$("#brother-"+i+"-role").text("");
			$("#brother-"+i+"-lv").text("");
	  }	
	if(data != null){
	
	  for (var i = 0; i < data.length ; ++i)
	  {
	  	//thehtml = "<a onclick='tobuddypkfck("+data[i]["p_id"]+");' >"+data[i]["p_name"] + "</a><br/>";
			thehtml = data[i]["p_name"] ;
			$("#brother-"+i+"-name").html(thehtml);
			$("#brother-"+i+"-role").text(data[i]["role_name"]);
			$("#brother-"+i+"-lv").text(data[i]["p_lv"]);
	  }
	}
}
function tobuddypkfck(did)
{
	fkind = "buddypk";
	danpc = did;
	$('#popup').hidePopup();
	intoFight();
}

// ************ all about  brother info boxy ***********// 	


