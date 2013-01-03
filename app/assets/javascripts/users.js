
//Assures that the appropriate sport position list is shown depending on the sport chosen
function show_position_selection(sport_name) {


   document.getElementById("position_selector").style.display = "block";


    var basketballPositions = {
        "" : "",
        "Guard": "Guard",
        "Forward": "Forward",
        "Center": "Center"
    };

    var footballPositions = {
        "" : "",
        "Quarterback": "Quarterback",
        "Halfback": "Halfback",
        "Receiver": "Receiver"
    };


    var $el = $("#sportization_position"); //Assigns the select object to a variable
    $el.empty(); // removes old options from list

    if (sport_name == "Basketball") {
        //For each value in the array, an option tag is added to the list with the value and text of the positions in the array
        $.each(basketballPositions, function(key, value) {
            $el.append($("<option></option>").attr("value", value).text(key));
        });
    }

    else if (sport_name == "Football") {
        $.each(footballPositions, function(key, value) {
            $el.append($("<option></option>").attr("value", value).text(key));
        });
    }

    //Hides the submit button in case the user changes the sport and the value of the position is empty
    document.getElementById("submit_button_div").style.display = "none";
}

//Ensures that a sport and position is chosen before allowing the user to submit the form
function enable_submit_button(value) {

    if (value != "") {
        document.getElementById("submit_button_div").style.display = "block";
    }

    else{
        document.getElementById("submit_button_div").style.display = "none";
    }


}
