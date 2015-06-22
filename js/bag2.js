
//(c)2009 worxup
var selectedItemid;
var selectedSingleid;
var checkifspecial = 0;
$(document).ready(function() {
    $("#closebtn").unbind('click');
    $('#closebtn').bind("click", function() {
        LoadPlayerInfo(getplayer());
        $('#popup').hidePopup();
    });
    $("#eqptbtn").unbind('click');
    $('#eqptbtn').bind("click", function() {
        equpinit();
    });
    $("#itembtn").unbind('click');
    $('#itembtn').bind("click", function() {
        itembtninit();
    });
    $("#normbtn").unbind('click');
    $('#normbtn').bind("click", function() {
        normbtninit();
    });
    $("#spcbtn").unbind('click');
    $('#spcbtn').bind("click", function() {
        spcbtinit();
    });
    selectedItemid = "";
    equpinit();
}); function closeThis() {
    $("#closebtn").click();
}
function equpinit() {
    disp_initialitem();
    getFullInfo(getplayer());
    getPackInfo(getplayer(), '1'); $("#eqptitembtn").unbind('click');
    $('#eqptitembtn').bind("click", function() {
        eqptitem(selectedSingleid, selectedItemid, getplayer());
    });
    $("#lossitembtn").unbind('click');
    $('#lossitembtn').bind("click", function() {
        lossitem(selectedSingleid, selectedItemid, getplayer());
    });
    $("#shortcutbtn").hide();
    $("#eqptitembtn").show();
    $('#eqptitembtn').html("裝備"); $('#lossitembtn').html("丟棄"); $("#lossitembtn").show(); tagdisplay('eqptbtn');
}
function itembtninit() {
    disp_initialitem();
    $("#eqptitembtn").unbind('click');
    $('#eqptitembtn').bind("click", function() {
        eqptitem(selectedSingleid, selectedItemid, getplayer());
    });
    $("#lossitembtn").unbind('click');
    $('#lossitembtn').bind("click", function() {
        lossitem(selectedSingleid, selectedItemid, getplayer());
    }); getPackInfo(getplayer(), '2');
    $("#eqptitembtn").show();
    $('#eqptitembtn').html("使用"); $('#lossitembtn').html("丟棄");
    $("#lossitembtn").show(); tagdisplay('itembtn');
}
function normbtninit() {
    disp_initialitem();
    $("#lossitembtn").unbind('click');
    $('#lossitembtn').bind("click", function() {
        lossitem(selectedSingleid, selectedItemid, getplayer());
    }); getPackInfo(getplayer(), '3'); $("#shortcutbtn").hide(); $("#eqptitembtn").hide(); $('#lossitembtn').html("丟棄"); $("#lossitembtn").show(); tagdisplay('normbtn');
}
function spcbtinit() {
    disp_initialitem();
    selectedSingleid = "";
    $("#lossitembtn").unbind('click');
    $('#lossitembtn').bind("click", function() {
        if (selectedSingleid)
            usespecialitem(getplayer(), selectedSingleid, selectedItemid);
        else
            notifyactionresult('請選取物品');
    }); getSpecialPackInfo(getplayer());
    $("#shortcutbtn").hide();
    $("#eqptitembtn").hide();
    $('#lossitembtn').html("領取"); $("#lossitembtn").show(); tagdisplay('spcbtn');
}
function tagdisplay(whichone) {
    $('#eqptbtnbox').removeClass('mission_btn_selected');
    $('#itembtnbox').removeClass('mission_btn_selected');
    $('#normbtnbox').removeClass('mission_btn_selected');
    $('#spcbtnbox').removeClass('mission_btn_selected'); $('#' + whichone + 'box').addClass('mission_btn_selected');
    $('#eqptbtn').addClass('mission_btn');
    $('#itembtn').addClass('mission_btn');
    $('#normbtn').addClass('mission_btn');
    $('#spcbtn').addClass('mission_btn'); $('#' + whichone).removeClass('mission_btn');
}
function getPackInfo(me, type1) {
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
type1: "" + type1 + "", me: "" + me + "", what: "getPackInfo" 
				},
			success: function(data) {
				 display_pack(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});			

			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
type1: "" + type1 + "", me: "" + me + "", what: "getMoneyInfo"
				},
			success: function(data) {
				  disp_money(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		

}
function getSpecialPackInfo(me) {
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
me: "" + me + "", what: "getSpecialPackInfo"
				},
			success: function(data) {
				  display_pack(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		


			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
type1: "" + type1 + "", me: "" + me + "", what: "getMoneyInfo"
				},
			success: function(data) {
				  disp_money(data);
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});	
}

