module SportizationsHelper

  #Returns the positions of a given sport which the user hasn't chosen yet.
  def positions_not_already_chosen(sport)

    if sport.name == "Basketball"

      #Get the basketball sportizations, which should include one with blank position and the other with
      #one specified position
      sportizations = @user.sportizations.find_all_by_sport_id(sport.id)

      #Boolean if there is already a sportization for basketball with a position (only one position is allowed for basketball)
      position_has_been_chosen = false
      sportizations.each do |sportization|
      if sportization.position != ""
        position_has_been_chosen = true
      end
      end

      #If there is a sportization for basketball with a position already, return blank
      #Which in turn causes the form for basketball positions to not show in the view
      if position_has_been_chosen
        return ""
      #Else, return an array of positions for the form
      else
        return ["Guard", "Forward", "Center"]
      end


    #Goes through every football sportization and deletes the positions already chosen from the array of positions
    elsif sport.name == "Football"

      football_positions = ["Quarterback","Runningback","Receiver", "Tight end", "Defensive tackle","Defensive end","Middle linebacker","Outside linebacker", "Cornerback", "Safety"]

      #Get the basketball sportizations, which should include one with blank position and the others with
      #any given position
      sportizations = @user.sportizations.find_all_by_sport_id(sport.id)

      sportizations.each do |sportization|


        #We check all the positions already chosen by the user and delete them from the array of all football positions
        #The resulting array is all the positions the user has not chosen

        if sportization.position == "Quarterback"

          football_positions.delete("Quarterback")


        elsif sportization.position == "Receiver" or sportization.position == "Tight end"

          football_positions.delete("Receiver")
          football_positions.delete("Tight end")


        elsif sportization.position == "Runningback"

          football_positions.delete("Runningback")


        elsif sportization.position == "Defensive tackle" or sportization.position == "Defensive end" or sportization.position == "Middle linebacker" or sportization.position == "Outside linebacker" or sportization.position == "Cornerback" or sportization.position == "Safety"

          football_positions.delete("Defensive tackle")
          football_positions.delete("Defensive end")
          football_positions.delete("Middle linebacker")
          football_positions.delete("Outside linebacker")
          football_positions.delete("Defensive tackle")
          football_positions.delete("Cornerback")
          football_positions.delete("Safety")


        end

      end

      #Return the array of football positions which haven't been chosen already for the form
      return football_positions

    end


  end

end
