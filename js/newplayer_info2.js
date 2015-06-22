
$(document).ready(function() {
    

    $("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        $('#popup').hidePopup();
    });
 /*
    $("#skillbtn").unbind('click');
    $('#skillbtn').bind("click", function() {
    	newbieinstruct17(msg17);
        $('#popup').load('./newskill_info.html', {}, function() {
            $(this).showPopup();
            ('#skillbtn').removeClass('guide_btn');
						$('#skillbtn').addClass('con_btn');
        });
    });
    $("#roleinfobtn").unbind('click');
    $('#roleinfobtn').bind("click", function() {
        $('#popup').load('./role_info.html', {}, function() {
            $(this).showPopup();
        });
    });*/
    //************fellow btn sparkling effect remove.***********
    $("#playerbtn").unbind('click');
    $('#playerbtn').bind("click", function() {
        $('#popup').load('./newplayer_info.html', {}, function() {
            $(this).showPopup();
            $('#fellowbtn').removeClass('guide_btn');
						$('#fellowbtn').addClass('con_btn');
        });
    });

    $("#fellowbtn").unbind('click');
    $('#fellowbtn').bind("click", function() {
    	newbieinstruct53(msg53);
        $('#popup').load('./newfellow_info.html', {}, function() {
            $(this).showPopup();
        });
    });
    
    getFullInfo(getplayer());
});


function getFullInfo(me) {
				loadingOn();
		  	  	$.post("./dispatchers/dispatcher.php", {me: ""+me+"" ,  what: "getFullInfo" },
	  	  	 function(data){ showFullInfo(data);  loadingOff();},'json'
	  	  				); 
	  	  	$.post("./dispatchers/dispatcher.php", {me: ""+me+"" ,  what: "geteqptInfo" },
	  	  	 function(data){ showeqptInfo(data);  loadingOff();},'json'
	  	  				);			
}

function showFullInfo(data)
{
    $('#player-name').text(data.p_name);
    $('#player-rank').text(data.p_rankname);
    $('#player-lv').text(data.p_lv);
    $('#player-exp').text(data.p_exp);
    $('#player-expnext').text(data.p_nextexp);
    $('#player-atstate').text(data.map_state_name);
    $('#player-atcity').text(data.map_city_name);
    $('#player-win').text(data.p_win);
    $('#player-loss').text(data.p_lost);
    $('#player-money').text(data.p_money);

    $('#player-hp').text(data.p_hp);
    $('#player-mn').text(data.p_mn);
    $('#player-maxhp').text(data.p_hpmax);
    $('#player-maxmn').text(data.p_mnmax);
    $('#player-str').text(data.p_str);
    $('#player-wis').text(data.p_smart);
    $('#player-agl').text(data.p_agl);
    $('#player-btype').text(data.p_vit);
    $('#player-bone').text(data.p_bone);
    $('#player-at').text(data.p_at);
    $('#player-df').text(data.p_df);
    
    $('#player-job').text(data.role_name);

    $('#fellow-name').text(data.pf_name);
    $('#fellow-lv').text(data.pf_lv);
    var count;
 
    count=parseInt(data.p_win)/(parseInt(data.p_win)+parseInt(data.p_lost))*100;
    $('#player-probability').text(parseInt(count));

		$("#player-img").css("background-image","url(/a3k/images_char/still/left/"+data.p_img+"_2.gif)");
		//$("#player-img").attr('src',"/a3k/images_char/still/left/"+data.p_img+"_2.gif");
		
		$("#fighticon").css("background-image","url(/a3k/images_char/icon/left/"+data.pf_img+".gif)");

    $("#fighticon").show();
    $("#player-img").show();

}



function showeqptInfo(data) {
   
    if (data) {
        for (i = 0; i < data.length; i++) {
            if (data[i].item_type2 == 1) 
                $('#headeqpt').text(data[i].item_name);
            if (data[i].item_type2 == 2)
                $('#bodyeqpt').text(data[i].item_name);
            if (data[i].item_type2 == 3) 
                $('#backeqpt').text(data[i].item_name);
            if (data[i].item_type2 == 4)
                $('#footeqpt').text(data[i].item_name);
            if (data[i].item_type2 == 5) 
                $('#ringeqpt').text(data[i].item_name);
            if (data[i].item_type2 == 6)
                $('#weaponeqpt').text(data[i].item_name);
        }
    }
}
// ************ all about comman player info boxy ***********// 	


