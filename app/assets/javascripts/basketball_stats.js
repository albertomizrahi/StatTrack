/**
 * Created with JetBrains RubyMine.
 * User: parallels
 * Date: 1/17/13
 * Time: 1:26 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){


    $('#new_basketball_stat').on('submit', function(e){

        //Check if there is any input field empty and stops the submit event
        var errorCount = 0;
        $('#new_basketball_stat input').each(function(){
            var $this = $(this);
            if($this.val() == ''){

                errorCount = errorCount + 1;
            }
        });


        if(errorCount != 0) {
            e.preventDefault();
            alert("You must complete all the fields.");
        }



        //We know check if the user inputted more made shots than attempted in all three categories
        var field_goals_made = parseInt(document.getElementById("basketball_stat_field_goals_made").value);
        var field_goals_attempted = parseInt(document.getElementById("basketball_stat_field_goals_attempted").value);
        var threepts_made = parseInt(document.getElementById("basketball_stat_threepts_made").value);
        var threepts_attempted = parseInt(document.getElementById("basketball_stat_threepts_attempted").value);
        var free_throws_made = parseInt(document.getElementById("basketball_stat_free_throws_made").value);
        var free_throws_attempted = parseInt(document.getElementById("basketball_stat_free_throws_attempted").value);

        if ( (field_goals_made > field_goals_attempted) || (threepts_made > threepts_attempted) || (free_throws_made > free_throws_attempted)){
            e.preventDefault();
            alert("There can not be more made shots than attempted.");
        }

    });


    // Load add basketball stat window on click
    $('.add_basketball_stat_button').click(function (e) {
        $('.add_basketball_stat_window').modal(
            {
                containerCss: {
                    height: 570,
                    width: 700
                }
            });

        return false;
    });


});