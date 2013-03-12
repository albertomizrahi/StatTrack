$(document).ready(function(){


    $('#new_football_runningback_stat').on('submit', function(e){

        //Check if there is any input field empty and stops the submit event
        var errorCount = 0;
        $('#new_football_runningback_stat input').each(function(){
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
});
