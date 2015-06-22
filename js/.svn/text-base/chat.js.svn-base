(function($) {

/** Initiate **/
$(document).ready(function() {
	$("#p_menu").popup(function() {// a3k 點擊人名時所作的處理
		switch($(this).attr('hash').substr(1)) {
			case 'status':
				// call status function
			break;
			case 'whisper':
				whisperTo($("#p_menu").data('target'));
			break;
			case 'team':
				//call team function
			break;
			case 'blacklist':
				addBlacklist($("#p_menu").data('target'));
			break;
			default:
					return;
			break;
		}
	});
	
	$("#facial").popup(function() {//a3k 點擊圖片時的事件
		var img = this.childdNodes ? this.childNodes[0].src : this.src;
		if(!img) {
			return false;
		}
		var match = img.match(/^http:\/\/(.+\/)+([^\/]+)\.png$/i);
		
		if(!match[2]) {
			return false;
		}
		//$('#textfield4').click().val($('#textfield4').val()+'%'+match[2]+'%');
		$('#textfield4').append($('<img src="'+match[0]+'"/>'));
	});
	
	$('#textfield4')
	.attr('contentEditable', true)
	.unbind('click')
	.click(function() {
		$(this).blur().focus();
	});
	
	$('#func_menu').popup(function() {//a3k 點擊[功能]目錄的連結時的事件
		switch($(this).attr('hash').substr(1)) {
			case 'facial'://a3k 顯示表情符號視窗
				{
					$('#facial').showPopup();
					var toolPosition = $('#tool').offset();
					$('#facial').moveTo({x:toolPosition.left-92,y:toolPosition.top-72});
				}
			break;
			case 'blacklist': //a3k 顯示黑名單視窗
			{
				//inner function，處理$list的顯示與後續動作
				function _handle() {
					var toolPosition = $('#tool').offset();
					var table = $('#blacklist table tbody');
					var list = $('#blacklist').data('list');
					if(list.length == 0) {
						alert('沒有任何玩家在黑名單中');
						return;
					}
					table.empty();
					$.each(list, function(k, v) {
						var s2 = v.split(',');
						$('<tr><td><a href="#">'+s2[1]+'</a></td></tr>').appendTo(table);
					});
					table.find('a').click(function() {//a3k 按下黑名單內的名稱時的事件
						var target = $(this);
						if(confirm('確定將[ '+target.html()+' ]從黑名單刪除？') == true) {
						
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
f:'blacklist', act:'removeName', name:target.html(), me: getplayer()
				},
			success: function(data) {
if(data.error) {
									notifyactionresult(data.error);
								} else {
									//將包含有要刪除的人名的tr從table刪除
									target.parent().parent().remove();
									//將以刪除的人名從cache去掉
									$('#blacklist').data('list', $.grep(list, function(v, k) {
										var s = v.split(',');
										return s[1] != target.html();
									}));
								}
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});									

							
						}
					});
					$('#blacklist')
					.showPopup()
					.moveTo({x:toolPosition.left, y:toolPosition.top - 100});
				}
				
				
				var list = $('#blacklist').data('list');
				if((typeof list).toLowerCase() == 'undefined') {
					//向server取得黑名單
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
						f:'blacklist', 
						act:'getList',
						me:getplayer()
				},
			success: function(data) {
						//將取得的list存入cache
						$('#blacklist').data('list', data.list ? data.list.split(';') : []);
						_handle();
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});							
				} else {
					_handle();
				}
				
			}
			break;
			default:
					return;
			break;
		}
	});
	
	$('#blacklist').popup(function() {
	
	});
	
	$('#tool').click(function(e) {//a3k 點擊[功能]按鈕時，跳出跳窗
		var target = $('#func_menu');
		var tool = $('#tool');
		var toolPosition = tool.position();
		$('#func_menu').showPopup();
		target.data('target', $(e.target).html());
		target.moveTo({x:toolPosition.left,y:toolPosition.top+tool.outerHeight()});
	});
	/*$('span.p_menu').live("click", function(e) {//a3k 對玩家名稱監聽點擊事件
		var target = $('#p_menu');
		if(target.data("isShow") == false) {//a3k 若跳窗尚未顯示則顯示出來
			target.slideDown("fast", function() {
				target.data("isShow", true);
				delete target;
			});
			$('#p_menu').showPopup();
		}
		
		target.data('target', $(e.target).html());
		target.moveTo({x:e.clientX,y:e.clientY});
	});*/
	
	//密語對象欄的key press事件，按下enter時就focus對話欄
	$('input#textfield3').keypress(function(e) {
		if(e.which == 13) {
			$('#textfield4').focus().click();
			return false;
		}
	}).one("click", function() {// 第一次點擊密語對象欄就把這個密與對象欄的value清空
		$('input#textfield3').val("");
	});
	
	//a3k 在對話欄按下enter則送出對話
	$('#textfield4')
		.data("isClick", false)
	.keypress(function(e) {
		if(e.which != 13) {
			return;
		}
		if(checkChangeCnannel() == false) {//對話內沒有換頻指令 將對話內容送出
			$('a#submit').click();
		}
		return false;
	}).one("click", function() {//第一次點擊對話欄時清除對話欄裡面的文字
		$('#textfield4').data("isClick", true);
	});
	
	//對submit按鍵監聽click事件，點擊時會送出聊天的request給server
	var ct = new Date();
	ct.setTime(0);
	$('a#submit')
		.data("usertime", 0)
		.data("clienttime", ct)
		.data("log", {text:"", count:0})
	//送出聊天訊息
	.click(function() {
		var obj = $('a#submit');
		var log = obj.data("log");
		
		$('#textfield4 > img').each(function(i, v) {
			var match = this.src.match(/^http:\/\/(.+\/)+([^\/]+)\.png$/i);
			var imgText = '%'+match[2]+'%';
			$(this).replaceWith(imgText);
		});
		var input = $('#textfield4').text();
		/*//尚未點擊過
		if($('#textfield4').data("isClick") == false || !input) {
			return false;
		}*/
		
		//a3k check empty
		if(input.length >= 50 ) {
			notifyactionresult("太長了");
			$('#textfield4').html('');
			return false;
		}
		if(input == "" ) {
			return false;
		}
		
		//a3k 連續發話檢查
		if((new Date()).getTime() - obj.data("clienttime").getTime() < 3000 && obj.data("usertime") != 0) {
			notifyactionresult("禁止連續發話！");
			return false;
		}
		
		//a3k 重複內容檢查
		if(input == log.text) {
			log.count += 1;
			if(log.count > 2) {
				notifyactionresult("請勿重複發言！");
				return;
			}
		} else {
			//a3k 將新的對話內容寫入log.text，並把記數器初始化
			log.text = input;
			log.count = 1;
		}
		//將輸入框內的圖片轉成文字
		
		
		//a3k 清除refresh timer，防止重複發出相同的index的請求
		clearTimeout($('a#submit').data('timer'));
		
		//清除輸入內容
		$('#textfield4').html("");
		
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
			f:'chat',
			act:"post", 
			me:getplayer(), 
			text:input, 
			channel:$('#select2').val(), 
			target:$('#textfield3').val(), 
			usertime:$('a#submit').data("usertime"),
			index:$('a#submit').data('chatlogIndex')
				},
			success: function(data) {
			//錯誤訊息顯示在聊天視窗內
			if(data.error) {
				showMsg(['5,'+data.error]);
			}else {
				$('a#submit')
					.data("usertime", data.usertime)
					.data("clienttime", new Date())
					.data('chatlogIndex', data.index)
					.data('refreshTime', data.refreshTime);
				showMsg(data.msg, true);
			}
			$('a#submit').data('timer', setTimeout(requestRefresh, $('#submit').data('refreshTime')));
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});				
		
	});
	
	//a3k 初始化聊天介面
			$.ajax({
				dataType: "json",
		  type: "POST",
	    url: "./dispatchers/dispatcher.php",
			data: {
			f:'chat', 
			me:getplayer(), 
			act:"init"
				},
			success: function(data) {
				$('a#submit')
					.data("usertime", data.usertime)
					.data('refreshTime', data.refreshTime)
					.data('chatlogIndex', data.index)
					.data('timer', setTimeout(requestRefresh, $('#submit').data('refreshTime')));
				if(data.isLogined == false) {
					$('#talkbox').html('尚未登入');
				} else {
					showMsg(data.msg, true);
					if(data.annouce != null)
					{
						showanouce(data.annouce);
					}					
				}
			}, 
			error:
			function() {
				refershonerror();
			}, 
			timeout
			:20000
			});		

});

