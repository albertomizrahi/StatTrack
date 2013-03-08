
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
        "Runningback": "Runningback",
        "Receiver": "Receiver",
        "Tight end": "Tight end",
        "Defensive tackle": "Defensive tackle",
        "Defensive end": "Defensive end",
        "Middle linebacker": "Middle linebacker",
        "Outside linebacker": "Outside linebacker",
        "Cornerback": "Cornerback",
        "Safety": "Safety"
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


$(document).ready(function() {



    //Only allows for numbers to be written in input fields with class number_field_only
    $(".number_field_only").keydown(function(event) {
        // Allow: backspace, delete, tab, escape, and enter
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                event.preventDefault();
            }
        }
    });

    //The following set of code checks to see if any tab is already active (this occurs if a parameter to tab would be passed)
    //If no tab is active, make the first tab and tab-pane active
    var elementAlreadyActive = false;
    $('.nav-tabs li').each(function(index, li) {
        var element = $(li);
         if (element.attr("class") == "active"){
              elementAlreadyActive = true;
         }

    });
    if (!elementAlreadyActive){
        $('.nav-tabs li:first').addClass('active');
        $('.tab-content div:first').addClass('active');
    }


    //Styles the stat tables
    $( "table" ).children("tbody").children('tr:first-child').addClass( "top-row" );
    $( "table" ).children("tbody").children('tr:nth-child(even)').addClass( "alternate-row" );
});

