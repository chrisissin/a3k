$(document).ready(function() {
    $("#closebit").unbind('click');
    $('#closebit').bind("click", function() {
        $('#mpopup').hidePopup();
    });
    
    $("#okit").unbind('click');
    $('#okit').bind("click", function() {
        $('#mpopup').hidePopup();
    });    
});