function requestRefresh() {
		clearTimeout(mtv);
	$.ajax({
	  type: "POST",
	  dataType: "json",
    url: "./dispatchers/dispatcher.php",
		data: {
			f: 'chat', 
			act: 'refresh', 
			im:getplayer(),
			usertime:$('a#submit').data('usertime'),
			index:$('a#submit').data('chatlogIndex')
			},
		success: function(data) {
			refresh_res(data);
		}, 
		error:function(data) {
			ktv();
		}, 
		timeout
		:function(data) {
			ktv();
			}
		});
}
var mtv
function ktv()
{
	clearTimeout($('a#submit').data('timer'));
	mtv = setTimeout(requestRefresh, $('#submit').data('refreshTime'));
}


function refresh_res(data)
{
	if(gcon(data))
	{
	$('a#submit')
	.data("usertime", data.usertime)
	.data('refreshTime', data.refreshTime)
	.data('chatlogIndex', data.index)
	.data('timer', setTimeout(requestRefresh, $('#submit').data('refreshTime')));	
	showMsg(data.msg);
	}
}


//$('a#submit').data('timer') = setTimeout(requestRefresh, $('#submit').data('refreshTime'));


function gcon(data)
{
	if(data.serverout != null)
	{
		alert(data.sysmsg);
		window.location = loginaddress;		
		return false;
	}
	if(data.lock === 1 || data.sesout=== 1)
	{
					alert(data.sysmsg);
	    		setplayer(null);
	    		seta3klogin();
	    		checkplayer();
	    		return false;
	}
	if(data.capt === 1)
	{
			invocapt();
			return false;
	}		
	if(data.annouce != null)
	{
		showanouce(data.annouce);
		return true;
	}		
	return true;
}

