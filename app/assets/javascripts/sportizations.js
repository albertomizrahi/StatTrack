$(document).ready(function(){

    $(".position-selector .new_sportization").on('submit', function(e){

        var position_selected = $("#sportization_position").val();

        if ( position_selected == ""){
            e.preventDefault();

            alert("You must choose a position.");
        }


    });


});