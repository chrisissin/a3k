$.fn.extend({
	searchPanel:function(type) {
		return this.each(function() {
			//只有text input可以使用
			if(this.tagName.toLowerCase()!=='input' || this.type.toLowerCase() !== 'text') {
				return;
			}
			$('<button>新增</button>').click(function() {
				$()
			});
			
		});
	}
});

$(document).ready(function() {
	//微調視窗的高度
	var $body = $('#body');
	var currentHeight = $body.height();
	var newHeight = $(document).height()*0.9;
	if(newHeight > currentHeight) {
		$body.css({
			height:newHeight
		});
	}
	//a3k 
	$('#listenList div').live('mouseover', function() {
		$(this)
		.css('background-color', '#CCCCCC')
		.css('cursor', 'pointer')
		.click(getListenText);
	}).live('mouseout', function() {
		$(this)
		.css('background-color', '#FFFFFF')
		.css('cursor', 'normal')
		.unbind('click', getListenText);
	});
	$('.helpJob').live('click', function() {
		showHelp('job');
	});
	$('.helpItem').live('click', function() {
		showHelp('item');
	});
	$('.helpDate').live('click', function() {
		showHelp('date');
	});
	$('.helpMonster').live('click', function() {
		showHelp('monster');
	});
	
	$('.helpFight').live('click', function() {
		showHelp('fight');
	});
	$('.helpQuest').live('click', function() {
		showHelp('quest');
	});
	$('.helpFellow').live('click', function() {
		showHelp('fellow');
	});
	$('#box1').popup();
	
	//a3k 初始化頁面
	$.post('admcontrol.php',{f:'adm', act:'init'}, function(data) {
		//將頻道id存入系統變數
		$.extend({
			channel : data.channelID
		});
		if(data.isLogined == true) {
			$('#body').load('./template/welcome.htm');
			$('#listen').click(showListenMenu);
			$('#system').click(showBroadcastMenu);
			//顯示新增任務的頁面
			$('#addQuest').click(function() {
				$('#body').data('type', 'add');
				$('#body').load('./template/addQuest.htm', {}, initQuestPage);
			});
			
			
			$('#getQuestList').click(function() {
				$('#body').load('./template/questList.htm', {}, function() {
					$.post('admcontrol.php', {
						f:'quest',
						act:'getList'
					}, function(data) {
						var arr = [];
						var table = $('#body > table > tbody');
						$.each(data.list, function(k, v) {
							var btn = $('<button>編輯</button>').click(function() {
								$('#body').data('type', 'edit');
								$.post('admcontrol.php', {
									f: 'quest',
									act: 'getDetail',
									id: v.q_id
								}, function(data) {
									
									$('#body').load('./template/editQuest.htm', {}, function() {
											setupQuestData(data);
											initQuestPage(v.q_id);
									});
								}, 'json');
								return false;
							});
							$('<tr'+(v.q_expire ? ' class="expire"' :'')+'><td>'+v.q_id+'</td><td>'+v.q_title+'</td><td>'+v.q_requester+'</td><td>'+v.q_map_name+'</td><td></td></tr>')
							.appendTo(table).find('td:eq(4)').append(btn);
						});
						table.find('> tr').unbind().click(function(e) {
							var tr = e.originalTarget.parentNode;
							var title = $(tr.childNodes[1]).text();
							if($(tr).attr('class') == 'expire') {
								var expireTime = inputExpireTime();
								if(expireTime > 0) {
									$.post('admcontrol.php', {
											f:'quest',
											act:'alive',
											title:title,
											expireTime:expireTime
										}, function(data) {
											alert('變更完成');
											$(tr).removeClass().removeClass('expire');
										}, 'json');
								}
							}else if(confirm('這個動作會將[ '+title+' ]任務的過期時間設為當前時間，藉此讓任務得以存留而玩家無法存取接下這個任務\n確定讓這個任務過期?') == true) {
								$.post('admcontrol.php', {
										f:'quest',
										act:'remove',
										title:title
									}, function(data) {
										if(data.success) {
											alert('成功讓任務過期');
											$(tr).removeClass().addClass('expire');
										}
									}, 'json');
							}
						});
					}, 'json');
				});
			});
		} else {
			$('#body').load('./template/login.htm');
		}
	},'json');
});

