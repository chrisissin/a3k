$(document).ready(function() {
    $("#closebit").unbind('click');
    $('#closebit').bind("click", function() {
    	$('#fmpopup').hidePopup();
    });
    
    $("#okit").unbind('click');
    $('#okit').bind("click", function() {
        $('#fmpopup').hidePopup();
    });    
});
