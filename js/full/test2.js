
$(document).ready(function()
{
  $('#missionbtn').click(function()
  {
    //�ʺA�إߥ��Ȫ�����( id = missionpopup )
	if($('#missionpopup').length == 0) {
	  $('<div></div>')
	  .attr('id', 'missionpopup')
      .css('position', 'absolute')
	  .hide()
	  .popup(false)
      .appendTo('body');
	}
    $('#missionpopup').load('./mission.html', {}, function() {
      $(this).showPopup();
            var tool = $('#missionbtn');
            var toolPosition = tool.offset();
                    //    moveTo($(this), { x: toolPosition.left - 92, y: toolPosition.top - 72 });
       
    });
  }); 
 });
 
  function moveTo(target, position) {
	if(!target || !position) {
		return;
	}
	target.css({
		'z-index':99,
		left:position.x,
		top:position.y
	});
}