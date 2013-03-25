class FootballDefenseStatsController < ApplicationController

  before_filter :signed_in_user

  def create
    @football_defense_stat = current_user.football_defense_stats.new(params[:football_defense_stat])

    @football_defense_stat.total_tackles = @football_defense_stat.solo_tackles.to_i + @football_defense_stat.assisted_tackles.to_i
    @football_defense_stat.average_intercepted_return_yards = @football_defense_stat.intercepted_returned_yards.to_f/(@football_defense_stat.interceptions.to_i.nonzero? || 10000)

    @football_defense_stat.status = "Active"

    if @football_defense_stat.save
      flash[:success] = "The stat was successfully added!"
      redirect_to user_path(current_user.id, tab:"Football")
    else
      flash[:error] = "We're sorry but we encountered an error while adding your stat."
      redirect_to user_path(current_user.id, tab:"Football")
    end

  end



  def edit

    @football_defense_stat = current_user.football_defense_stats.find(params[:id])

    respond_to do | format |
      format.js
    end

  end



  def update

    @football_defense_stat = current_user.football_defense_stats.find(params[:id])

    if @football_defense_stat.update_attributes(params[:football_defense_stat])

      #Update all the necessary fields
      @football_defense_stat.update_attribute(:total_tackles, @football_defense_stat.solo_tackles.to_i + @football_defense_stat.assisted_tackles.to_i )
      @football_defense_stat.update_attribute(:average_intercepted_return_yards, @football_defense_stat.intercepted_returned_yards.to_f/(@football_defense_stat.interceptions.to_i.nonzero? || 10000) )

      flash[:success] = "Stat updated"
      redirect_to user_path(current_user.id, tab:"Football")

    else
      flash[:error] = "There was an error editing your stat"
      redirect_to user_path(current_user.id, tab:"Football")

    end

  end


  def destroy
    FootballDefenseStat.find(params[:id]).update_attribute(:status, "deleted")

    redirect_to user_path(current_user.id, tab:"Football")

  end

end
