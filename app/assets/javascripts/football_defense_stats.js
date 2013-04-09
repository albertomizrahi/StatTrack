$(document).ready(function(){

    //Validate the input
    $('#new_football_defense_stat').on('submit', function(e){

        //Check if there is any input field empty and stops the submit event
        var errorCount = 0;
        $('#new_football_defense_stat input').each(function(){
            var $this = $(this);
            if($this.val() == ''){

                errorCount = errorCount + 1;
            }
        });

        if(errorCount != 0) {
            e.preventDefault();
            alert("You must complete all the fields.");
        }


    });


    // Load add football defense stat window on click
    $('.add_football_defense_stat_button').click(function (e) {
        $('.add_football_defense_stat_window').modal(
            {
                containerCss: {
                    height: 450,
                    width: 920
                }
            });

        return false;
    });
});
