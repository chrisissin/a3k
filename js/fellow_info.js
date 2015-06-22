﻿var selectedfellow;
var equipedfellow;

$(document).ready(function() {
    $("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
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

    loadfellowlist(getplayer());
});

//@loadfellowlist--used to print all fellows the player has

function loadfellowlist(me) {
    selectedfellow = undefined; 
  //  if (equipedfellow != undefined) //@initialize =show the equiped fellow at the first time
  //      getfellowinfo(equipedfellow)

    $.post("./dispatchers/dispatcher.php", { me: "" + me + "", what: "loadfellowlist" }, function(data) { 
    	loadingOn();
    	display_fellow_list(data);
    	loadingOff();
    	 }, 'json');
    $("#equipfellowbtn").unbind('click');
    $('#equipfellowbtn').bind("click", function() {
         equipfellow(selectedfellow, getplayer());
    }); 	
}

//@display_fellow_list--modify html file here--use html()

function display_fellow_list(data) {
	if(data)
	{
    $('#fellowtable').html("");
		var aline = "<table border='0' height='50' cellspacing='0' cellpadding='0' ><tr>";
		var j = 0;
		    for (var i = 0; i < 5; i++) {
		        if (j < data.length) {
		            var flimg = data[j].p_img;
		            var flname = data[j].p_name;
		            var flid = data[j].p_id;
		            var idstr = "'" + flid + "'";
		            var namestr = "'" + flname + "'";
		            var ffaces = "url("+net+"/images_char/icon/left/"+flimg+".gif)";
		            var face = "\
	             <td width='50' onclick=\"getfellowinfo(" + flid + ")\">\
	             	<a ><ul class='pick' style='background-image :"+ffaces+";'>\
                  <li class='fighticon'>\
                  </li>\
                  <li class='fighticonbg'></li>\
                </ul></a>\
               </td>\
               <td width='15'></td>\
	                 ";
		        }

		        else {
		            var face = "\
	             <td width='50'>\
	             	<a><ul class='pick'>\
                  <li class='fighticon'></li>\
                  <li class='fighticonbg'></li>\
                  </ul></a>\
                 </td>\
                 <td width='15'></td>\
	    ";
		        }
		        j++;
		        aline += face;
		    }
		    aline += "</tr></table>"
		    //alert(aline);
		    $('#fellowtable').html(aline);
		if(data.length > 5)
		{
		    $("#rightbth").unbind('click');
		    $('#rightbtn').bind("click", function() {
		        display_more(data);
		    }); 	
		}
	}
}


function display_more(data) {

    $("#leftbth").unbind('click');
    $('#leftbtn').bind("click", function() {
    display_fellow_list(data);
    });

    $('#fellowtable').html("");
    var aline = "<table border='0' height='50' cellspacing='0' cellpadding='0' ><tr>";
    var j = 5;
    if (data.length >5) {
        for (var i = 0; i < 5; i++) {
            if (j < data.length) {
		            var flimg = data[j].p_img;
		            var flname = data[j].p_name;
		            var flid = data[j].p_id;
		            var idstr = "'" + flid + "'";
		            var namestr = "'" + flname + "'";
		            var ffaces = "url("+net+"/images_char/icon/left/"+flimg+".gif)";
		            var face = "\
	             <td width='50' onclick=\"getfellowinfo(" + flid + ")\">\
	             	<a ><ul class='pick' style='background-image :"+ffaces+";'>\
                  <li class='fighticon'>\
                  </li>\
                  <li class='fighticonbg'></li>\
                </ul></a>\
               </td>\
               <td width='15'></td>\
	                 ";
            }

            else {
                var face = "\
	             <td width='50'>\
	             	<a><ul class='pick'>\
                  <li class='fighticon'></li>\
                  <li class='fighticonbg'></li>\
                  </ul></a>\
                 </td>\
                 <td width='15'></td>\
	    ";
            }
            j++;
            aline += face;
        }
        aline += "</tr></table>"
        //alert(aline);
        $('#fellowtable').html(aline);
    }   
}

//@display_fellow_body-show the picture of fellow--use the same sql as display_fellow_list

function display_fellow_body(data) {
    $('#fellow_still').html("");
    var flimg = data.p_img;
    var body = "\
          <img src='images_char/still/left/" + flimg + ".gif' width='170' height='170' />\
    ";
    $('#fellow_still').html(body);

}

//@getfellowinfo-- called by display_fellow_list, onclick function

function getfellowinfo(fellowid) {
    $.post("./dispatchers/dispatcher.php", {fellowid: ""+fellowid+"", what: "getfellowinfo" },
	  	  	 function(data) {
	  	  	     disp_singlefellow(data);
	  	  	     selectedfellow = fellowid;
	  	  	 }, 'json'
	  	  	 	);

	  	}


//@display a fellow's information

	  	function disp_singlefellow(data) {
	  	    $('#p_name').text(data.p_name);
	  	    $('#p_at').text(data.p_at);
	  	    $('#p_df').text(data.p_df);
	  	    $('#p_mn').text(data.p_mn);
	  	    $('#pf_lv').text(data.p_lv);
	  	    $('#pf_exp').text(data.p_exp);
	  	    $('#p_nextexp').text(data.p_nextexp);
	  	    $('#p_hpmax').text(data.p_hpmax);
	  	    $('#p_mnmax').text(data.p_mnmax);
	  	    $('#p_agl').text(data.p_agl);
	  	    $('#p_str').text(data.p_str);
	  	    $('#p_vit').text(data.p_vit);
	  	    $('#p_bone').text(data.p_bone);
	  	    $('#pf_rankname').text(data.p_rankname);
	  	    $('#p_smart').text(data.p_smart);
	  	    $('#fellow_job').text(data.role_name);
	  	    $('#p_faith').text(data.faith);
	  	    display_fellow_body(data);
	  	}


//@function equipfellow- to equip a fellow

function equipfellow(flid, me) {
	  	    equipedfellow = flid;
	  	    if (flid != undefined) {
        $.post("./dispatchers/dispatcher.php", { flid: "" + flid + "", me: "" + me + "", what: "equipfellow" },
	  	  	 function(data) {
	  	  	     epupres(data);
	  	  	     LoadPlayerInfo(getplayer());
	  	  	 }
	  	  				);
    }
    else
         notifyactionresult("請選武將");
	  	}
	  	
	  	
function epupres(res)
{
	var output ="";
	if(res)
			output = "OK";
	else
			refershonerror();
		notifyactionresult(output);
}