//a3k 取得監聽對象的對話
function getListenText(e) {
	var name = $(e.originalTarget).html() || "";
	$('#listenName').val(name);
	$.post("admcontrol.php", {f:"listen", act:"getText", name:name}, function(data) {
		if(data.error) {
			alert(data.error);
			return;
		}
		$('#listenText').empty();
		if(data.msg.length == 0) {
			$('#listenText').append('<p>沒有內容</p>');
		} else {
			$.each(data.msg, function(k, v) {
				var s = v.split(',', 5);
				var str = '';
				var date = new Date();
				date.setTime(parseInt(s[0], 10) * 1000);
				
				str = date.getFullYear()+'-'
					+(date.getMonth() < 10 ? '0' : '')+date.getMonth() +'-'
					+(date.getDate() < 10 ? '0' : '')+date.getDate()+' '
					+(date.getHours() < 10 ? '0' : '')+date.getHours()+':'
					+(date.getMinutes() < 10 ? '0' : '')+date.getMinutes()
				+'<span class="msg'+s[2]+'">'+s[4]+'</span>';
				$('#listenText').append('<div>'+str+'</div>');
			});
		}
	}, "json");
}

function initQuestPage(q_id) {
	//點日期限制的 [設定] 按鈕時，跳出選擇條件限制的視窗 
	$('#popup1').unbind().click(popupDateLimit);
	
	//點過期時間的 [設定] 按鈕時，跳出詢問視窗來輸入日期
	$('#popup2').unbind().click(function() {
		$('#expire_time').val(inputExpireTime());
	});
	//點[新增]按鈕，送出新增的要求
	$('#sendQuest').click(function() {
		if(checkQuestContentRight() == true) {
			$.post('admcontrol.php', {
				f:'quest',
				act:$('#body').data('type'),
				id: q_id || "",
				title:$('#title').val() || "",
				requester:$('#requester').val() || "",
				img:$('#img').val() || "",
				description:$('#description').val() || "",
				map_name:$('#map_name').val(),
				map_id:$('#map_id').val(),
				dest_map:$('#dest_map').val(),
				expireTime:$('#expire_time').val() || "",
				limit_show_lv:$('#limit_show_lv').val() || 0,
				limit_lv:$('#limit_get_lv').val() || 0,
				limit_job:$('#limit_job').val() || "",
				limit_item:$('#limit_item').val() || "",
				limit_quest:$('#limit_quest').val() || "",
				limit_time:$('#limit_time').val() || "",
				limit_description:$('#limit_description').val() || "",
				instant:$('#instant:checked').length ? 1 : 0,
				need_monster:$('#need_monster').val() || "",
				need_fight:$('#need_fight').val() || "",
				need_item:$('#need_item').val() || "",
				need_description:$('#need_description').val() || "",
				award_exp:$('#award_exp').val() || 0,
				award_money:$('#award_money').val() || 0,
				award_item:$('#award_item').val() || "",
				award_point:$('#award_point').val() || 0,
				award_fellow:$('#award_fellow').val() || "",
				award_description:$('#award_description').val() || ""
			}, function(data) {
				if(data.error) {
					alert(data.error);
					return;
				}
				alert(($('#body').data('type')=='add'?'新增':'編輯')+'完成');
				//$('#body').load('./template/login.htm');
			}, 'json');
		}
	});
}

function setupQuestData(data) {
	$('#title').val(data.q_title || "");
	$('#requester').val(data.q_requester || "");
	$('#img').val(data.q_img || "");
	$('#description').val(data.q_description || "");
	$('#map_name').val(data.q_map_name || "");
	$('#map_id').val(data.q_map_id || "");
	$('#dest_map').val(data.q_dest_map || "");
	$('#expire_time').val(data.q_expireTime || 0);
$('#limit_show_lv').val(data.q_show_lv || 0);
	$('#limit_get_lv').val(data.limit_lv || 0);
	$('#limit_job').val(data.limit_job || "");
	$('#limit_item').val(data.limit_item || "");
	$('#limit_quest').val(data.limit_quest || "");
	$('#limit_time').val(data.q_week?data.q_week+','+data.q_hour:'');
	$('#limit_description').val(data.limit_description || "");
	$('#instant').attr('checked', data.q_instant==1 ? 'checked' : ''),
	$('#need_monster').val(data.need_monster || "");
	$('#need_fight').val(data.need_fight || "");
	$('#need_item').val(data.need_item || "");
	$('#need_description').val(data.need_description || "");
	$('#award_exp').val(data.award_exp || "");
	$('#award_money').val(data.award_money || "");
	$('#award_item').val(data.award_item || "");
	$('#award_point').val(data.award_point || "");
	$('#award_fellow').val(data.award_fellow || "");
	$('#award_description').val(data.award_description || "");
}

function showBroadcastMenu() {
	$('#body').load('./template/broadcast.htm', function() {
		$('#btnSendSystemMsg').click(function() {
			var msg = $('#msg').val();
			if(!$.trim(msg)) {
				alert('沒有輸入內容');
				return;
			}
			$.post('admcontrol.php', {f:'chat', act:'systemMsg', msg:msg},function(data) {
				if(data.error) {
					alert(data.error);
					return;
				}
				alert('公告成功');
			}, 'json');
		});
	});
}

