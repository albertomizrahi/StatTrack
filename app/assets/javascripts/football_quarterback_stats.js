$(document).ready(function(){

   //Validate the input
    $('#new_football_quarterback_stat').on('submit', function(e){

        //Check if there is any input field empty and stops the submit event
        var errorCount = 0;
        $('#new_football_quarterback_stat input').each(function(){
            var $this = $(this);
            if($this.val() == ''){

                errorCount = errorCount + 1;
            }
        });


        if(errorCount != 0) {
            e.preventDefault();
            alert("You must complete all the fields.");
        }



        //We know check if the user inputted more passes completed than attempted
        var passes_completed = document.getElementById("football_quarterback_stat_completions").value;
        var passes_attempted = document.getElementById("football_quarterback_stat_passing_attempts").value;


        if (passes_completed > passes_attempted){
            e.preventDefault();
            alert("There can not be more passes completed than attempted.");
        }

    });


    // Load add football quarterback stat window on click
    $('.add_football_quarterback_stat_button').click(function (e) {
        $('.add_football_quarterback_stat_window').modal(
            {
                containerCss: {
                    height: 380,
                    width: 600
                }
            });

        return false;
    });

});



