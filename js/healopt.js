$(document).ready(function() {
    $("#closebit").unbind('click');
    $('#closebit').bind("click", function() {
    	$('#popup').hidePopup();
    });
    
    
    $("#cost").unbind('click');
    $('#cost').bind("click", function() {
        toheal(getplayer());
    });    
    
    $("#nocost").unbind('click');
    $('#nocost').bind("click", function() {
        heal(getplayer());
    });     
});
