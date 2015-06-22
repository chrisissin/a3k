//a3k 設定跳窗插件
$.extend({
	facialPath:"./images/images_emoticon/",
	showingPopup:[],
	checkNoPopup:function() {//a3k 檢查有沒有跳窗正在顯示中
		if($.showingPopup.length < 1) {//a3k 沒有顯示中的popup就把事件釋放掉
			$(document).unbind('click', $.isOutMenu);
		}
	},
	showPopup:function(k) {//a3k 
		if($.showingPopup.length == 0) {//沒有顯示中的popup，因此點擊事件尚未被綁定，綁上一個點擊事件
			
			$(document).click($.isOutMenu);
		}
		
		var target = $('#'+k);
		if(!$.showingPopup[k]) {
			$.showingPopup[k] = target;
		}
		if(target.data("isShow") == false) {//a3k 若跳窗尚未顯示則顯示出來
			target.slideDown("fast", function() {
				target.data("isShow", true);
				delete target;
			});
		}
	},
	hidePopup:function(k) {
		if(!$.showingPopup[k]) {
			return;
		}
		$.showingPopup[k].data('isShow', false).hide();
		delete $.showingPopup[k];//a3k 清理堆疊中的資料
		$.checkNoPopup();
	},
	isOutMenu:function(e) {
		for(var k in $.showingPopup) { //a3k 對每個顯示中的popup判斷
			var menu = $.showingPopup[k];
			if(!menu) {
				return false;
			}
			if(menu.data('isShow') == false) {
				return;
			}
			var props = {
				left:parseInt(menu.css('left'),10),
				top:parseInt(menu.css('top'),10),
				width:menu.width(),
				height:menu.height()
			};
			if(e.clientX < props.left 
			|| e.clientX > props.left+props.width 
			|| e.clientY < props.top 
			|| e.clientY > props.top+props.height) {//點擊處在視窗外
				$.hidePopup(k);
			}
		}
	}
	
});
$.fn.extend({
	//製作跳窗
	//popup argument: 
	//callback: 在點擊視窗內的連結( <a> </a> )後要觸發的事件
	//autoHide; 點擊連結後是否要隱藏跳窗 (預設隱藏)
	
	//call method:
	//obj.popup();
	//obj.popup(callback);
	//obj.popup(callback, autoHide);
	//obj.popup(autoHide);
	popup:function(callback, autoHide) {
		//callback不是函式時則將callback視為autoHide
		if(!$.isFunction(callback)) {
			autoHide = callback;
		}
		return this.each(function() {
			var current = this;
			var popID = current.id;
			$(current)
			.data('isShow', false);	// pop狀態，true=顯示，false=不顯示(或動畫中)
			this.show = function(data) {
				$.showPopup(popID);
				if(data.left) {
					$('#'+popID).css('left', data.left);
				}
				
				if(data.top) {
					$('#'+popID).css('top', data.top);
				}
			}
			this.hide = function() {
				$.hidePopup(popID);
			}
			$(current).find('a').click(function(e) {
				var source = e.target;
				if($(popID).data('isShow') == false) {
					return false;
				}
				if(callback instanceof Function) {//a3k 先使用使用者定義函式
					callback.apply(source);
				}
				//點擊連結後自動隱藏物件
				if(autoHide != false) {
					current.hide();
				}
			});
			
		});
	},
	//移動物件到指定位置
	//moveTo arguments:
	//position: 有x與y的物件，position.x為要目的地的x座標，position.y為目的地的y座標
	moveTo: function(position) {
		return this.each(function() {
			var current = this;
			//靜態物件(無法透過CSS來移動位置的物件)或隱藏物件則不移動
			if($(this).css('position') == 'static' || $(this).css('display') == 'none') {
				return;
			}
			$(this).css({
				left:position.x,
				top:position.y-4
			});
		});
	}
});