function checkChangeCnannel() {// 檢查有沒有切換頻道的指令在對話內
	var input = $('#textfield4').val();
	var changeChannel = false;
	switch(true) {
		case (input.indexOf('/t') == 0)://lcoal
			$('select#select2').val(1);
			changeChannel = true;
		break;
		case (input.indexOf('/s') == 0)://public
			$('select#select2').val(0);
			changeChannel = true;
		break;
		case (input.indexOf('/g') == 0)://guild
			$('select#select2').val(3);
			changeChannel = true;
		break;
		case (input.indexOf('/p') == 0)://team
			$('select#select2').val(4);
			changeChannel = true;
		break;
		case (input.indexOf('/m') == 0)://whisper
			$('select#select2').val(2);
			changeChannel = true;
		break;
	}
	if(changeChannel == true) {
		$('#textfield4').val(input.substr(2));
	}
	return changeChannel;
}

function showMenu(name) {
	notifyactionresult(name);
}

function showMsg(msg, clearText) {//a3k 顯示從server取得的對話
	if(!(msg instanceof Object)) {
		notifyactionresult("錯誤的訊息");
		return;
	}
	var talkbox = $('#talkbox');
	$.each(msg, function(key, value) {
		var s = value.split(",", 2);
		s[1] = s[1].replace(/%([^%]+)%/ig,"<img src=\""+$.facialPath+"$1.png\"/>");
		msg[key] = '<span class="msg'+s[0]+'">'+s[1]+'</span><br/>';
	});
	msg = msg.join("");
	if(msg) {
		$(msg).click(function(e) {//a3k 對玩家名稱監聽點擊事件
			var target = $('#p_menu');
			if(target.data("isShow") == false) {//a3k 若跳窗尚未顯示則顯示出來
				target.slideDown("fast", function() {
					target.data("isShow", true);
					delete target;
				});
				$('#p_menu').showPopup();
			}
			
			target.data('target', $(e.target).html());
			target.moveTo({x:e.clientX,y:e.clientY});
		}).appendTo(talkbox);
	}
	//talkbox.html(talkbox.html()+msg.join(""));
	
	if(clearText == true) {
		$('#textfield4').html("");
	}
	var bias = talkbox[0].scrollHeight - talkbox[0].clientHeight;
	if(bias > 0) {
		talkbox.scrollTop(bias);
	}
}

function whisperTo(name) {
	$('#textfield3').click().val(name);
	$('#select2').val(2);
}

function addBlacklist(name) {
	$.post('./dispatchers/dispatcher.php', {f:'blacklist',act:'add',me:getplayer(),  name:name}, function(data) {
		//將新加入的人名加入到黑名單的cache中
		if(!data.error) {
			var list = $('#blacklist').data('list');
			if((typeof list).toLowerCase() == 'undefined') {
				$.post('./dispatchers/dispatcher.php', {
						f:'blacklist', 
						act:'getList',
						me:getplayer()
					}, function(data2) {
						//將取得的list存入cache
						$('#blacklist').data('list', data2.list ? data2.list.split(';') : []);
					}, 'json');
			} else {
				list.push(data.id+','+data.name);
				$('#blacklist').data('list', list);
			}
		}
		//顯示訊息
		notifyactionresult(data.error || '成功地將'+data.name+'加入至黑名單中');
	},'json');
}

})(jQuery);
