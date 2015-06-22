
$.extend({facialPath:"./images/images_emoticon/",showingPopup:{},checkNoPopup:function(){var noShowing=true;$.each($.showingPopup,function(){noShowing=false;return false;});if(noShowing==true){$(document).unbind('click',$.isOutMenu);}},showPopup:function(k){var noShowing=true;$.each($.showingPopup,function(){if(this.data('isShow')!=undefined&&this.data('isShow')==true){noShowing=false;return false;}});if(noShowing==true){$(document).click($.isOutMenu);}
var target=$('#'+k);if($.showingPopup[k]==undefined){$.showingPopup[k]=target;}
if(target.data("isShow")==false){target.slideDown("fast",function(){target.data("isShow",true);target=null;});}},hidePopup:function(k){if(!$.showingPopup[k]){return;}
$.showingPopup[k].data('isShow',false).hide();delete $.showingPopup[k];$.checkNoPopup();},isOutMenu:function(e){for(var k in $.showingPopup){var menu=$.showingPopup[k];if(!menu){return false;}
if(menu.data('isShow')==false||menu.data('outSensor')===false){return;}
var props={left:menu.offset().left,top:menu.offset().top,width:menu.width(),height:menu.height()};if(e.clientX<props.left||e.clientX>props.left+props.width||e.clientY<props.top||e.clientY>props.top+props.height){$('#'+k).hidePopup();}}}});$.fn.extend({popup:function(callback,settings){if(!$.isFunction(callback)){settings=callback;}
if(settings===undefined){settings={};}
return this.each(function(){var current=this;var popID=current.id;$(current).data('isShow',false).data('outSensor',(settings.outSensor===false?false:true));$(current).find('a').click(function(e){var source=e.target;if($(popID).data('isShow')==false){return false;}
if(callback instanceof Function){callback.apply(source);}
if(settings.linkSensor!==false){$(current).hidePopup();}});});},showPopup:function(data){return this.each(function(){var popID=this.id;var popup=$('#'+popID);if(popup.data('isShow')!=undefined){$.showPopup(popID);}
if(data){if(data.left){popup.css('left',data.left);}
if(data.top){popup.css('top',data.top);}}});},hidePopup:function(){return this.each(function(){$.hidePopup(this.id);});},moveTo:function(position){return this.each(function(){var current=this;if($(this).css('position')=='static'||$(this).css('display')=='none'){return;}
$(this).css({left:position.x,top:position.y});});}});