function display_pack(data) {
    $('#packlisttbl').html("");
    var celpline = 5;
    var celcount = 1;
    var aline = "<tr>";
    if (data != null) {
        for (var i = 0; i < data.length; ++i) {
            var img = data[i].item_img;
            var daid = data[i].item_id;
            var dapiid = data[i].id;
            var dispeq = "";
            if (data[i].item_eq != 0)
                dispeq = "E";
            var dispstacknum = "";
            if (data[i].item_stacknum) {
                if (data[i].item_stacknum != 0)
                    dispstacknum = data[i].item_stacknum;
            }
            if (data[i].item_eq == undefined) {
                dispeq = "";
                dispstacknum = "";
            }
            var idstr = "'" + daid + "'";
            var piidstr = "'" + dapiid + "'";
            var thecell = " \
<td width='32' height='32'><a class='bag_icon' id='packcell_" + daid + "' name='" + daid + "' onclick=\"gettheiteminfo(" + idstr + ", " + piidstr + ")\"> \
<table width='32' height='32' border='0' cellpadding='0' cellspacing='0' background='" + hinet + "images_ico/" + img + ".gif'> \
<tr> \
<td id='chooseitem' class='guide_bag_icon'>" + dispeq + dispstacknum + "</td> \
</tr> \
</table></a> \
</td> \
";
            aline += thecell;
            if (celcount == celpline || i == data.length - 1) {
                celcount = 0;
                $('#packlisttbl').html($('#packlisttbl').html() + aline + "</tr>");
                aline = "<tr>";
            }
            ++celcount;
        }
    }
}
function gettheiteminfo(itemid, theid) {
    newbieinstruct9(msg9);
  			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
itemid: "" + itemid + "", what: "gettheiteminfo" 
				},
			success: function(data) {
	    disp_singleitem(data);
	    packshopping();
	    selectedSingleid = theid;
	    selectedItemid = itemid;
			}, 
			error:
			function() {
				refershonerror();
	    selectedSingleid = "";
	    selectedItemid = "";				
			}, 
			timeout
			:20000
			});		  
}
function disp_singleitem(data) {
    $('#item_name').text("");
    $('#item_ef_at').text("");
    $('#item_ef_df').text("");
    $('#item_ef_str').text("");
    $('#item_ef_bone').text("");
    $('#item_ef_vit').text("");
    $('#item_ef_agl').text("");
    $('#item_ef_smart').text("");
    $('#item_ef_hp').text("");
    $('#item_ef_mn').text("");
    $('#item_desc').text("");
    $('#bag_showtext').show();
    $('#item_name').text(data.item_name);
    $('#item_ef_at').text(data.item_ef_at);
    $('#item_ef_df').text(data.item_ef_df);
    $('#item_ef_str').text(data.item_ef_str);
    $('#item_ef_bone').text(data.item_ef_bone);
    $('#item_ef_vit').text(data.item_ef_vit);
    $('#item_ef_agl').text(data.item_ef_agl);
    $('#item_ef_smart').text(data.item_ef_smart);
    $('#item_ef_hp').text(data.item_ef_hp);
    $('#item_ef_mn').text(data.item_ef_mn);
    $('#item_desc').text(data.item_desc);
}
function disp_initialitem() {
    $('#item_name').text("");
    $('#item_ef_at').text("");
    $('#item_ef_df').text("");
    $('#item_ef_str').text("");
    $('#item_ef_bone').text("");
    $('#item_ef_vit').text("");
    $('#item_ef_agl').text("");
    $('#item_ef_smart').text("");
    $('#item_ef_hp').text("");
    $('#item_ef_mn').text("");
    $('#item_desc').text("");
}
function disp_money(data) {
    $('#gold').text(data.p_money);
    $('#bagrmoney').text(data.p_r_money);
}
function eqptitem(theid, itemid, me) {
    if (theid != undefined) {
			$.ajax({
				dataType: "text",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
theid: "" + theid + "", itemid: "" + itemid + "", me: "" + me + "", what: "eqptitem"
				},
			success: function(data) {
		    exeJSstring(data);
		    equpinit();
		    newbieinstruct10(msg);
		    $('#popup').hidePopup();
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
function usespecialitem(me, theid, itemid) {
    if (theid != undefined) {
        $.post("./dispatchers/dispatcher.php", { me: "" + me + "", theid: "" + theid + "", itemid: "" + itemid + "", what: "usespecialitem" },
function(data) {
    exeJSstring(data);
    equpinit();
}
);
    }
}
function lossitem(theid, itemid, me) {
    if (theid != undefined) {
        $.post("./dispatchers/dispatcher.php", { theid: "" + theid + "", itemid: "" + itemid + "", me: "" + me + "", what: "lossitem" },
function(data) {
    exeJSstring(data);
    equpinit();
}
);
    }
}
function getFullInfo(me) {
    loadingOn();
    $.post("./dispatchers/dispatcher.php", { me: "" + me + "", what: "getFullInfo" },
function(data) { showFullInfo(data); loadingOff(); }, 'json'
);
    $.post("./dispatchers/dispatcher.php", { me: "" + me + "", what: "geteqptInfo" },
function(data) { showeqptInfo(data); loadingOff(); }, 'json'
);
}
function showFullInfo(data) {
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
    count = parseInt(data.p_win) / (parseInt(data.p_win) + parseInt(data.p_lost)) * 100;
    $('#player-probability').text(parseInt(count));
    $("#player-img").css("background-image", "url(/a3k/images_char/still/left/" + data.p_img + "_2.gif)");
    $("#fighticon").css("background-image", "url(/a3k/images_char/icon/left/" + data.pf_img + ".gif)");
    $("#fighticon").show();
    $("#player-img").show();
}
function showeqptInfo(data) {
    if (data) {
        $('#headeqpt').text("");
        $('#bodyeqpt').text("");
        $('#backeqpt').text("");
        $('#footeqpt').text("");
        $('#ringeqpt').text("");
        $('#weaponeqpt').text("");
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
function shortcutitem() {
    var itemid = document.getElementById('dascitemid').value;
    var me = getplayer();
    var scp = document.getElementById('whichshortcut').value;
    if (scp == "" || !IsNumeric(scp)) {
        scp = "1";
    }
    $.post("./dispatchers/dispatcher.php", { me: "" + me + "", itemid: "" + itemid + "", scp: "" + scp + "", what: "shortcutitem" },
function(data) { shortcutresult(data); }
);
}
function shortcutresult(data) {
    if (data == 1) {
        notifyactionresult('完成');
        $('#popup').hidePopup();
        listshortcut(getplayer());
    } else if (data == -1) {
        notifyactionresult('被動技能不用快捷');
    } else if (data == -2) {
        notifyactionresult('職業熟練度100%之後才能使用');
    }
    else
        notifyactionresult('失敗');
}