function showListenMenu() {
	$('#body').load('./template/listen.htm', function() {
		$('#btnAddListen').click(function() {
			var name = $('#listenName').val();
			if(!$.trim(name)) {
				alert('沒有輸入名稱');
				return;
			}
			$.post('admcontrol.php', {f:'listen', act:'add', name:$('#listenName').val()},function(data) {
				if(data.error) {
					alert(data.error);
					return;
				}
				alert('新增成功');
				$('#listenList').append('<div>'+data.target+'</div>');
			}, 'json');
		});
		
		$('#btnRemoveListen').click(function() {
			var name = $('#listenName').val();
			if(!$.trim(name)) {
				alert('沒有輸入名稱');
				return;
			}
			$.post('admcontrol.php', {f:'listen', act:'remove', name:$('#listenName').val()},function(data) {
				if(data.error) {
					alert(data.error);
					return;
				}
				alert('取消成功');
				$('#listenList div:contains("'+name+'")').remove();
			}, 'json');
		});
		
		$.post('admcontrol.php', {f:'listen', act:'init'}, function(data) {
			if(data.list.length > 0) {
				$.each(data.list, function(k, v) {
					$('#listenList').append('<div>'+v+'</div>');
				});
			}
		}, 'json');
	});
}

function checkQuestContentRight() {
	if(
	!$('#title').val()
		|| !$('#requester').val()
		|| !$('#title').val()
		|| !$('#description').val()
		|| !$('#map_name').val()
		|| !$('#map_id').val()
		|| !$('#dest_map').val()
	) {
		alert('內容不完全');
		return false;
	}
	
	return true;
}

function showHelp(type) {
	var str = "";
	switch(type) {
		case 'job':
			str = '格式:職業ID\n ex:限定職業為w1的話則填入w1';
		break;
		
		case 'item':
			str = '格式:物品1ID:數量,物品2ID:數量, ...\n ex:如果需要一個id=20的物品則填入 20:1\n如果需要三個id=30和兩個id=20的物品則填入 30:3,20:2';
		break;
		
		case 'quest':
			str = '格式:任務1ID,任務2ID\n ex:前置任務為q00001的話則填入 q00001\n\n前置任務為q00003和q00007的話則填入 q00003,q00007';
		break;
		
		case 'date':
			str = '格式:週,小時\n ex:每天00:00到24:00則填入 127,16777215';
		break;
		
		case 'monster':
			str = '格式:怪物1ID:數量,怪物2ID:數量, ...\n ex:如果需要5個id=13的怪物則填入 13:5\n如果需要3個id=30和2個id=1的怪物則填入 30:3,1:2';
		break;
		
		case 'fight':
			str = '格式:map1_ID:數量,map2_ID:數量, ...\n ex:如果需要5個id=m01的怪物則填入 m01:5\n如果需要3個id=m02和2個id=m09的怪物則填入 m02:3,m09:2';
		break;
		
		case 'fellow':
			str = '格式:武將1ID,武將2ID\n ex:獎勵的武將為a01的話則填入 a01\n\n獎勵的武將為a03和a01的話則填入 a03,a01';
		break;
		
		default:
			str = '未知的說明類型';
		break;
	}
	alert(str);
}

function popupDateLimit() {
	var axis = $('#popup1').offset();
	axis.top = axis.top-180;
	if(axis.top < 0) {
		axis.top = 0;
	}
	$('#box1').showPopup({
		left:axis.left,
		top:axis.top
	});
	$('#box1 #set').unbind().click(function() {
		
		var week = $('#boxWeek').val();
		var hour = $('#boxHour').val();
		var weekValue = 0;
		var hourValue = 0;
		for(var i in week) {
			weekValue+=(1 << week[i]);
		}
		
		for(var i in hour) {
			hourValue += (1 << hour[i]);
		}
		if(weekValue == 0) {
			alert('沒有選擇發生的星期');
			return;
		}
		
		if(hourValue == 0) {
			alert('沒有選擇發生的時段');
			return;
		}
		$('#boxWeek').val("");
		$('#boxHour').val("");
		$('#limit_time').val(weekValue+','+hourValue);
		$('#box1').hidePopup();
	});
}

function inputExpireTime() {
	var input = prompt("請輸入日期，格式為YYYY-MM-DD HH");
	if(!((/^\d{4}-\d{2}-\d{2} \d{2}$/).test(input))) {
		alert('格式錯誤');
		return 0;
	}
	input = input.match(/^(\d{4})-(\d{2})-(\d{2}) (\d{2})$/);
	var date = new Date();
	date.setFullYear(parseInt(input[1], 10));
	date.setMonth(parseInt(input[2], 10)-1);
	date.setDate(parseInt(input[3], 10));
	date.setHours(parseInt(input[4], 10));
	date.setMinutes(0);
	date.setSeconds(0);
	return Math.floor(date.getTime()/1000);
	//$('#expire_time').val(Math.floor(date.getTime()/1000));
}